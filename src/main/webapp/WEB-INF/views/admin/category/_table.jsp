<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<!-- /.row -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">Bảng hiển thị dữ liệu</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<div class="dataTable_wrapper">
					<table class="table table-striped table-bordered table-hover" id="dataTables-example">
						<thead>
							<tr>
								
								<th>Hãng giày</th>
								<th>Dòng giày</th>
								<th>Thao tác</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="e" items="${list}">
								<tr class="odd gradeX">
									
									<td>${e.name}</td>
									<td>${e.nameVN}</td>
									<td>
										<a class="btn btn-sm btn-danger" href="${base}/delete/${e.id}">Xóa</a>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
