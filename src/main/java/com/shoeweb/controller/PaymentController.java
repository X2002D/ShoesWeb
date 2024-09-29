package com.shoeweb.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.TimeZone;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.paypal.api.payments.Links;
import com.paypal.api.payments.Payment;
import com.paypal.base.rest.PayPalRESTException;
import com.shoeweb.common.Utils;
import com.shoeweb.config.VNPayConfig;
import com.shoeweb.dao.OrderDAO;
import com.shoeweb.dao.OrderDetailDAO;
import com.shoeweb.dao.PaypalService;
import com.shoeweb.entity.Order;
import com.shoeweb.entity.OrderDetail;
import com.shoeweb.entity.Product;
import com.shoeweb.enums.PaypalPaymentIntent;
import com.shoeweb.enums.PaypalPaymentMethod;
import com.shoeweb.service.CartService;

@Controller
public class PaymentController {
	@Autowired
	private PaypalService paypalService;

	@Autowired
	CartService cart;

	@Autowired
	OrderDAO dao;

	@Autowired
	OrderDetailDAO orderDetailDAO;

	@PostMapping("order/checkout")
	public String pay(HttpServletRequest request, @ModelAttribute("order") Order order,
			@RequestParam("paymentMethod") Optional<Integer> paymentMethod)
			throws PayPalRESTException, UnsupportedEncodingException {		
		// Save đơn hàng
		Order oderSaved = dao.create(order);
		// Chi tiết đơn hàng
		Collection<Product> listProduct = cart.getItems();
		for (Product product : listProduct) {
			OrderDetail detail = new OrderDetail();
			detail.setOrder(order);
			detail.setProduct(product);
			detail.setUnitPrice(product.getUnitPrice());
			detail.setQuantity(product.getQuantity());
			detail.setDiscount(product.getDiscount());
			orderDetailDAO.create(detail);
		}

		cart.clear();
		Double totalMoney = order.getAmount();
		int orderId = oderSaved.getId();
		if (paymentMethod.get() == 2) {
			String urlReturn = Utils.getBaseURL(request) + "/order/paypal/status?orderId=" + orderId;
			Double total = Utils.round(totalMoney / 24000, 2);
			Payment payment = paypalService.createPayment(total, "USD", PaypalPaymentMethod.paypal,
					PaypalPaymentIntent.sale, "payment description", urlReturn, urlReturn);
			List<Links> list = payment.getLinks();
			for (Links links : payment.getLinks()) {
				if (links.getRel().equals("approval_url")) {
					return "redirect:" + links.getHref();
				}
			}
		} else if (paymentMethod.get() == 1) {
			String vnp_Version = "2.1.0";
			String vnp_Command = "pay";
			String vnp_TxnRef = VNPayConfig.getRandomNumber(8);
			String vnp_IpAddr = VNPayConfig.getIpAddress(request);
			double totalMoneyDouble = totalMoney;
			int amount = (int) totalMoneyDouble * 100;
			Map vnp_Params = new HashMap<>();
			// Phiên bản api mà merchant kết nối. Phiên bản hiện tại là : 2.1.0
			vnp_Params.put("vnp_Version", vnp_Version);
			// Mã API sử dụng, mã cho giao dịch thanh toán là: pay
			vnp_Params.put("vnp_Command", vnp_Command);
			// Mã website của merchant trên hệ thống của VNPAY. Mã được gửi về email
			vnp_Params.put("vnp_TmnCode", VNPayConfig.vnp_TmnCode);
			// Số tiền thanh toán * 100 đổi sang string. ví dụ 10,000đ, gửi 1000000
			vnp_Params.put("vnp_Amount", String.valueOf(amount));
			// Đơn vị tiền tệ sử dụng thanh toán. Hiện tại chỉ hỗ trợ VND
			vnp_Params.put("vnp_CurrCode", "VND");
//        // Mã phương thức thanh toán, mã loại ngân hàng hoặc ví điện tử thanh toán. Ví dụ:VNPAYQR,VNBANK (Nội địa), INTCARD (QT)
//        vnp_Params.put("vnp_BankCode", bank_code);
			vnp_Params.put("vnp_TxnRef", vnp_TxnRef);
			// vnp_OrderInfo là nội dung ck, ví dụ: Nap tien cho thue bao 0123456789. So
			// tien 100,000 VND
			vnp_Params.put("vnp_OrderInfo", "Thanh toan don hang ShoesWeb");

			// Mã danh mục hàng hóa. Mỗi hàng hóa sẽ thuộc một nhóm danh mục do VNPAY quy
			// định. Xem thêm bảng Danh mục hàng hóa
			// https://sandbox.vnpayment.vn/apis/docs/loai-hang-hoa/
			// 200000 là mã thời trang
			vnp_Params.put("vnp_OrderType", "200000");

			// Ngôn ngữ giao diện: vn hoặc en
			vnp_Params.put("vnp_Locale", "vn");

			// URL thông báo kết quả giao dịch khi Khách hàng kết thúc thanh toán
			vnp_Params.put("vnp_ReturnUrl", VNPayConfig.getUrlReturn(request, orderId));

			// Địa chỉ IP của khách hàng thực hiện giao dịch. Ví dụ: 13.160.92.202
			vnp_Params.put("vnp_IpAddr", vnp_IpAddr);

			Calendar cld = Calendar.getInstance(TimeZone.getTimeZone("Etc/GMT+7"));
			SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
			String vnp_CreateDate = formatter.format(cld.getTime());
			// Là thời gian phát sinh giao dịch định dạng yyyyMMddHHmmss (Time zone GMT+7)
			// Ví dụ: 20220101103111
			vnp_Params.put("vnp_CreateDate", vnp_CreateDate);

			cld.add(Calendar.MINUTE, 15);
			String vnp_ExpireDate = formatter.format(cld.getTime());
			// Thời gian hết hạn thanh toán GMT+7, định dạng: yyyyMMddHHmmss, ví dụ ở đây 15
			// phút
			vnp_Params.put("vnp_ExpireDate", vnp_ExpireDate);

			// Build data to hash and querystring
			List fieldNames = new ArrayList(vnp_Params.keySet());
			Collections.sort(fieldNames);
			StringBuilder hashData = new StringBuilder();
			StringBuilder query = new StringBuilder();
			Iterator itr = fieldNames.iterator();
			while (itr.hasNext()) {
				String fieldName = (String) itr.next();
				String fieldValue = (String) vnp_Params.get(fieldName);
				if ((fieldValue != null) && (fieldValue.length() > 0)) {
					// Build hash data
					hashData.append(fieldName);
					hashData.append('=');
					hashData.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
					// Build query
					query.append(URLEncoder.encode(fieldName, StandardCharsets.US_ASCII.toString()));
					query.append('=');
					query.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
					if (itr.hasNext()) {
						query.append('&');
						hashData.append('&');
					}
				}
			}
			String queryUrl = query.toString();
			String vnp_SecureHash = VNPayConfig.hmacSHA512(VNPayConfig.vnp_HashSecret, hashData.toString());
			queryUrl += "&vnp_SecureHash=" + vnp_SecureHash;
			String paymentUrl = VNPayConfig.vnp_PayUrl + "?" + queryUrl;
			return "redirect:" + paymentUrl;
		}
		return "redirect:/order/check-out/status?orderId=" + orderId;
	}

