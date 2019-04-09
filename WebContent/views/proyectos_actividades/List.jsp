<%--
  Created by IntelliJ IDEA.
  User: ernest
  Date: 4/8/19
  Time: 7:20 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>--%>

<%--header--%>
<jsp:include page="../components/header.jsp"/>

<div class="container-fluid">
    <div class="dtable">
    	<div id="buttons_crud" class="collapse">
    		<button id="bnew" type="button" class="btn btn-outline-primary">Nuevo</button>
		</div>
        <table id="pactividades" class="table table-striped table-hover" style="width:100%">
            <thead>
                <tr>
                	<c:forEach items="${requestScope.thead}" var="head">
                		<th scope="col"><c:out value="${head}"/></th>
                	</c:forEach>
                	
                	<th colspan="2">Acciones</th>
                </tr>
            </thead>
	            <tbody>
	            	<c:forEach items="${requestScope.list}" var="pa">
	                   	<tr>
	                       <td><c:out value="${pa['id']}"/></td>
	                       <td><c:out value="${pa['nombre_proyecto']}"/></td>
	                       <td><c:out value="${pa['nombre_actividad']}"/></td>
	                       <td><c:out value="${pa['username']}"/></td>
	                       <td><c:out value="${pa['fecha_creacion']}"/></td>
	                       <td><c:out value="${pa['fecha_entrega']}"/></td>
	
	                       <c:choose>
	                           <c:when test="${pa['units'] == 'Finalizada'}">
	                               <td><span class="badge badge-success"><c:out value="${pa['units']}"/></span></td>
	                           </c:when>
	                           <c:when test="${pa['units'] == 'dias' || pa['units'] == 'dia'}">
	                               <c:choose>
	                                   <c:when test="${pa['time'] > 3}">
	                                       <td><span class="badge badge-primary"><c:out value="${pa['time']} ${pa['units']}"/></span></td>
	                                   </c:when>
	                                   <c:when test="${pa['time'] > 1}">
	                                       <td><span class="badge badge-warning"><c:out value="${pa['time']} ${pa['units']}"/></span></td>
	                                   </c:when>
	                                   <c:when test="${pa['time'] == 1}">
	                                       <td><span class="badge badge-danger"><c:out value="${pa['time']} ${pa['units']}"/></span></td>
	                                   </c:when>
	                               </c:choose>
	
	                           </c:when>
	                       </c:choose>
	
	                       <td><c:out value="${pa['prioridad']}"/></td>
	
							<c:choose>
								<c:when test="${pa['estado'] == 1 }">
									<td><span class="badge badge-success">Activa</span></td>
								</c:when>
								<c:otherwise>
									<td><span class="badge badge-danger">No Activa</span></td>
								</c:otherwise>
							</c:choose>
	                       
							<td>
								<form action="<c:url value="/ProyectosActividades"/>" method="POST">
	                                <input type="hidden" name="redirect" value="true">
	                                <input type="hidden" name="option" value="update">
	                                <input type="hidden" name="id" value="${pa['id']}">
	                                <input type="hidden" name="proyecto" value="${pa['nombre_proyecto']}">
	                                <input type="hidden" name="actividad" value="${pa['nombre_actividad']}">
	  								<input type="hidden" name="username" value="${pa['username']}">
	                                <input type="hidden" name="fecha_entrega" value="${pa['fecha_entrega']}">
	                                <input type="hidden" name="prioridad" value="${pa['prioridad']}">
	                                <input type="hidden" name="estado" value="${pa['estado']}">
	                                <button id="bedit" type="submit" class="btn btn-outline-success">Editar</button>
								</form>
							</td>
							
							<td>
								<form action="<c:url value="/ProyectosActividades"/>" method="POST">
                                    <input type="hidden" name="redirect" value="true"><!-- input oculto -->
                                    <input type="hidden" name="option" value="delete"><!-- input oculto -->
               						<input type="hidden" name="id" value="${pa['id']}"><!-- input oculto -->
                                    <input type="hidden" name="firstName" value="${customer.first_name}"><!-- input oculto -->
                                    <button id="bedit" type="button" class="btn btn-outline-danger">Eliminar</button>
								</form>
							</td>
							
	                   </tr>
                	</c:forEach>
	            </tbody>
        </table>
    </div>
</div>

<%-- footer--%>
<jsp:include page="../components/footer.jsp"/>
