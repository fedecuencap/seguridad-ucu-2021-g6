<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>


<div class="midinero content ng-cloak">
     <div class="container main contacto" ng-controller="DetalleLoteController as ctrl" data-ng-init="ctrl.init('${idLoteAtr}')">
		<div id="pre-loader-lote" style="align-item: center; background-color: rgba(0, 0, 0, 0.6); display: none;  position:absolute; top:0; left:0; width:100%;
    		height:100%; z-index:1000;">
			<img style="position:absolute; width:2vw; height:4vh; top:50%; left:48%;" src="/static/images/loading.gif" alt="Cargando">
		</div>
         <div class="col-container">

			<div class="text with-icon"><h2 class="midinero-title">Lote {{ctrl.lote.loteId}}</h2></div>
			
			<div class="flex-container layout-column">
				<span style="margin-top:5px;"><strong>Fecha de carga:</strong> {{ ctrl.lote.fchCarga | date : 'dd/MM/yyyy HH:ss'}}</span> 
 				<span style="margin-top:5px;"><strong>Fecha de última actualización: </strong> {{ ctrl.lote.fchUltimaAct | date : 'dd/MM/yyyy HH:ss' }}</span> 
 				<span style="margin-top:5px;"><strong>Usuario: </strong>{{ctrl.lote.usuarioCarga}}</span> 
 				<span style="margin-top:5px;"><strong>Estado: </strong>{{ctrl.lote.estado}}</span>	
			</div>
			   
			 <div class="tablecontainer input-space">
                 <table class="table table-hover">
                     <thead>
                         <tr>
                             <th width="10%">Nro. celular</th>
                             <th width="15%">Fecha de última Act.</th>
                             <th>Mensaje</th>
                             <th>Estado</th>
                             <th>Intentos</th>
                         </tr>
                     </thead>
                     <tbody>
                         <tr ng-repeat="m in ctrl.lote.mensajes">
                             <td><span ng-bind="m.nroDestino"></span></td>
                             <td><span>{{ m.fchUltimaAct | date : 'dd/MM/yyyy HH:ss' }}</span></td>
                             <td><span ng-bind="m.texto"></span></td>
                             <td><span ng-bind="m.estado"></span></td>
                             <td><span ng-bind="m.nroIntento"></span></td>
                         </tr>
                     </tbody>
                 </table>
             </div>
             
             <div class="input-space layout-row" style="justify-content: flex-end">         
   			 	<button type="button" class="btn custom-width" ng-click="ctrl.back()" style="display: inherit;font-size: 15px;padding: 10px 10px; margin:0">
   			 		<span>Volver</span>
   			 	</button>
	         </div>
	         		 
         				
         </div>
     </div>
     
     <script src="<c:url value='/static/js/app.js' />"></script>
     <script src="<c:url value='/static/js/controller/detallelote_controller.js' />"></script>
     <script src="<c:url value='/static/js/service/listadolotes_service.js' />"></script>
</div>