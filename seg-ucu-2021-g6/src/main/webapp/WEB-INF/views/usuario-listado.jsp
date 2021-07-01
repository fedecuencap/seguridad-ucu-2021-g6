<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<head>
<title>Inicio</title>
</head>

<body>
	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">Listado de usuarios</h1>
	<div class="card shadow mb-4">
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered" id="dataTable">
				</table>
			</div>
		</div>
	</div>


    <script type="text/javascript">

    $(document).ready(function () {
    	$('#dataTable').bootstrapTable({
    		  url: '/app/usuarios/listado/',
    		  columns: [{
    		    field: 'username',
    		    title: 'Usuario'
    		  }, {
    		    field: 'nombre',
    		    title: 'Nombre'
    		  }, {
      		    field: 'fnac',
      		    title: 'Fecha Nacimiento'
    		  }, {
      		    field: 'email',
      		    title: 'Email'
    		  }, {
      		    field: 'fcrea',
      		    title: 'Fecha Creacion'
    		  }, {
      		    field: 'factivacion',
      		    title: 'Fecha Activacion'
    		  }, 
    		  ]
    		})
        
    });
    </script>
</body>