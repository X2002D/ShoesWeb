<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>


<c:set var="cart" value="${sessionScope['scopedTarget.cartService']}" />
<br />
<div class="row">
	<div class="col-sm-9">
		<div class="ct1">
			<!-- SHOP PRODUCTS -->
			<div class="row">
				<div class="col-sm-5">

					<div class="product-image">
						<img src="/static/images/products/${prod.image}"
							title="${prod.name}" style="border-radius: 10px;">
					</div>
				</div>
				<div class="col-sm-7">
					<div class="san-pham-ct">
						<h3 style="color: black; font-weight: bold; text-align: left;">
							${prod.name}</h3> 
						<p>
							Thương hiệu: <b>${prod.category.name}</b> &emsp; | &emsp; SKU: ${prod.id} &emsp; | &emsp; Lượt xem: ${prod.viewCount}
						</p>
						
						<br /> <a href="/product/detail/${prod.id}"> <c:choose>
								<c:when test="${prod.discount > 0 }">
									<p
										style="background-color: red; width: 30px; height: 30px; text-align: right; float: right; position: relative; border-radius: 30px; margin-right: 110px">
										<span
											style="margin-left: -28px; margin-top: 5px; font-size: 14px; color: #fff; position: absolute;">
											-<f:formatNumber value="${prod.discount}" type="percent" />
										</span>
									</p>
								</c:when>
								<c:otherwise>

								</c:otherwise>
							</c:choose>


						</a>
						<p style="padding: 3px; font-size: 20px; font-weight: bold;">
							<c:choose>
								<c:when test="${prod.discount <= 0 }">
									<span style="text-align: left; font-weight: bold; color: red; font-size: 25px;"><f:formatNumber
											value="${prod.unitPrice}" pattern="#,###" />₫</span>
								</c:when>
								<c:otherwise>
									<span
										style="text-decoration: line-through; color: Gray; font-weight: bold;">
										<f:formatNumber value="${prod.unitPrice}" pattern="#,###" />₫
									</span>
								</c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${prod.discount > 0 }">
									<span style="margin-left: 5px; font-weight: bold; color: red">
										<f:formatNumber
											value="${prod.unitPrice * (1 - prod.discount)}"
											pattern="#,###" /> VNĐ
									</span>
								</c:when>
								<c:otherwise>

								</c:otherwise>
							</c:choose>
						</p>
						<p>
							Tình trạng: <span
								style="background-color: lightgray; border-radius: 4px; padding: 3px; color: black; font-weight: bold;">${prod.available?'Còn hàng':'Hết hàng'}</span>
						</p>
                        <br>
                        <p>
                        Size:
                        
                        <select id="size">
						   <option value="39">39</option>
						   <option value="40">40</option>
						   <option value="41">41</option>
						   <option value="41.5">41.5</option>
						   <option value="42">42</option>
						   <option value="42.5">42.5</option>
						</select>
					    </p>
						<br>
						<br>
						<div class="row">
							<div class="col-sm-6" data-id="${prod.id}">
								<button class="theo-vao-gio btn-add-to-carts"
									data-toggle="modal" data-target="#myModals">THÊM VÀO GIỎ HÀNG</button>
							</div>

						</div>

					</div>
					<br>

				</div>
			</div>
		</div>
		<div class="sp-km">
			<p>${prod.description}</p>

		</div>
	</div>


	<!-- /SHOP PRODUCTS -->



</div>
</div>


<br>


