package com.shoeweb.config;

import java.util.ArrayList;
import java.util.List;

public class PaymentMethod {
	public static String METHOD_PAYPAL="Paypal";
	public static String METHOD_VNPAY="VNPay";
	public static String METHOD_MONEY="Tiền mặt";
	
	public static String GET_METHOD(int id) {
		switch (id) {
		case 1:
			return METHOD_PAYPAL;
		case 2:
			return METHOD_VNPAY;
		case 3:
			return METHOD_MONEY;
		}
		return "";
	}
	
	public static List<String> LIST_PAYMENT() {
		List<String> listResult=new ArrayList<>();
		listResult.add(METHOD_PAYPAL);
		listResult.add(METHOD_VNPAY);
		listResult.add(METHOD_MONEY);
		return listResult;
	}
}
