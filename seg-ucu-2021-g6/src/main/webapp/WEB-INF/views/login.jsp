<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Ingresar</title>
	<link rel="icon" type="image/ico" href="/static/img/favicon.ico">

    <!-- Custom fonts for this template-->
    <link href="/static/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="/static/css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body class="bg-gradient-primary">

    <div class="container">

        <!-- Outer Row -->
        <div class="row justify-content-center">

            <div class="col-xl-10 col-lg-12 col-md-9">

                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-4">Seguridad UCU G6 2021</h1>
                                    </div>
									<!-- HEADER -->
									<jsp:include page="/WEB-INF/decorator/mensajes.jsp" />
                                    <form:form modelAttribute="loginViewModel" id="myForm" action="login" method="post" enctype="multipart/form-data" data-fv-framework="bootstrap" class="user">
                                        <div class="form-group">
											<spring:bind path="username">
												<label for="username">Usuario:</label>
												<form:input id="username" path="username" autocomplete="off" type="text" required="required" class="form-control form-control-user" placeholder="Usuario"/>
											</spring:bind>
                                        </div>
                                        <div class="form-group">
											<spring:bind path="password">
												<label for="password">Password:</label>
												<form:input id="password" path="password" autocomplete="off" type="password" required="required" class="form-control form-control-user" placeholder="Password"/>
											</spring:bind>
                                        </div>
                                        <button type="submit" class="btn btn-primary btn-user btn-block">Ingresar</button>
                                    </form:form>
                                    <hr>
                                    <div class="text-center">
                                        <a class="small" href="forgot-password.html">¿Olvidaste tu password?</a>
                                    </div>
                                    <div class="text-center">
                                        <a class="small" href="/app/registro">¡Registrate aquí!</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>

    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="/static/vendor/jquery/jquery.min.js"></script>
    <script src="/static/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="/static/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="/static/js/sb-admin-2.min.js"></script>

</body>

</html>
