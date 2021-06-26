<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

<div class="midinero content ng-cloak">
     <div class="container main contacto" ng-controller="ListadoRespuestasController as ctrl" data-ng-init="ctrl.init('${idMensajeAtr}')">
        
         <div class="col-container form-base">
       		 <div id="pre-loader-resp" class="pre-loader">
        		<img src="<c:url value="/static/images/loading.gif" />" alt="Cargando">
    		</div>
             
             <div class="text with-icon"><h2 class="midinero-title">Respuestas a </h2></div>
        		<ng-template ng-if="!ctrl.loadingData">
         		<div class="input-space form-group">
 					<span for="numcel">Nro. de celular</span>
  					<input type="text" ng-model="ctrl.mensajeEntrante.nroOrigen" class="form-control" id="numcelRs" name=numHolder 
  						style="background-color: #29242424;" readonly>
				</div>
				
				<div class="input-space form-group">
 					<span for="puertoRs">Puerto</span>
  					<input type="text" ng-model="ctrl.puertoDesc" class="form-control" id="puertoRs" name=portHolder 
  						style="background-color: #29242424;" readonly>
				</div>
				
         		<div class="input-space">
         			<span>Mensaje Recibido</span>
         			<div class="input input-group-lg">
				  		<textarea class="form-control content" type="text" ng-model="ctrl.mensajeEntrante.texto" style="background-color: #29242424;" readonly></textarea>
					</div>
         		</div>
	         		       	
				<div ng-if="ctrl.hayRespuestas" class="tablecontainer input-space">
                 <table class="table table-hover">
                     <thead>
                         <tr>
                             <th>Usuario</th>
                             <th>Fecha</th>
                             <th>Mensaje</th>
                             <th>Puerto</th>
                             <th>Respuesta</th>      
                             <th>Estado<th>                       
                         </tr>
                     </thead>
                     <tbody>
                     <tr ng-repeat="m in ctrl.respuestas">
                          <td><span  ng-bind="m.usuario"></span></td>
                          <td><span>{{ m.fchProgrammada | date : 'dd/MM/yyyy HH:ss'}}</span></td>
                          <td><span ng-bind="m.texto"></span></td>
                          <td><span></span>{{ ctrl.getPuertosDes(m.puertoId) }}</td>
                          <td><span ng-bind="m.tipoRespuesta"></span></td>  
                          <td><span ng-bind="m.estado"></span></td>
                     </tr>
                      
                     </tbody>
                 </table>
             </div> 
			</ng-template>		
	   		<div class="input-space layout-row" style="justify-content: flex-end">
	   			 <div style="margin-right:5px">
	   			 	<button type="button" class="btn custom-width" ng-click="ctrl.back()" style="display: inherit;font-size: 15px;padding: 10px 10px; margin:0">
	   			 		<span>Volver</span>
	   			 	</button>
	   			 </div>
	  		</div>
         		
          </div>
     </div>
	<script src="<c:url value='/static/js/app.js' />"></script>
	<script src="<c:url value='/static/js/service/mensajeentrante_service.js' />"></script>
	<script src="<c:url value='/static/js/service/codigueras_service.js' />"></script>
	<script src="<c:url value='/static/js/service/respuestas_service.js' />"></script>
	<script src="<c:url value='/static/js/controller/listadorespuestas_controller.js' />"></script>
 </div>