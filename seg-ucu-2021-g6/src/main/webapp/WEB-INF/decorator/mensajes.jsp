<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="divMensajes">
	<div id="divMensajesContainer">
		<div class='notifications top-right'></div>
		<core:if test='${not empty sessionScope.mensajesInfo}'>
			<!-- MENSAJES INFO -->
			<div id="msginformaciones" class="hide">
				<ul>
					<core:forEach var="mensaje" items="${sessionScope.mensajesInfo}">
						<li>${mensaje.codigo} - ${mensaje.descripcionFormateada}</li>
					</core:forEach>
				</ul>
			</div>
			<core:remove var="mensajesInfo" scope="session" />			
		</core:if>
		<core:if test='${not empty sessionScope.mensajesSuccess}'>
			<!-- MENSAJES INFO -->
			<div id="msgsuccess" class="hide">
				<ul>
					<core:forEach var="mensaje" items="${sessionScope.mensajesSuccess}">
						<li>${mensaje.codigo} - ${mensaje.descripcionFormateada}</li>
					</core:forEach>
				</ul>
			</div>
			<core:remove var="mensajesSuccess" scope="session" />			
		</core:if>
		<core:if test="${not empty sessionScope.mensajesWarning}">
			<!-- MENSAJES WARNING -->
			<div id="msgadvertencias" class="hide">
				<ul>
					<core:forEach var="mensaje" items="${sessionScope.mensajesWarning}">
						<li>${mensaje.codigo} - ${mensaje.descripcionFormateada}</li>
					</core:forEach>
				</ul>
			</div>
			<core:remove var="mensajesWarning" scope="session" />			
		</core:if>
		<core:if test="${not empty sessionScope.mensajesError}">
			<!-- MENSAJES ERROR -->
			<div id="msgerrores" class="hide">
				<ul>
					<core:forEach var="mensaje" items="${sessionScope.mensajesError}">
						<li>${mensaje.codigo} - ${mensaje.descripcionFormateada}</li>
					</core:forEach>
				</ul>
			</div>
			<core:remove var="mensajesError" scope="session" />			
		</core:if>
		<core:if test="${not empty sessionScope.mensajesIndefinido}">
			<!-- MENSAJES ERROR -->
			<div id="msgindefinido" class="hide">
				<ul>
					<core:forEach var="mensaje" items="${sessionScope.mensajesIndefinido}">
						<li>${mensaje.codigo} - ${mensaje.descripcionFormateada}</li>
					</core:forEach>
				</ul>
			</div>
			<core:remove var="mensajesIndefinido" scope="session" />			
		</core:if>
	</div>	
</div>
<script type="text/javascript">
	$(document).ready(function(){
		loadMsg(false);
	});			
</script>
