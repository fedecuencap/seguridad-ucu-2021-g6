<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

<head>
    <style>
      .username.ng-dirty.ng-invalid-required {
          background-color: red;
      }
      .username.ng-dirty.ng-invalid-minlength {
          background-color: yellow;
      }
      .username.ng-dirty.ng-invalid-maxlength {
          background-color: yellow;
      }
 
      .email.ng-dirty.ng-invalid-required {
          background-color: red;
      }
      .email.ng-dirty.ng-invalid-email {
          background-color: yellow;
      }
 
    </style>
	<title>MiDinero</title>
</head>
  <body class="midinero content ng-cloak">
      <div class="container main contacto" ng-controller="JcardController as ctrl">
              <div class="text with-icon"><h2 class="midinero-title">jCardTest</h2></div>
	          <div class="col-container">
	              <div class="formcontainer">
	                  <form ng-submit="ctrl.submit()" name="myForm" class="form-base">
<!-- 	                      <input type="hidden" ng-model="ctrl.user.id" />-->
							<div class="form-item">
						  	<label for="cardHolder">Card Holder</label>
	                        <input type="text" ng-model="ctrl.jcard.cardHolder" name="cardHolder" id="cardHolder" class="username form-control" placeholder="0000001" required ng-maxlength="7" numbers-only="numbers-only"/>
	                        <!-- <pre>myForm.cardHolder.$error = {{ myForm.cardHolder.$error | json }}</pre> -->
	                        <div class="has-error" ng-messages="myForm.cardHolder.$error" ng-show="myForm.cardHolder.$dirty" role="alert">
	 	                       <span ng-message="required">Campo Requerido</span>
	                           <span ng-message="maxlength">El largo máximo es 7</span>
	                           <span ng-message-default>Campo Inválido </span>
	                        </div>
	                      </div>
	                      <div class="form-item">
                              <label class="" for="cardProduct">Card Product</label>
                              <input type="text" ng-model="ctrl.jcard.cardProduct" name="cardProduct" id="cardProduct" class="username form-control input-sm" placeholder="jCard" required ng-maxlength="5"/>
                              	<div class="has-error" ng-messages="myForm.cardProduct.$error" ng-show="myForm.cardProduct.$dirty" role="alert">
		 	                       <span ng-message="required">Campo Requerido</span>
		                           <span ng-message="maxlength">El largo máximo es 5</span>
		                           <span ng-message-default>Campo Inválido </span>
		                        </div>
	                      </div>
	 						<div class="form-item">
	                              <label class="" for="bin">Bin</label>
	                              <input type="text" ng-model="ctrl.jcard.bin" name="bin" id="bin" class="username form-control input-sm" placeholder="455566" required ng-maxlength="6" numbers-only="numbers-only"/>
	                              	<div class="has-error" ng-messages="myForm.bin.$error" ng-show="myForm.bin.$dirty" role="alert">
			 	                       <span ng-message="required">Campo Requerido</span>
			                           <span ng-message="maxlength">El largo máximo es 6</span>
			                           <span ng-message-default>Campo Inválido </span>
			                        </div>
	                      </div>
	                      <div class="form-item">
	                              <label class="" for="expiration">Expiration</label>
	                              <input type="text" ng-model="ctrl.jcard.expiration" name="expiration" id="expiration" class="username form-control input-sm" placeholder="201805" required ng-maxlength="6" numbers-only="numbers-only"/>
	                              	<div class="has-error" ng-messages="myForm.expiration.$error" ng-show="myForm.expiration.$dirty" role="alert">
			 	                       <span ng-message="required">Campo Requerido</span>
			                           <span ng-message="maxlength">El largo máximo es 6</span>
			                           <span ng-message-default>Campo Inválido </span>
			                        </div>
	                      </div>
	                      <div class="form-item">
	                              <label class="" for="serviceCode">Service Code</label>
	                              <input type="text" ng-model="ctrl.jcard.serviceCode" name="serviceCode" id="serviceCode" class="username form-control input-sm" placeholder="220" required ng-maxlength="3" numbers-only="numbers-only"/>
	                              	<div class="has-error" ng-messages="myForm.serviceCode.$error" ng-show="myForm.serviceCode.$dirty" role="alert">
			 	                       <span ng-message="required">Campo Requerido</span>
			                           <span ng-message="maxlength">El largo máximo es 3</span>
			                           <span ng-message-default>Campo Inválido </span>
			                        </div>
	                      </div>
	                      
	                      <div class="form-item">
	                             <button type="button" class="btn btn-secondary btn-sm"  style="display: inherit;font-size: 15px;padding: 15px 15px;float: right;margin: 5px 0px;" ng-click="ctrl.reset()">Resetear Formulario</button>
		                         <button type="submit" class="btn btn-primary btn-sm"  style="display: inherit;font-size: 15px;padding: 15px 15px;float: right;margin: 5px 5px;" ng-disabled="myForm.$invalid">Enviar</button>
	                      </div>
	                  </form>
	              </div>
	          </div>
    </div>
	<script src="<c:url value='/static/js/app.js' />"></script>
	<script src="<c:url value='/static/js/service/jcard_service.js' />"></script>
	<script src="<c:url value='/static/js/directive/directives.js' />"></script>
	<script src="<c:url value='/static/js/controller/jcard_controller.js' />"></script>
  </body>
  