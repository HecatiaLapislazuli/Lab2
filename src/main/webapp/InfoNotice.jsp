<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="refresh" content="3;url=${pageContext.request.contextPath}<s:property value='next'/>"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u">
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/site.css">
<script src="${pageContext.request.contextPath}/static/js/jquery-3.2.1.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"></script>
<title><s:property value='title'/></title>
</head>
<body>
  <div class="container alert alert-success margin-top-10">
    <strong><s:property value='strong'/></strong> <s:property value='message'/><br>
    Redirecting to <a href="${pageContext.request.contextPath}<s:property value='next'/>" class="alert-link"><s:property value='linkName'/></a> in 3 seconds...
  </div>
</body>
</html>
