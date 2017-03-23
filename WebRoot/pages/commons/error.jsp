<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/commons/taglibs.jsp" %>
<html>
<head>
    <title>500 ~ <s:text name="system.commons.somethingWrong"/></title>
</head>

<body>
<div>
    <h1><span><s:text name="system.commons.sorryForSystemWrongContactWithAdministrator"/></span></h1>
    <h2><s:property value="exception.message"/></h2>
    <p>
    <s:property value="exceptionStack"/>
    </p>
</div>
</body>
</html>