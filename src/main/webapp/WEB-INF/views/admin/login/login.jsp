<%@ page pageEncoding="utf-8"%>


	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-50">
				<form class="login100-form validate-form" action="/admin/login" method="post">
					<span class="login100-form-title p-b-33">
						<b>ĐĂNG NHẬP</b>
					</span>
					<h8 style="color: red;padding:0px 0px 0px 20px">${message}</h8>
					<br/>
					<br/>
					<div class="wrap-input100 validate-input" style="border-radius: 10px;">
						<input class="input100" type="text" name="id" value="${uid}" placeholder="Tên đăng nhập" >
					</div>
                    <br/>
					<div class="wrap-input100 validate-input" data-validate="Password is required" style="border-radius: 10px;">
						<input class="input100" type="password" name="pw" value="${pwd}" placeholder="Mật khẩu" >
					</div>

					<br/>
					<div>
						<input name="rm" type="checkbox" /> <label>Nhớ mật khẩu?</label>
					</div>
				<div class="container-login100-form-btn m-t-20">
						<button class="login100-form-btn">
							Đăng nhập
						</button>
					</div>
				</form>
			</div>
		</div>
	</div>

<style>
    h8{
    margin-left: 67px;
    }
	.login100-form-btn{
	border-radius: 10px;	
	background-color: green;
	color:white;
	font-weight: bold;
	font-size: 25px
	}
	.login100-form-btn:hover{
	background-color: grey;
	color: black;
	}

</style>