<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

<div class="midinero content ng-cloak">
     <div class="container main contacto" ng-controller="EnvioUnitarioController as ctrl">
         <div class="col-container">
             
             <form ng-submit="ctrl.submit()" name="unitarioForm" class="form-base">
	             <div class="text with-icon"><h2 class="midinero-title">Envío de SMS</h2></div>
	        
	        	<div class="flex-container layout-row">
	         		<div class="input-space form-group flex-50" style="margin-right:15px;">
	 					<span for="numcel">Número de celular:</span>
	  					<input type="text" pattern="^(0)*9[1-9][0-9]{6}$" ng-model="ctrl.datos.nroDestino" class="form-control" id="numcel" name=numHolder 
	  						placeholder="Ej: 99112333 ó 09911233" required >
						 <div class="has-error" ng-messages="unitarioForm.numHolder.$error" ng-show="unitarioForm.numHolder.$dirty" role="alert">  
	                     </div>
					</div>
	         		
	         		<div class="form-group input-space flex-50">
						<span>Puerto:</span>
						<select class="browser-default custom-select" name="puertoHolder" ng-model="ctrl.datos.puertoId" required>
						  	<option value={{undefined}} disabled>Seleccione una opción</option>
						  	<option ng-repeat="p in ctrl.puertos" ng-value="p.puertoId">{{p.nombre}}</option>
							
							<div class="has-error" ng-messages="unitarioForm.puertoHolder.$error" ng-show="unitarioForm.puertoHolder.$dirty" role="alert">
	                     	</div>
						</select>
					</div>
				</div>			
	         		<div class="input-space">
	         			<div class="flex-container layout-row">
	         				<div class="flex-50">Mensaje:</div>
	         				<span style="text-align: end;width: 100%;">(Máximo 160 caracteres)</span>
	         			</div>
	         			
	         			<div class="input input-group-lg">
					  		<textarea class="form-control content" type="text" maxlength="160" name="contenido" ng-model="ctrl.datos.texto" required></textarea>
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
	<script src="<c:url value='/static/js/service/enviounitario_service.js' />"></script>
	<script src="<c:url value='/static/js/service/codigueras_service.js' />"></script>
	<script src="<c:url value='/static/js/controller/enviounitario_controller.js' />"></script>
 </div>