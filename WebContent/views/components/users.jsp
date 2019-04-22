<%@ page import="java.util.Map" %>
<%@ page import="daoImp.UsuarioDaoImp" %>
<%@ page import="java.util.List" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<label for="selectUsuario">Usuario</label>
<select id="selectUsuario" name="usuario" class="selectpicker mr-sm-2" data-live-search="true">
    <%
        List<Map<String, String>> users = null;
        try {
            users = UsuarioDaoImp.getInstance().findAllUsuario();
        } catch (Exception e) {
            e.printStackTrace();
        }
        request.setAttribute("users", users);
    %>

    <option value="0" hidden>Elegir usuario</option>
    <c:forEach items="${requestScope.users}" var="user">
        <option data-icon="fas fa-user" value="${user['id']}"><c:out value="${user['nombres']}, ${user['apellidos']}"/></option>
    </c:forEach>
</select>
