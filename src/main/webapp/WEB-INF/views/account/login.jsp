<%@ page pageEncoding="utf-8"%>

<br/>
<div class="container">
	<div class="dang-nhap">
		<h2 style="text-align: center; margin-bottom: 20px;">ĐĂNG NHẬP</h2>
		<h4  class="label label-success">${message}</h4>
		<form action="/account/login" method="post">
			<div class="form-group">
				<label>Tên đăng nhập:</label> <input name="id" class="form-control"
					value="${uid}" />
			</div>
			<div class="form-group">
				<label>Mật khẩu:</label> <input name="pw" type="password"
					class="form-control" value="${pwd}" />
			</div>
			<div class="form-group">
				<input name="rm" type="checkbox" /> <label>Nhớ mật khẩu?</label>
			</div>
			<div class="form-group">
				<button class="btn btn-success" style="width: 150px; margin-left: 135px; ;font-family: Verdana, Geneva, Tahoma, sans-serif;">Đăng nhập</button>
			</div>
			<div class="dang-ky">
			    <a style="margin-left: 110px;">Bạn chưa có tài khoản?</a>
			    <a href="/account/register" style="">Đăng ký</a>
			</div>
		</form>
	</div>
</div>
<br/>
<br/>

<style>
.dang-nhap{
	background-color: white;
	padding: 30px 120px;
	margin: 0 auto;
	width: 60%;
	border-radius: 10px;
}
</style>