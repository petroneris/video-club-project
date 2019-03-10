<%-- 
    Document   : header
    Created on : Sep 9, 2016, 12:08:46 AM
    Author     : Snezana
--%>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<spring:url value="/resources/js/jquery-3.1.0.min.js" var="jqueryJs" />
<spring:url value="/resources/js/main.js" var="mainJs" />
<spring:url value="/resources/css/main.css" var="mainCss" />
<script src="${jqueryJs}"></script>
<script src="${mainJs}"></script>
<script src="${redirectJs}"></script>
<link href="${mainCss}" rel="stylesheet" /> 
