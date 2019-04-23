<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:url var="url" value="/Usuario"/>
<c:set var="uriAdd" scope="application" value="Usuario?action=add"/>

<%-- Header --%>
<jsp:include page="../components/header.jsp"/>

<%-- navbar --%>
<jsp:include page="../components/navbar.jsp"/>

<div class="content">
	<div class="container-fluid col-10 offset-1">
		<div class="row">
			<div class="col-12">
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item active"><a href="Proyectos?action=index">Usuario</a></li>
					</ol>
				</nav>
			</div>
		</div>
		<div id="buttons_crud">
			<a href="${uriAdd}" class="btn btn-outline-primary" role="button" aria-pressed="true">
				<i class="fas fa-plus"></i>
			</a>
		</div>
	
		<table id="dtableUser" class="table table-striped table-hover" style="width:100%">
			<thead>
			<tr>
				<th>ID</th>
				<th>Nombres</th>
				<th>Apellidos</th>
				<th>Email</th>
				<th>Username</th>
				<th>Tipo Usuario</th>
				<th>Acciones</th>
			</tr>
			</thead>
	
			<tbody>
			<c:forEach items="${listUsuarios}" var="item">
				<tr>
					<td><c:out value="${item['id']}"/></td>
					<td><c:out value="${item['nombres']}"/></td>
					<td><c:out value="${item['apellidos']}"/></td>
					<td><c:out value="${item['email']}"/></td>
					<td><c:out value="${item['username']}"/></td>
					<td><c:out value="${item['tipo_usuario']}"/></td>
					<td>
						<div class="btn-group">
							<form action="${url}" method="POST">
								<input type="hidden" name="redirect" value="true">
								<input type="hidden" name="option" value="update">
	
								<input type="hidden" name="id" value="${item['id']}">
								<input type="hidden" name="nombres" value="${item['nombres']}">
								<input type="hidden" name="apellidos" value="${item['apellidos']}">
								<input type="hidden" name="email" value="${item['email']}">
								<input type="hidden" name="username" value="${item['username']}">
								<input type="hidden" name="id_tipo_usuario" value="${item['id_tipo_usuario']}">
	
								<button type="submit" class="btn btn-outline-primary">
									<i class="fas fa-pen"></i>
								</button>
							</form>
	
							<form action="${url}" method="POST">
								<input type="hidden" name="redirect" value="true">
								<input type="hidden" name="option" value="delete">
	
								<input type="hidden" name="id" value="${item['id']}">
								<input type="hidden" name="nombres" value="${item['nombres']}">
								<input type="hidden" name="apellidos" value="${item['apellidos']}">
	
								<button type="submit" class="btn btn-outline-danger">
									<i class="fas fa-trash"></i>
								</button>
							</form>
						</div>
					</td>
				</tr>
			</c:forEach>
			</tbody>
	
			<tfoot>
			<tr>
				<th>ID</th>
				<th>Nombres</th>
				<th>Apellidos</th>
				<th>Email</th>
				<th>Username</th>
				<th>Tipo Usuario</th>
				<th>Acciones</th>
			</tr>
			</tfoot>
		</table>
	</div>
</div>

<%-- Footer --%>
<jsp:include page="../components/footer.jsp"/>
