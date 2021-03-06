<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

	<title><sitemesh:write property="title" /></title>
	<link rel="icon" type="image/ico" href="/static/img/favicon.ico">

    <!-- Custom fonts for this template-->
    <link href="/static/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="/static/css/sb-admin-2.min.css" rel="stylesheet">
    <!-- Custom styles for this template-->
    <link href="/static/vendor/bootstrap-table/bootstrap-table.css" rel="stylesheet">

	<!-- PAGE JAVASCRIPT -->
	<sitemesh:write property="head" />

    <!-- Bootstrap core JavaScript-->
    <script src="/static/vendor/jquery/jquery.min.js"></script>
    <script src="/static/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="/static/vendor/jquery-easing/jquery.easing.min.js"></script>

	<script src="/static/vendor/bootstrap-table/bootstrap-table.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="/static/js/sb-admin-2.min.js"></script>

</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

		<!-- MENU -->
		<jsp:include page="/WEB-INF/decorator/menu.jsp" />

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

				<!-- HEADER -->
				<jsp:include page="/WEB-INF/decorator/header.jsp" />

                <!-- Begin Page Content -->
                <div class="container-fluid">

					<!-- HEADER -->
					<jsp:include page="/WEB-INF/decorator/mensajes.jsp" />
					<sitemesh:write property="body" />

                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

			<!-- FOOTER -->
			<jsp:include page="/WEB-INF/decorator/footer.jsp" />

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Pronto para irse?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">??</span>
                    </button>
                </div>
                <div class="modal-body">Seleccione "Salir" si quiere terminar su sesi&oacute;n.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <form action="/app/logout" method="post">
    					<input type="submit" value="Salir" class="btn btn-primary" />
					</form>	
                </div>
            </div>
        </div>
    </div>

	<sitemesh:write property="script" />
    

</body>
</html>