<!-- SP tương tự -->
<div class="container-fluid" style="padding: 0px 80px 0px 80px">
	<ul class="nav nav-tabs">
		<li class="active"><a data-toggle="tab" href="#tab1">Sản phẩm cùng loại</a></li>
		<li><a data-toggle="tab" href="#tab2">Sản phẩm yêu thích</a></li>
		<li><a data-toggle="tab" href="#tab3">Sản phẩm đã xem</a></li>
	</ul>

	<div class="tab-content">
		<div id="tab1" class="tab-pane fade in active">
			<div>
				<c:forEach var="p" items="${list}" begin="0" end="7">
					<div class="col-sm-3" style="padding: 5px 5px 5px 5px">
						<div class="thumbnail" style="border-radius: 7px;">

							<a href="/product/detail/${p.id}"> <c:choose>
									<c:when test="${p.discount > 0 }">
										<p
											style="background-color: red; width: 30px; height: 30px; text-align: right; float: right; position: relative; border-radius: 30px">
											<span
												style="margin-left: -28px; margin-top: 5px; font-size: 14px; color: #fff; position: absolute;">
												-<f:formatNumber value="${p.discount}" type="percent" />
											</span>
										</p>
									</c:when>
									<c:otherwise>

									</c:otherwise>
								</c:choose> <img style="margin-right: 30px; margin-top: 5px; border-radius: 7px;"
								class="estore-prod" src="/static/images/products/${p.image}"
								title="${p.name}">
							</a>

							<div class="caption">
								<p style="padding: 3px; text-align: center; color: black">
									<b>${p.name}</b>
								</p>
								<p
									style="padding: 3px; font-size: 15px; text-align: center; font-weight: bold;">
									<c:choose>
										<c:when test="${p.discount <= 0 }">
											<span style="text-align: left; font-weight: bold; color: red"><f:formatNumber
													value="${p.unitPrice}" pattern="#,###" />₫ </span>
										</c:when>
										<c:otherwise>
											<span
												style="text-decoration: line-through; color: Gray; font-weight: bold;">
												<f:formatNumber value="${p.unitPrice}" pattern="#,###" />
												VNĐ
											</span>
										</c:otherwise>
									</c:choose>
									<c:choose>
										<c:when test="${p.discount > 0 }">
											<span style="margin-left: 5px; font-weight: bold; color: red">
												<f:formatNumber value="${p.unitPrice * (1 - p.discount)}"
													pattern="#,###" /> VNĐ
											</span>
										</c:when>
										<c:otherwise>

										</c:otherwise>
									</c:choose>

								</p>
								<br /> <br />
								<div data-id="${p.id}" class="pull-center text-center">
									<button class="btn btn-sm btn-danger btn-add-to-cart">
										<i class="glyphicon glyphicon-shopping-cart"></i>
									</button>
									<button class="btn btn-sm btn-secondary btn-star">
										<i class="fa fa-thumbs-up"></i>
									</button>
									<button class="btn btn-sm btn-success btn-open-dialog"
										data-toggle="modal" data-target="#myModal">
										<i class="glyphicon glyphicon-envelope"></i>
									</button>
								</div>
							</div>


						</div>
					</div>

				</c:forEach>


				<jsp:include page="dialog.jsp" />
			</div>
		</div>
		<div id="tab2" class="tab-pane fade">
			<div>
				<c:forEach var="p" items="${favo}" begin="0" end="7">
					<div class="col-sm-3" style="padding: 5px 5px 5px 5px">
						<div class="thumbnail" style="border-radius: 7px">

							<a href="/product/detail/${p.id}"> <c:choose>
									<c:when test="${p.discount > 0 }">
										<p
											style="background-color: red; width: 30px; height: 30px; text-align: right; float: right; position: relative; border-radius: 30px">
											<span
												style="margin-left: -28px; margin-top: 5px; font-size: 14px; color: #fff; position: absolute;">
												-<f:formatNumber value="${p.discount}" type="percent" />
											</span>
										</p>
									</c:when>
									<c:otherwise>

									</c:otherwise>
								</c:choose> <img style="margin-right: 30px; margin-top: 5px; border-radius: 7px;"
								class="estore-prod" src="/static/images/products/${p.image}"
								title="${p.name}">
							</a>

							<div class="caption">
								<p style="padding: 3px; text-align: center; color: black">
									<b>${p.name}</b>
								</p>
								<p
									style="padding: 3px; font-size: 15px; text-align: center; font-weight: bold;">
									<c:choose>
										<c:when test="${p.discount <= 0 }">
											<span style="text-align: left; font-weight: bold; color: red"><f:formatNumber
													value="${p.unitPrice}" pattern="#,###" />₫ </span>
										</c:when>
										<c:otherwise>
											<span
												style="text-decoration: line-through; color: Gray; font-weight: bold;">
												<f:formatNumber value="${p.unitPrice}" pattern="#,###" />
												VNĐ
											</span>
										</c:otherwise>
									</c:choose>
									<c:choose>
										<c:when test="${p.discount > 0 }">
											<span style="margin-left: 5px; font-weight: bold; color: red">
												<f:formatNumber value="${p.unitPrice * (1 - p.discount)}"
													pattern="#,###" /> VNĐ
											</span>
										</c:when>
										<c:otherwise>

										</c:otherwise>
									</c:choose>

								</p>
								<br /> <br />
								<div data-id="${p.id}" class="pull-center text-center">
									<button class="btn btn-sm btn-danger btn-add-to-cart">
										<i class="glyphicon glyphicon-shopping-cart"></i>
									</button>
									<button class="btn btn-sm btn-warning btn-star">
										<i class="glyphicon glyphicon-star"></i>
									</button>
									<button class="btn btn-sm btn-success btn-open-dialog"
										data-toggle="modal" data-target="#myModal">
										<i class="glyphicon glyphicon-envelope"></i>
									</button>
								</div>
							</div>


						</div>
					</div>

				</c:forEach>


				<jsp:include page="dialog.jsp" />
			</div>
		</div>
		<div id="tab3" class="tab-pane fade">
			<div>
				<c:forEach var="p" items="${viewed}" begin="0" end="7">
					<div class="col-sm-3" style="padding: 5px 5px 5px 5px">
						<div class="thumbnail" style="border-radius: 7px;">

							<a href="/product/detail/${p.id}"> <c:choose>
									<c:when test="${p.discount > 0 }">
										<p
											style="background-color: red; width: 30px; height: 30px; text-align: right; float: right; position: relative; border-radius: 30px">
											<span
												style="margin-left: -28px; margin-top: 5px; font-size: 14px; color: #fff; position: absolute;">
												-<f:formatNumber value="${p.discount}" type="percent" />
											</span>
										</p>
									</c:when>
									<c:otherwise>

									</c:otherwise>
								</c:choose> <img style="margin-right: 30px; margin-top: 5px; border-radius: 7px;"
								class="estore-prod" src="/static/images/products/${p.image}"
								title="${p.name}">
							</a>

							<div class="caption">
								<p style="padding: 3px; text-align: center; color: black">
									<b>${p.name}</b>
								</p>
								<p
									style="padding: 3px; font-size: 15px; text-align: center; font-weight: bold;">
									<c:choose>
										<c:when test="${p.discount <= 0 }">
											<span style="text-align: left; font-weight: bold; color: red"><f:formatNumber
													value="${p.unitPrice}" pattern="#,###" />₫ </span>
										</c:when>
										<c:otherwise>
											<span
												style="text-decoration: line-through; color: Gray; font-weight: bold;">
												<f:formatNumber value="${p.unitPrice}" pattern="#,###" />
												VNĐ
											</span>
										</c:otherwise>
									</c:choose>
									<c:choose>
										<c:when test="${p.discount > 0 }">
											<span style="margin-left: 5px; font-weight: bold; color: red">
												<f:formatNumber value="${p.unitPrice * (1 - p.discount)}"
													pattern="#,###" /> VNĐ
											</span>
										</c:when>
										<c:otherwise>

										</c:otherwise>
									</c:choose>

								</p>
								<br /> <br />
								<div data-id="${p.id}" class="pull-center text-center">
									<button class="btn btn-sm btn-danger btn-add-to-cart">
										<i class="glyphicon glyphicon-shopping-cart"></i>
									</button>
									<button class="btn btn-sm btn-warning btn-star">
										<i class="glyphicon glyphicon-star"></i>
									</button>
									<button class="btn btn-sm btn-success btn-open-dialog"
										data-toggle="modal" data-target="#myModal">
										<i class="glyphicon glyphicon-envelope"></i>
									</button>
								</div>
							</div>


						</div>
					</div>

				</c:forEach>

			</div>
		</div>

	</div>
	<br />

	<jsp:include page="dialog.jsp" />
