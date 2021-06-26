<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

<div class="midinero content ng-cloak">
	<div class="container main contacto" ng-controller="MensajeSalienteController as ctrl">
		<div class="col-container">
			<form ng-submit="ctrl.submit()"  class="form-base" name="listaMensajeSalienteForm">
				<div class="text with-icon"><h2 class="midinero-title">SMSs enviados</h2></div>
			
				<div class="input-space layout-row">
				
					<div class="flex-50">
						<span style="margin-right:15px;">Fecha desde: </span>
					
						<div class="layout-row">
							<div id="datepickerdesde" class="layout-row form-group date" data-date-format="dd-mm-yyyy" style="margin-right:27px;">
						    	<input class="form-control" ng-model="ctrl.desde" type="text" style="width: 510px;" readonly/>
						    	<span class="input-group-addon" style="width:unset"><i class="glyphicon glyphicon-calendar"></i></span>
						    	
							</div> 
						</div>
					</div>
					<div>
						<span style="margin-right:15px;">Fecha hasta: </span>
					
						<div class="layout-row">
							<div id="datepickerhasta" class="layout-row form-group date" data-date-format="dd-mm-yyyy">
						    	<input class="form-control" name="idHastaHolder" ng-model="ctrl.hasta" type="text" style="width: 530px;" readonly>
						    	<span class="input-group-addon" style="width:unset"><i class="glyphicon glyphicon-calendar"></i></span>
								<div class="has-error" ng-messages="listaMensajeSalienteForm.idHastaHolder.$error" ng-show="listaMensajeSalienteForm.idHastaHolder.$invalid" role="alert"></div>
							</div> 
						</div>
					</div>
				</div>
				<div class="layout-row">
					<div class="input-space form-group flex-50" style="padding-right:20px;">
	 					<span for="numcel">Número de celular:</span>
	  					<input type="text" pattern="^(0)*9[1-9][0-9]{6}$" ng-model="ctrl.params.nroDestino" class="form-control" id="numcelSaliente" 
	  					name=numHolderM placeholder="Ej: 99112333 ó 09911233">
						 <div class="has-error" ng-messages="listaMensajeSalienteForm.numHolderM.$error" ng-show="listaMensajeSalienteForm.numHolderM.$dirty" role="alert">  
	                     </div>
					</div>
					
					<div class="form-group input-space flex-50">
						<span>Puerto:</span>
						<select class="browser-default custom-select" name="puertoHolderM" ng-model="ctrl.params.puertoId">
						  	<option value={{undefined}}>Seleccione una opción</option>
						  	<option ng-repeat="p in ctrl.puertos" ng-value="p.puertoId">{{p.nombre}}</option>
							
							<div class="has-error" ng-messages="listaMensajeSalienteForm.puertoHolderM.$error" ng-show="listaMensajeSalienteForm.puertoHolderM.$dirty" role="alert">
	                     	</div>
						</select>
					</div>
				</div>
                <div class="input-space layout-row" style="justify-content: flex-end">
         			 <div style="margin-right:5px">
         			 	<button type="submit" class="btn custom-width" style="display: inherit;font-size: 15px;padding: 10px 10px; margin:0">
         			 		<span>Buscar</span>
         			 	</button>
         			 </div>
         		
       			 	<button type="button" ng-click="ctrl.enviarMensaje()" class="btn custom-width" style="display: inherit;font-size: 15px;padding: 10px 10px; margin:0">
       			 		 <span class="glyphicon glyphicon-plus"></span>
       			 	</button> 
         		</div>
                 
                
   		     <div ng-if="ctrl.hayMensajes" class="tablecontainer input-space">
                 <table class="table table-hover">
                     <thead>
                         <tr>
                             <th>Usuario</th>
                             <th style="min-width: 110px;">Nro. celular</th>
                             <th>Fecha</th>
                             <th>Mensaje</th>
                             <th>Puerto</th>
                             <th>Estado</th>   
                                                       
                         </tr>
                     </thead>
                     <tbody>
                         <tr ng-repeat="m in ctrl.mensajes">
	                             <td><span ng-bind="m.usuario"></span></td>
	                             <td><span  ng-bind="m.nroDestino"></span></td>
	                             <td style="min-width: 160px;"><span>{{ m.fchProgrammada | date : 'dd/MM/yyyy HH:ss'}}</span></td>
	                             <td><span ng-bind="m.texto"></span></td>
	                             <td><span>{{ ctrl.getPuertoDesc(m.puertoId) }}</span></td>
	                             <td><span ng-bind="m.estado">-</span></td>
                         </tr>
                     </tbody>
                 </table>
             </div>
			</form>
		</div>
	</div>
	
	<script src="<c:url value='/static/js/app.js' />"></script>
	<script src="<c:url value='/static/js/service/mensajesaliente_service.js' />"></script>
	<script src="<c:url value='/static/js/controller/mensajesaliente_controller.js' />"></script>
	<script src="<c:url value='/static/js/service/codigueras_service.js' />"></script>
</div>