<%--
  Created by IntelliJ IDEA.
  User: ernest
  Date: 4/24/19
  Time: 1:01 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:url var="url" value="/Proyectos"/>

<div class="my-login-page col-6 offset-3">
    <section class="h-100">
        <div class="container h-100">
            <div class="row justify-content-md-center h-100">
                <div class="card-wrapper">
                    <div class="brand">
                        <img src="img/logo.jpg">
                    </div>
                    <div class="card fat">
                        <div class="card-body">
                            <h4 class="card-title">Login</h4>
                            <form method="POST" id="signup-form" action="${url}">

                                <input type="hidden" name="redirect" value="false">
                                <input type="hidden" name="option" value="login">

                                <div class="form-group">
                                    <label for="email">E-Mail</label>

                                    <input id="email" type="email" class="form-control" name="email" value="" required autofocus>
                                </div>

                                <div class="form-group">
                                    <label for="password">Contraseña
                                        <a href="./views/login/forgot.html" class="float-right">
                                            Olvide mi contraseña
                                        </a>
                                    </label>
                                    <input id="password" type="password" class="form-control" name="password" required data-eye>
                                </div>

                                <div class="form-group">
                                    <label>
                                        <input type="checkbox" name="remember"> Recordarme
                                    </label>
                                </div>

                                <div class="form-group no-margin">
                                    <button type="submit" class="btn btn-primary btn-block">
                                        Ingresar
                                    </button>
                                </div>
                                <div class="margin-top20 text-center">
                                    ¿No tienes una cuenta? <a href="./views/login/register.html">Crear una</a>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="footer">
                        <p>Copyright &copy; MG Project 2019</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
