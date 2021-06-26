<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

<div class="midinero content ng-cloak">
     <div class="container main contacto" ng-controller="RespuestaUnitariaController as ctrl" data-ng-init="ctrl.init('${idMensajeAtr}')">
         <div class="col-container">
             
             <form ng-submit="ctrl.submit()" name="respuestaForm" class="form-base">
	             <div class="text with-icon"><h2 class="midinero-title">Envío de SMS</h2></div>
	        
	         		<div class="input-space form-group">
	 					<span for="numcel">En respuesta a</span>
	  					<input type="text" ng-model="ctrl.mensajeEntrante.nroOrigen" class="form-control" id="numcelR" name=numHolder 
	  						style="background-color: #29242424;" readonly>
					</div>
					
					<div class="input-space form-group">
	 					<span for="puertoR">Puerto</span>
	  					<input type="text" ng-model="ctrl.puertoMensajeDesc" class="form-control" id="puertoR" name=portHolder 
	  						style="background-color: #29242424;" readonly>
					</div>
					
	         		<div class="input-space">
	         			<span>Mensaje Recibido</span>
	         			<div class="input input-group-lg">
					  		<textarea class="form-control content" type="text" ng-model="ctrl.mensajeEntrante.texto" style="background-color: #29242424;" readonly></textarea>
						</div>
	         		</div>
	         		       	
									
	         		<div class="input-space">
	         			<span>Mensaje</span>
	         			<div class="input input-group-lg">
					  		<textarea class="form-control content" type="text" name="contenido" ng-model="ctrl.datos.texto"></textarea>
						</div>
	         		</div>
	         		         		
	         		<div class="input-space layout-row" style="justify-content: flex-end">
	         			 <div style="margin-right:5px">
	         			 	<button type="button" class="btn custom-width" ng-click="ctrl.back()" style="display: inherit;font-size: 15px;padding: 10px 10px; margin:0">
	         			 		<span>Volver</span>
	         			 	</button>
	         			 </div>
	         		
	       			 	<button type="submit" class="btn custom-width" style="display: inherit;font-size: 15px;padding: 10px 10px; margin:0">
	       			 		Enviar
	       			 	</button> 
         			</div>
         		</form>
          </div>
     </div>
	<script src="<c:url value='/static/js/app.js' />"></script>
	<script src="<c:url value='/static/js/service/mensajeentrante_service.js' />"></script>
	<script src="<c:url value='/static/js/service/enviounitario_service.js' />"></script>
	<script src="<c:url value='/static/js/service/codigueras_service.js' />"></script>
	<script src="<c:url value='/static/js/controller/respuestaunitaria_controller.js' />"></script>
 </div>