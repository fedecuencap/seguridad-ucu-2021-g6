<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

<div class="midinero content ng-cloak">
     <div class="container main contacto" ng-controller="CargaDeLoteController as ctrl">
         <div class="col-container">
			
			<form ng-submit="ctrl.submit()" name="loteForm" class="form-base" id="loteForm"
			method="POST" enctype="multipart/form-data" acceptcharset="UTF-8" >
            	<div class="text with-icon"><h2 class="midinero-title">Carga de lote de SMS</h2></div>
         		
        		<div class="input-group">
			  		<div class="input-group-prepend">
			    	<span class="input-group-text" id="inputGroupFileAddon01">Archivo:</span>
			  	</div>
			  	<div class="custom-file">
			    	<input type="file" ng-model="ctrl.myFile" onchange="angular.element(this).scope().onFileChange()"
			    	accept=".csv" class="custom-file-input" name="fileHolder" style="box-sizing: initial; max-width: max-content;" 
			    	id="inputGroupFile01" aria-describedby="inputGroupFileAddon01" required>
			  	</div>
				</div>
				<div class="input-space">
				
					<span>Enviar a partir de:</span>
				
					<div class="layout-row">
						<div id="datepicker" class="layout-row form-group date" data-date-format="dd-mm-yyyy" style="margin-right:27px;">
					    	<input class="form-control" ng-model="ctrl.fecha" type="text" name="fechaEnviar" id="fechaEnviar" readonly required>
					    	<span class="input-group-addon" style="width:unset"><i class="glyphicon glyphicon-calendar"></i></span>
					    	<div class="has-error" ng-messages="loteForm.fechaEnviar.$error" ng-show="loteForm.fechaEnviar.$invalid" role="alert"></div>
						</div> 
						
						<div class="layout-row form-group">
							<input type="time" class="form-control" ng-model="ctrl.hora" min="00:00:00" max="23:59:59" required>
						    <span class="input-group-addon" style="width:unset"><i class="glyphicon glyphicon-time"></i></span>
						</div>
					</div>
					
					
				</div>
				
				<div class="input-space">
         			<span>Comentario:</span>
         			<div class="input input-group-lg">
				  		<textarea class="form-control content" ng-model="ctrl.comentario" type="text" name="contenido" maxlength="200"></textarea>
					</div>
	         	</div>
						
				<div class="input-space layout-row" style="justify-content: flex-end">
         			 <div style="margin-right:5px">
         			 	<button type="button" class="btn custom-width" ng-click="ctrl.back()" style="display: inherit;font-size: 15px;padding: 10px 10px; margin:0">
         			 		<span>Volver</span>
         			 	</button>
         			 </div>
         		
       			 	<button type="submit" class="btn custom-width" style="display: inherit;font-size: 15px;padding: 10px 10px; margin:0">
       			 		Confirmar
       			 	</button> 
         		</div>	
	 		</form>	

   
         </div>
     </div>
     
    <script src="<c:url value='/static/js/app.js' />"></script>
	<script src="<c:url value='/static/js/service/cargadelote_service.js' />"></script>
	<script src="<c:url value='/static/js/controller/cargadelote_controller.js' />"></script>
	<script src="<c:url value='/static/js/directive/directives.js' />"></script>
</div>