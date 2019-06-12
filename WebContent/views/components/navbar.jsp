<%--
  Created by IntelliJ IDEA.
  User: ernest
  Date: 4/7/19
  Time: 7:23 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<nav class="navbar navbar-expand-lg navbar-dark col-12" style="background-color: #29434e;">
   <%-- <a class="navbar-brand" href="#">
        <img src="img/infusion-activity.png" alt="">
    </a>--%>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <i class="fas fa-align-left"></i>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="Proyectos?action=index">Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Usuarios
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarUsuarios">
                    <a class="dropdown-item" href="Usuario?action=index">Usuario</a>
                    <a class="dropdown-item" href="TipoUsuario?action=index">Tipos de Usuario</a>
                </div>
            </li>
        </ul>
        <ul class="navbar-nav my-2 my-lg-0">
            <li class="nav-item dropdown">
                <button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <i class="fas fa-user-circle"></i>
                </button>
                <div class="dropdown-menu dropdown-menu-right">
                    <%--<a class="dropdown-item" href="#"><strong>Usuario</strong></a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="#">Perfil</a>
                    <div class="dropdown-divider"></div>--%>
                    <a id="logout" class="dropdown-item" href="#">Cerrar sesión</a>
                </div>
            </li>
        </ul>
    </div>
</nav>
