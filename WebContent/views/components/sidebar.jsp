<%--
  Created by IntelliJ IDEA.
  User: ernest
  Date: 4/7/19
  Time: 1:25 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<nav id="sidebar">
    <div class="sidebar-header">
        <h3>Infusion Activity</h3>
    </div>

    <ul class="list-unstyled components">
        <li>
            <a href="Proyectos?action=index">Home</a>
        </li>
        <li class="active">
            <a href="Usuario?action=index" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">Usuarios</a>
            <ul class="collapse list-unstyled" id="homeSubmenu">
                <li>
                    <a href="TipoUsuario?action=index">Tipo de Usuario</a>
                </li>
            </ul>
        </li>
    </ul>
</nav>

