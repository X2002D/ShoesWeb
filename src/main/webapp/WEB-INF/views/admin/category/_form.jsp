<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-body">
				<div class="row">
					<div class="col-lg-6">
						<form:form action="${base}/index" modelAttribute="entity" role="form">
							<div class="form-group">
								<label>Hãng giày:</label>
								<form:input path="name" class="form-control" required="required" />
							</div>
							<div class="form-group">
								<label>Dòng giày:</label>
								<form:input path="nameVN" class="form-control" />
							</div>
							<div class="form-group">
								<button class="btn btn-primary" formaction="${base}/create" style="width: 90px; font-family: Verdana, Geneva, Tahoma, sans-serif;">Tạo</button>
								<a class="btn btn-default" href="${base}/index" style="width: 90px; font-family: Verdana, Geneva, Tahoma, sans-serif;">Làm mới</a>
							</div>

						</form:form>
					</div>
					<!-- /.col-lg-6 (nested) -->
				</div>
				<!-- /.row (nested) -->
			</div>
			<!-- /.panel-body -->
		</div>
		<!-- /.panel -->
	</div>
	<!-- /.col-lg-12 -->
</div>