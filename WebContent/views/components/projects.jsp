<%@ page import="daoImp.ProyectosDaoImp" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<label for="selectProject">Proyecto</label>
<select id="selectProject" name="id_proyecto" class="selectpicker mr-sm-2" data-live-search="true">
    <option value="0" hidden>Elegir proyecto</option>

    <%
        List<Map<String, String>> projects = null;
        try {
            projects = ProyectosDaoImp.getInstance().findAll();
        } catch (Exception e) {
            e.printStackTrace();
        }
        request.setAttribute("projects", projects);
    %>

    <c:forEach items="${requestScope.projects}" var="project">
        <option data-icon="fas fa-user" value="${project['id']}"><c:out value="${project['nombre_proyecto']}"/></option>
    </c:forEach>
</select>