</div>
</div>

<br />


<jsp:include page="dialog_cart.jsp" />
<style>



.thumbnail:hover {
	box-shadow: 0px 0px 7px;
}

.pull-center {
	margin-top: -30px;
}

.caption {
	height: 150px
}

.mua-ngay {
	border-radius: 5px;
	padding: 5px 10px;
	text-align: center;
	background-color: rgb(20, 53, 195);
	border: none;
	color: #fff;
	font-weight: 800;
	width: 100%;
	font-size: 18px;
}

.theo-vao-gio {
	border-radius: 8px;
	padding: 8px;
	text-align: center;
	background-image: linear-gradient(-90deg, rgb(0, 128, 0), rgb(0, 128, 0));
	border: none;
	color: #fff;
	font-weight: 700;
	width: 100%;
	font-size: 18px;
}
.theo-vao-gio:hover{
    background-image: linear-gradient(-90deg, rgb(192, 192, 192), rgb(192, 192, 192));
    color: black;
    transition: 1.5s;
}

.ct1 {
	background-color: #fff;
	padding: 30px 40px;
	border-radius: 10px;
}

.ct2 {
	background-color: #fff;
	padding: 30px 20px;
	border-radius: 10px;
}

.product-image img {
	width: 100%;
	height: 100%;
}

.sp-km {
	padding-top: 15px;
	border-top: 1px dotted green;
	padding: 15px 0px 10px 15px
}

.sp-km li {
	font-size: 15px;
}

.sp-km p {
	font-size: 15px;
	line-height: 16px;
}

.sp-km i {
	font-size: 14px;
	line-height: 16px;
}

.sp-km .ico {
	color: #0c78aa;
}

.san-pham-ct p {
	margin-top: -5px;
	color: #616060;
}

.san-pham-ct b {
	color: #076692;
}

.san-pham-ct u {
	color: #fa0606;
	font-weight: bold;
	font-size: x-large;
}
</style>