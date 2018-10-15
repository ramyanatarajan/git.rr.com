<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>
<%@ taglib uri="http://liferay.com/tld/aui" prefix="aui" %>
<%@ taglib uri="http://liferay.com/tld/ddm" prefix="liferay-ddm" %>
<%@ taglib uri="http://liferay.com/tld/portlet" prefix="liferay-portlet" %>
<%@ taglib uri="http://liferay.com/tld/theme" prefix="liferay-theme" %>
<%@ taglib uri="http://liferay.com/tld/ui" prefix="liferay-ui" %>
<%@ taglib uri="http://liferay.com/tld/util" prefix="liferay-util" %>
<%@page import="com.kelly.konakart.service.ProductsSoldLocalServiceUtil"%>
<%@page import="com.kelly.konakart.util.Constants"%>
<%@page import="com.kelly.konakart.util.KKHelper"%>
<%@page import="com.liferay.portal.service.UserLocalServiceUtil"%>
<%@page import="com.liferay.portal.service.RoleLocalServiceUtil" %>
<%@page import="java.util.List"%>
<portlet:defineObjects /><liferay-theme:defineObjects />



<div class="row-fluid last-activies">

<%		if(RoleLocalServiceUtil.hasUserRole(themeDisplay.getUserId(), themeDisplay.getCompanyId(), Constants.ROLE_COORDINATOR, true))
        {   %>
	<!-- Users Panel -->
	
	<aui:column cssClass="panel" columnWidth="30">
		<div class="panelHdr blu">
			<img alt="<liferay-ui:message key="Utenti"/>" title="<liferay-ui:message key="Utenti"/>" src="<%=request.getContextPath()%>/imgs/ico_utenti.png">
			<a href='<%= KKHelper.getUrlPrefix(themeDisplay)+ "/utenti"%>'><liferay-ui:message key="Utenti"/></a>
		</div>
		<div class="panelContent">
			<aui:column columnWidth="100">
				<liferay-ui:message key="customers-count"/>:
				<span><b><%=KKHelper.getUserCountForRole(themeDisplay,Constants.ROLE_CUSTOMER)%></b></span>
			</aui:column>
			<aui:column columnWidth="100">
				<liferay-ui:message key="coordinators-count"/>:
				<span><b><%=KKHelper.getUserCountForRole(themeDisplay,Constants.ROLE_COORDINATOR)%></b></span>
			</aui:column>
			<aui:column columnWidth="100">
				<liferay-ui:message key="editors-count"/>:
				<span><b><%=KKHelper.getUserCountForRole(themeDisplay,Constants.ROLE_EDITOR)%></b></span>
			</aui:column>
			<aui:column columnWidth="100">
			<liferay-ui:message key="translator-count"/>:
			<span><b><%=KKHelper.getUserCountForRole(themeDisplay,Constants.ROLE_TRANSLATOR)%></b></span>
			</aui:column>
			<aui:column columnWidth="100">
			<liferay-ui:message key="interviewer-count"/>:
			<span><b><%=KKHelper.getUserCountForRole(themeDisplay,Constants.ROLE_INTERVIEWER)%></b></span>
			</aui:column>
			<aui:column columnWidth="100">
			<liferay-ui:message key="consultant-count"/>:
			<span><b><%=KKHelper.getUserCountForRole(themeDisplay,Constants.ROLE_CONSULTANT)%></b></span>
			</aui:column>
			<aui:column columnWidth="100">
			<liferay-ui:message key="trial-user-count"/>:
			<span><b><%=KKHelper.getUserCountForRole(themeDisplay,Constants.ROLE_TRIAL_USER)%></b></span>
			</aui:column>
			<aui:column columnWidth="100">
			<liferay-ui:message key="total-count"/>:
			<span><b><%=UserLocalServiceUtil.getUsersCount()%></b></span>
			</aui:column>
		</div>
	</aui:column>

	<!-- Products Sold Panel -->
	
	<aui:column cssClass="panel" columnWidth="30">
		<div class="panelHdr blu">
			<img alt='<liferay-ui:message key="products"/>' title='<liferay-ui:message key="products"/>' src="<%=request.getContextPath()%>/imgs/ico_products.png">
			<liferay-ui:message key="products"></liferay-ui:message>
		</div>
		
		<div class="panelContent">
			<aui:column columnWidth="100">
				<liferay-ui:message key="waiting-for-activation-count"/>:
				<span><b><%=ProductsSoldLocalServiceUtil.getProductsSoldCount(Constants.PRODUCTS_SOLD_WAITING)%></b></span>
			</aui:column>
			<aui:column columnWidth="100">
				<liferay-ui:message key="running-count"/>:
				<%List productsRunning=KKHelper.getProductByStatus("",Constants.PRODUCTS_SOLD_RUNNING); %>
				<span><b> <%=productsRunning.size()%> </b></span>
			</aui:column>
			<aui:column columnWidth="100">
				<liferay-ui:message key="closed-count"/>:
				<span><b><%=ProductsSoldLocalServiceUtil.getProductsSoldCount(Constants.PRODUCTS_SOLD_CLOSED) %> </b></span>
			</aui:column>
			<aui:column columnWidth="100">
				<liferay-ui:message key="total-count"/>:
				<span><b><%=ProductsSoldLocalServiceUtil.getProductsSoldsCount() %> </b></span>
			</aui:column>
			
		</div>
	</aui:column>
<%} %>	
	<!-- Job Panel -->
	
	<aui:column cssClass="panel" columnWidth="30">
		<div class="panelHdr blu">
			<img alt="<liferay-ui:message key="jobs"/>" title="<liferay-ui:message key="jobs"/>" src="<%=request.getContextPath()%>/imgs/ico_company.png">
		   <a href='<%= KKHelper.getUrlPrefix(themeDisplay)+ "/jobs"%>'><liferay-ui:message key="jobs"></liferay-ui:message></a>
		</div>
		
		<div class="panelContent">
			<aui:column columnWidth="100">
				<liferay-ui:message key="waiting-for-activation-count"/>:
				<span><b><%=ProductsSoldLocalServiceUtil.getProductsSoldCount(Constants.PRODUCTS_SOLD_WAITING)%></b></span>
			</aui:column>
			<aui:column columnWidth="100">
				<%
				int dataCheckCount=0;
			    List dataCheckWaiting = KKHelper.getProductByStatus("DATA_CHECK",Constants.PRODUCTS_SOLD_WAITING); 
			    List dataCheckRunning = KKHelper.getProductByStatus("DATA_CHECK",Constants.PRODUCTS_SOLD_RUNNING); 
				dataCheckCount = dataCheckWaiting.size()+dataCheckRunning.size();
				%>
				<liferay-ui:message key="data-check-count"/>:
				<span><b><%=dataCheckCount %></b></span>
			</aui:column>
			<aui:column columnWidth="100">
			<%
			int interviewCount=0;
			List interviewWaiting = KKHelper.getProductByStatus("INTERVIEW",Constants.PRODUCTS_SOLD_WAITING); 
			List interviewRunning = KKHelper.getProductByStatus("INTERVIEW",Constants.PRODUCTS_SOLD_RUNNING); 
			interviewCount = interviewWaiting.size()+interviewRunning.size();
				%>
				<liferay-ui:message key="interview-count"/>:
				<span><b><%=interviewCount %></b></span>
			</aui:column>
			<aui:column columnWidth="100">
			<%
			int editingCount=0;
			List editingWaiting = KKHelper.getProductByStatus("EDITING",Constants.PRODUCTS_SOLD_WAITING); 
			List editingRunning = KKHelper.getProductByStatus("EDITING",Constants.PRODUCTS_SOLD_RUNNING); 
			editingCount = editingWaiting.size()+editingRunning.size();
				%>
				<liferay-ui:message key="editing-count"/>:
				<span><b><%=editingCount %></b></span>
			</aui:column>
			<aui:column columnWidth="100">
			<%
			int translationCount=0;
			List translationWaiting = KKHelper.getProductByStatus("TRANSLATION",Constants.PRODUCTS_SOLD_WAITING); 
			List translationRunning = KKHelper.getProductByStatus("TRANSLATION",Constants.PRODUCTS_SOLD_RUNNING); 
			translationCount = translationWaiting.size()+translationRunning.size();
				%>
				<liferay-ui:message key="translation-count"/>:
				<span><b><%=translationCount %></b></span>
			</aui:column>
			<aui:column columnWidth="100">
			<%
			int finalReviewCount=0;
			List finalReviewWaiting = KKHelper.getProductByStatus("FINAL_REVIEW",Constants.PRODUCTS_SOLD_WAITING); 
			List finalReviewRunning = KKHelper.getProductByStatus("FINAL_REVIEW",Constants.PRODUCTS_SOLD_RUNNING); 
			finalReviewCount = finalReviewWaiting.size()+finalReviewRunning.size();
				%>
				<liferay-ui:message key="final-review-count"/>:
				<span><b><%=finalReviewCount %></b></span>
			</aui:column>
			<aui:column columnWidth="100">
				<liferay-ui:message key="closed-count"/>:
				<span><b><%=ProductsSoldLocalServiceUtil.getProductsSoldCount(Constants.PRODUCTS_SOLD_CLOSED)%></b></span>
			</aui:column>
			
		</div>
	</aui:column>

</div>