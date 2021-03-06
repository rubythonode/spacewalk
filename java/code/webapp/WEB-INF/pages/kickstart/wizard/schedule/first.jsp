<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://rhn.redhat.com/rhn" prefix="rhn" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://rhn.redhat.com/tags/list" prefix="rl" %>

<html>

<head>

<meta http-equiv="Pragma" content="no-cache" />

<script language="javascript">
//<!--
function setStep(stepName) {
        var field = document.getElementById("wizard-step");
        field.value = stepName;
}
//-->
</script>
</head>

<body>

<%@ include file="/WEB-INF/pages/common/fragments/systems/system-header.jspf" %>

<h2>
  <rhn:icon type="header-kickstart" title="system.common.kickstartAlt" />
  <bean:message key="kickstart.schedule.heading1.jsp" />
</h2>

<c:if test="${requestScope.isVirtualGuest == 'true'}">
    <div class="page-summary">
        <bean:message key="kickstart.schedule.cannot.provision.guest"/>
        <c:if test="${requestScope.virtHostIsRegistered == 'true'}">
            <bean:message key="kickstart.schedule.visit.host.virt.tab" arg0="${requestScope.hostSid}"/>
        </c:if>
    </div>
</c:if>

<c:if test="${requestScope.isVirtualGuest == 'false'}">

    <div class="page-summary">
    <p>
        <bean:message key="kickstart.schedule.heading1.text.jsp" />
    </p>
    <h2><bean:message key="kickstart.schedule.heading2.jsp" /></h2>
    </div>

    <div class="page-summary">
    <p>
        <bean:message key="kickstart.schedule.heading2.text.jsp" />
    </p>

<c:set var="form" value="${kickstartScheduleWizardForm.map}"/>
<c:set var="regularKS" value="true"/>
<rl:listset name="wizard-form">
    <rhn:csrf />
    <rhn:submitted />
                <%@ include file="/WEB-INF/pages/common/fragments/kickstart/schedule/profile-list.jspf" %>
        <%@ include file="/WEB-INF/pages/common/fragments/kickstart/schedule/ks-wizard.jspf" %>
        </rl:listset>
    </div>
</c:if>

</body>
</html>
