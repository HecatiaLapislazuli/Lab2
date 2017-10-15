<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u">
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/site.css">
<script src="${pageContext.request.contextPath}/static/js/jquery-3.2.1.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"></script>
<title>Add Author</title>
</head>
<body>
  <div class="container margin-top-10">
    <s:form action="add_author_post" method="post">
      <div class="form-group">
        <label for="name">Name:</label>
        <input type="text" name="name" required="required" maxlength="255" class="form-control"/>
      </div>
      <div class="form-group">
        <label for="age">Age:</label>
        <input type="number" name="age" required="required" min="0" max="10000" class="form-control"/>
      </div>
      <div class="form-group">
        <label for="country">Country:</label>
        <input type="text" name="country" required="required" maxlength="255" class="form-control"/>
      </div>
      <s:token name="%{tokenId}"/>
      <button type="submit" class="btn btn-default">Add</button>
    </s:form>
  </div>
</body>
</html>
