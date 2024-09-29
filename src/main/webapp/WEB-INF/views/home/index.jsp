<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>

<c:set var="cart" value="${sessionScope['scopedTarget.cartService']}" />

	
    <div class="slideshow-container">
	  <div class="mySlides fade">
	    <div class="numbertext">1 / 3</div>
	    <img src="/static/images/nikejustdoit.jpg" style="width:1545px; height: 850px;">
	    <div class="text"></div>
	  </div>

	  <div class="mySlides fade">
	    <div class="numbertext">2 / 3</div>
	    <img src="/static/images/vans.png" style="width:1545px; height: 850px;">
	    <div class="text"></div>
	  </div>

	  <div class="mySlides fade">
	    <div class="numbertext">3 / 3</div>
	    <img src="/static/images/poster1.jpg" style="width:1545px; height: 850px;">
	    <div class="text"></div>
	  </div>
</div>
<br>
    
    
	<div class="gia-soc" style="margin-top: 30px">
		<div style="background-color: lightgray; width: 100.1%; margin-left: -1px; height: 65px; margin-top: -10px; font-weight: bold; padding: 13px">
			<span style="color: #fff; text-align: left; font-size: 26px; color: black;">SẢN PHẨM NỔI BẬT</span> 
			<span style="color: #fff; float: right; font-size: 16px; padding: 8px">
				<a href="/product/list-by-special/4" style="color: #fff; text-decoration: none; color: black;"> Xem tất cả</a></span>
		</div>
						

		<div style="padding: 20px 0px 0px 10px; margin-top: -10px; height: 420px;">

			<jsp:include page="../product/list_special.jsp" />
		</div>
	</div>

	
	<br><div class="mau" style="border: 1px solid #CE1212; height: 50px; background-color:#CE1212"></div>
	
	
	<div class="gia-soc" style="margin-top: 30px">
		<div
			style="background-color: lightgray; width: 100%; height: 65px; margin-top: -10px; font-weight: bold; padding: 13px">
			<span style="color: #fff; text-align: left; font-size: 26px; color: black;">SẢN PHẨM MỚI NHẤT</span> 
			<span style="color: #fff; float: right; font-size: 16px; padding: 8px;">
			<a href="/product/list-by-new/0" style="color: #fff; text-decoration: none; color: black;"> Xem tất cả</a></span>
		</div>
		<div class="row" style="padding: 20px; margin-top: -10px; height: 820px;">
			<jsp:include page="../product/list-by-new.jsp" />
		</div>
	</div>
	
		<br/>
		

<br>


<script>
let slideIndex = 0;
showSlides();

function showSlides() {
  let i;
  let slides = document.getElementsByClassName("mySlides");
  for (i = 0; i < slides.length; i++) {
    slides[i].style.display = "none";
  }
  slideIndex++;
  if (slideIndex > slides.length) {slideIndex = 1}
  slides[slideIndex-1].style.display = "block";
  setTimeout(showSlides, 2000); // Change image every 2 seconds
}
</script>


<style>
* {box-sizing:border-box}

/* Slideshow container */
.slideshow-container {
  max-width: 1000px;
  position: relative;
}

/* Hide the images by default */
.mySlides {
  display: none;
}

/* Next & previous buttons */
.prev, .next {
  cursor: pointer;
  position: absolute;
  top: 50%;
  width: auto;
  margin-top: -22px;
  padding: 16px;
  color: white;
  font-weight: bold;
  font-size: 18px;
  transition: 0.6s ease;
  border-radius: 0 3px 3px 0;
  user-select: none;
}

/* Position the "next button" to the right */
.next {
  right: 0;
  border-radius: 3px 0 0 3px;
}

/* On hover, add a black background color with a little bit see-through */
.prev:hover, .next:hover {
  background-color: rgba(0,0,0,0.8);
}

/* Caption text */
.text {
  color: #f2f2f2;
  font-size: 15px;
  padding: 8px 12px;
  position: absolute;
  bottom: 8px;
  width: 100%;
  text-align: center;
}

/* Number text (1/3 etc) */
.numbertext {
  color: #f2f2f2;
  font-size: 12px;
  padding: 8px 12px;
  position: absolute;
  top: 0;
}

/* The dots/bullets/indicators */
.dot {
  cursor: pointer;
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
}



/* Fading animation */
.fade {
  animation-name: fade;
  animation-duration: 1.8s;
}

@keyframes fade {
  from {opacity: .4}
  to {opacity: 1}
}





