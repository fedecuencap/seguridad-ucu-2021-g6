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

    <title>Registrate</title>
	<link rel="icon" type="image/ico" href="/static/img/favicon.ico">

    <!-- Custom fonts for this template-->
    <link href="/static/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="/static/vendor/glyphicons-only-bootstrap/css/bootstrap.min.css">
	<link href="/static/vendor/bootstrap-datepicker-1.9.0/css/bootstrap-datepicker.css" rel="stylesheet">
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
                                    <form:form modelAttribute="registroViewModel" id="myForm" action="registro" method="post" enctype="multipart/form-data" data-fv-framework="bootstrap" class="user">
                                        <div class="form-group">
											<spring:bind path="username">
												<label for="username">Usuario:</label>
												<form:input id="username" path="username" autocomplete="off" type="text" required="required" class="form-control form-control-user" pattern="^((?=.*[A-Za-z0-9])).{0,50}$" placeholder="Ingrese su nombre de usuario" data-error="Solamente se permiten dígitos y letras"/>
						                        <div class="help-block with-errors"></div>
											</spring:bind>
                                        </div>
                                        <div class="form-group">
											<spring:bind path="nombre">
												<label for="nombre">Nombre:</label>
												<form:input id="nombre" path="nombre" autocomplete="off" type="text" required="required" class="form-control form-control-user" placeholder="Ingrese su nombre" data-error="Este campo es obligatorio"/>
						                        <div class="help-block with-errors"></div>
											</spring:bind>
                                        </div>
                                        <div class="form-group">
											<spring:bind path="email">
												<label for="email">Email:</label>
												<form:input id="email" path="email" autocomplete="off" type="email" required="required" class="form-control form-control-user" placeholder="Ingrese su email" data-error="Este campo es obligatorio, verifique que se encuentra bien ingresado"/>
						                        <div class="help-block with-errors"></div>
											</spring:bind>
                                        </div>
                                        <div class="form-group">
											<spring:bind path="username">
												<label for="fnac">Fecha de nacimiento:</label>
												<form:input id="fnac" path="fnac" autocomplete="off" type="text" required="required" class="form-control form-control-user" placeholder="dd/mm/yyyy" data-date-format="dd/mm/yyyy" data-error="Este campo es obligatorio y tienes que ser mayor de 12 años"/>
						                        <div class="help-block with-errors"></div>
											</spring:bind>
                                        </div>
                                        <div class="form-group">
											<spring:bind path="password">
												<label for="password">Password:</label>
												<form:input id="password" path="password" autocomplete="off" type="password" required="required" class="form-control form-control-user" pattern="^((?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%&*])).{0,20}$" placeholder="Ingrese una password que cumpla con los requisitos" data-error="Ingrese una password que cumpla con los requisitos" />
						                        <div class="help-block with-errors"></div>
											</spring:bind>
                                        </div>
                                        <div class="form-group">
											<spring:bind path="confirmPassword">
												<label for="confirmPassword">Confirmaci&oacute;n Password:</label>
												<form:input id="confirmPassword" path="confirmPassword" autocomplete="off" type="password" data-match="#password" required="required" class="form-control form-control-user" placeholder="Ingrese nuevamente su password seleccionada" data-error="Ingrese nuevamente su password seleccionada"/>
						                        <div class="help-block with-errors"></div>
											</spring:bind>
                                        </div>
					                   <div class="form-group">
					                        <label class="information"><span class="glyphicon glyphicon-ok-circle" id="checkCaracteres"></span> 8 - 16 caracteres</label>
					                    </div>
					                    <div class="form-group">
					                        <label class="information"><span class="glyphicon glyphicon-ok-circle" id="checkMayuscula"></span> M&iacute;nimo 1 letra may&uacute;scula</label>
					                    </div>
					                    <div class="form-group">
					                        <label class="information"><span class="glyphicon glyphicon-ok-circle" id="checkMinuscula"></span> M&iacute;nimo 1 letra min&uacute;scula</label>
					                    </div>
					                    <div class="form-group">
					                        <label class="information"><span class="glyphicon glyphicon-ok-circle" id="checkNumero"></span> M&iacute;nimo 1 n&uacute;mero</label>
					                    </div>
					                    <div class="form-group">
					                        <label class="information"><span class="glyphicon glyphicon-ok-circle" id="checkCaracterEspecial"></span> M&iacute;nimo 1 car&aacute;cter de la lista: <b>!@#$%&*</b></label>
					                    </div>
                                         <button type="submit" class="btn btn-primary btn-user btn-block">Confirmar</button>
                                        <a class="btn btn-secondary btn-user btn-block" href="/app/login">Cancelar</a>
                                    </form:form>
                                    <hr>
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
	<script src="/static/vendor/bootstrap-validator-0.11.9/validator.min.js"></script>
	<script src="/static/vendor/bootstrap-datepicker-1.9.0/js/bootstrap-datepicker.js"></script>
	<script src="/static/vendor/bootstrap-datepicker-1.9.0/locales/bootstrap-datepicker.es.min.js" charset="UTF-8"></script>

    <!-- Core plugin JavaScript-->
    <script src="/static/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="/static/js/sb-admin-2.min.js"></script>
    <script type="text/javascript">

    $(document).ready(function () {
    	    $('#myForm').validator();
        	$("#fnac").datepicker({
                startDate: '-120y',
                endDate: '-12y',
                maxDate: "-12y",
                language: 'es'
            });
            $("#password").change(function () {
                var containsNumber = /\d/.test($(this).val());
                var containsUppercase = /[A-Z]/.test($(this).val());
                var containsLowercase = /[a-z]/.test($(this).val());
                var sizePass = $(this).val().length;
                var isInLength = sizePass >= 8 && sizePass <= 16;
                var containsEspecialCharacter = /[!@#$%&*]/.test($(this).val());
                if(isInLength){
                    $('#checkCaracteres').removeClass('glyphicon-ok-circle');
                    $('#checkCaracteres').removeClass('glyphicon-remove-sign');
                    $('#checkCaracteres').addClass('glyphicon-ok-sign');
                    $('#checkCaracteres').css( "color", "green" );
                }else{
                    $('#checkCaracteres').removeClass('glyphicon-ok-circle');
                    $('#checkCaracteres').removeClass('glyphicon-ok-sign');
                    $('#checkCaracteres').addClass('glyphicon-remove-sign');
                    $('#checkCaracteres').css( "color", "#B31B12" );
                }
                if(containsUppercase){
                    $('#checkMayuscula').removeClass('glyphicon-ok-circle');
                    $('#checkMayuscula').removeClass('glyphicon-remove-sign');
                    $('#checkMayuscula').addClass('glyphicon-ok-sign');
                    $('#checkMayuscula').css( "color", "green" );
                }else{
                    $('#checkMayuscula').removeClass('glyphicon-ok-circle');
                    $('#checkMayuscula').removeClass('glyphicon-ok-sign');
                    $('#checkMayuscula').addClass('glyphicon-remove-sign');
                    $('#checkMayuscula').css( "color", "#B31B12" );
                }
                if(containsLowercase){
                    $('#checkMinuscula').removeClass('glyphicon-ok-circle');
                    $('#checkMinuscula').removeClass('glyphicon-remove-sign');
                    $('#checkMinuscula').addClass('glyphicon-ok-sign');
                    $('#checkMinuscula').css( "color", "green" );
                }else{
                    $('#checkMinuscula').removeClass('glyphicon-ok-circle');
                    $('#checkMinuscula').removeClass('glyphicon-ok-sign');
                    $('#checkMinuscula').addClass('glyphicon-remove-sign');
                    $('#checkMinuscula').css( "color", "#B31B12" );
                }
                if(containsNumber){
                    $('#checkNumero').removeClass('glyphicon-ok-circle');
                    $('#checkNumero').removeClass('glyphicon-remove-sign');
                    $('#checkNumero').addClass('glyphicon-ok-sign');
                    $('#checkNumero').css( "color", "green" );
                }else{
                    $('#checkNumero').removeClass('glyphicon-ok-circle');
                    $('#checkNumero').removeClass('glyphicon-ok-sign');
                    $('#checkNumero').addClass('glyphicon-remove-sign');
                    $('#checkNumero').css( "color", "#B31B12" );
                }
                if(containsEspecialCharacter){
                    $('#checkCaracterEspecial').removeClass('glyphicon-ok-circle');
                    $('#checkCaracterEspecial').removeClass('glyphicon-remove-sign');
                    $('#checkCaracterEspecial').addClass('glyphicon-ok-sign');
                    $('#checkCaracterEspecial').css( "color", "green" );
                }else{
                    $('#checkCaracterEspecial').removeClass('glyphicon-ok-circle');
                    $('#checkCaracterEspecial').removeClass('glyphicon-ok-sign');
                    $('#checkCaracterEspecial').addClass('glyphicon-remove-sign');
                    $('#checkCaracterEspecial').css( "color", "#B31B12" );
                }
            });
        });
    </script>

</body>

</html>
