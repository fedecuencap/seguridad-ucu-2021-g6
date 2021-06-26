<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

<div class="midinero content ng-cloak">
	<div class="container main contacto" ng-controller="ListadoLotesController as ctrl">
		<div class="col-container">
			<form ng-submit="ctrl.submit()" name="listaLoteForm">
			<div class="text with-icon"><h2 class="midinero-title">Lotes de SMS</h2></div>
				<div class="layout-row">	
					<div class="input-space form-base form-group flex-50" style="padding-right:10px;">
						<span for="idLote">Id Lote:</span>
		 				<input type="number" ng-minlength="1" min="1" class="form-control" ng-model="ctrl.idLote" id="idLote" name=idLoteHolder>
						 <span class="error" ng-show="listaLoteForm.idLoteHolder.$error.number" style="color:red;">Id de lote inválido</span>
					</div>
					
					<div class="input-space form-base form-group flex-50" style="padding-left:10px;">
						<span for="estado">Estado:</span>
						<select class="browser-default custom-select " id="estado" name="estadoHolder" ng-model="ctrl.selEstado">
						  	<option value={{undefined}}>Seleccione una opción</option>
						  	<option ng-repeat="m in ctrl.estados">{{m.codEstadoLoteDesc}}</option>
						</select>
					</div>
				</div>	  	
   	
			<div class="input-space layout-row" style="justify-content: flex-end">
      			 <div style="margin-right:5px">
	      			<button type="submit" class="btn custom-width" style="display: inherit;font-size: 15px;padding: 10px 10px; margin:0">
	 			 		Buscar
	 			 	</button> 
      			</div>
      		
    			<button type="button" ng-click="ctrl.agregarLote()" class="btn custom-width" style="display: inherit;font-size: 15px;padding: 10px 10px; margin:0">
    			 		 <span class="glyphicon glyphicon-plus"></span>
    			</button> 
      		</div>
   	
   	
   		     <div ng-if="ctrl.hayLotes" class="tablecontainer input-space">
                 <table class="table table-hover">
                     <thead>
                         <tr>
                             <th>ID.</th>
                             <th>Fecha de Carga</th>
                             <th>Usuario</th>
                             <th>Estado</th>
                             
                         </tr>
                     </thead>
                     <tbody>
                         <tr ng-repeat="m in ctrl.lotes" ng-click="ctrl.redirect(m.loteId)">
	                             <td><span ng-bind="m.loteId"></span></td>
	                             <td><span>{{ m.fchCarga | date : 'dd/MM/yyyy HH:ss'}}</span></td>
	                             <td><span ng-bind="m.usuarioCarga"></span></td>
	                             <td><span ng-bind="m.estado"></span></td>  
                         </tr>
                     </tbody>
                 </table>
             </div>
             </form>
		</div>
	</div>
	<script src="<c:url value='/static/js/app.js' />"></script>
	<script src="<c:url value='/static/js/service/listadolotes_service.js' />"></script>
	<script src="<c:url value='/static/js/controller/listadolotes_controller.js' />"></script>
	<script src="<c:url value='/static/js/service/codigueras_service.js' />"></script>
	
</div>