@font-face {
	font-family: 'icomoon';
	src: url('../fonts/icomoon.eot');
	src: url('../fonts/icomoon.eot?#iefix') format('embedded-opentype'),
		url('../fonts/icomoon.svg#icomoon') format('svg'),
		url('../fonts/icomoon.woff') format('woff'),
		url('../fonts/icomoon.ttf') format('truetype');
	font-weight: normal;
	font-style: normal;
}

/* Needed for a fluid height: */
html, body, .container, .main {
	height: 100%;
}

/* main wrapper */
.btn-change {
	width: 30px;
	height: 30px;
	position: absolute;
	margin-top: -250px;
	transform: translateY(-100%);
}

#next {
	right: 10px;
}

#prev {
	left: 10px;
}

.imgs {
	height: 100%;
	width: 100%
}

.cbp-contentslider {
	width: 100%;
	height: 100%;
	margin: 1em auto;
	position: relative;
	border: 1px solid rgb(214, 214, 214);
}

.cbp-contentslider>ul {
	list-style: none;
	height: 85%;
	width: 100%;
	overflow: hidden;
	position: relative;
	padding: 0;
	margin: 0;
}

.cbp-contentslider>ul li {
	position: absolute;
	width: 100%;
	height: 100%;
	left: 0;
	top: 0;
	background: #fff;
}

/* Whithout JS, we use :target */
.cbp-contentslider>ul li:target {
	z-index: 100;
}

.cbp-contentslider nav {
	position: absolute;
	bottom: 0;
	left: 0;
	right: 0;
	height: 3.313em;
	z-index: 1000;
	border-top: 1px solid rgb(243, 239, 233);
	overflow: hidden;
}

.cbp-contentslider nav button {
	float: left;
	display: block;
	width: 20%;
	height: 100%;
	font-weight: 400;
	letter-spacing: 0.1em;
	overflow: hidden;
	color: #47a3da;
	background: rgb(255, 255, 255);
	outline: none;
	text-align: center;
	line-height: 3;
	position: relative;
	padding-left: 3.125em;
	text-transform: uppercase;
	-webkit-transition: color 0.2s ease-in-out, background-color 0.2s
		ease-in-out;
	-moz-transition: color 0.2s ease-in-out, background-color 0.2s
		ease-in-out;
	transition: color 0.2s ease-in-out, background-color 0.2s ease-in-out;
}

.cbp-contentslider nav button span {
	display: block;
}

.cbp-contentslider nav button:last-child {
	border: none;
	box-shadow: 1px 0 #47a3da; /* fills gap caused by rounding */
}

.cbp-contentslider nav button:hover {
	text-decoration: none;
	border-bottom: 4px solid #47a3da;
}

.cbp-contentslider nav button.rc-active {
	background-color: #47a3da;
	color: #fff;
}

/* Iconfont for navigation and headings */
.cbp-contentslider [class^="icon-"]:before, .cbp-contentslider [class*=" icon-"]:before
	{
	font-family: 'icomoon';
	font-style: normal;
	text-align: center;
	speak: none;
	font-weight: normal;
	line-height: 2.5;
	font-size: 2em;
	position: absolute;
	left: 10%;
	top: 50%;
	margin: -1.250em 0 0 0;
	height: 2.500em;
	width: 2.500em;
	color: rgba(0, 0, 0, 0.1);
	-webkit-font-smoothing: antialiased;
}

/* Media queries */
@media screen and (max-width: 70em) {
	.cbp-contentslider p {
		font-size: 100%;
	}
}

@media screen and (max-width: 67.75em) {
	.cbp-contentslider {
		font-size: 85%;
	}
	.cbp-contentslider nav a[class^="icon-"]:before, .cbp-contentslider nav a[class*=" icon-"]:before
		{
		left: 50%;
		margin-left: -1.250em;
	}
	.cbp-contentslider nav a span {
		display: none;
	}
}

@media screen and (max-width: 43em) {
	.cbp-contentslider h3 {
		font-size: 2em;
	}
	.cbp-contentslider .cbp-content {
		-webkit-column-count: 1;
		-moz-column-count: 1;
		-o-column-count: 1;
		column-count: 1;
	}
	.cbp-contentslider li>div {
		top: 5em;
	}
}

@media screen and (max-width: 25em) {
	.cbp-contentslider nav a {
		padding: 0;
	}
	.cbp-contentslider h3[class^="icon-"]:before, .cbp-contentslider h3[class*=" icon-"]:before
		{
		display: none;
	}
}
</style>

