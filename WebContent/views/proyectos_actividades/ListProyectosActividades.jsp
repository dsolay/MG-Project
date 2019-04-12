<%--
  Created by IntelliJ IDEA.
  User: ernest
  Date: 4/8/19
  Time: 7:20 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%--header--%>
<jsp:include page="../components/header.jsp"/>

<c:set var="url" scope="application" value="/ProyectosActividades"/>
<c:set var="map" scope="application" value="${list}"/>
<c:set var="thead" scope="application" value="${['ID', 'Proyecto', 'Actividad', 'Username', 'Entrega', 'Restante', 'Prioridad', 'Estado']}"/>

 <%--Datatable--%>
<jsp:include page="../components/datatable.jsp"/>

<%-- footer--%>
<jsp:include page="../components/footer.jsp"/>