	@GetMapping("order/paypal/status")
	public String successPay(Model model, @RequestParam("paymentId") Optional<String> paymentId,
			@RequestParam("PayerID") Optional<String> payerId, @RequestParam Integer orderId) {
		// Check Login trước

		String result = "Paypal thất bại mã đơn hàng "+orderId;
		try {
			if (payerId.isPresent() && payerId.isPresent()) {
				Payment payment = paypalService.executePayment(paymentId.get(), payerId.get());
				if (payment.getState().equals("approved")) {
					result = "Paypal thành công với mã đơn hàng là "+orderId;
				}
			}

			model.addAttribute("result", result);
			return "order/result";
		} catch (PayPalRESTException e) {

		}
		return "redirect:/home";
	}

	@GetMapping("order/check-out/status")
	public String successPay(Model model, @RequestParam Integer orderId) {
		// Check Login trước

		String result = "Thanh toán tiền mặt mã đơn hàng "+orderId;

		model.addAttribute("result", result);
		return "order/result";
	}

	@GetMapping("order/vn-pay/status")
	public String vnPayStatus(Model model, @RequestParam Integer orderId,
			@RequestParam("vnp_ResponseCode") Optional<String> vnpResponseCode,
			@RequestParam("vnp_TransactionStatus") Optional<String> vnpTransactionStatus) {
		String result = "VNPay thất bại mã đơn hàng "+orderId;
		if (vnpResponseCode.isPresent() && vnpTransactionStatus.isPresent()) {
			if (vnpResponseCode.get().equals("00") && vnpTransactionStatus.get().equals("00")) {
				result = "VNPay thành công mã đơn hàng "+orderId;
			}
		}
		model.addAttribute("result", result);
		return "order/result";
	}
}
