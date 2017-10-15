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
<title>Books by <s:property value="authorName"/></title>
</head>
<body>
  <nav class="navbar navbar-inverse">
    <div class="container-fluid">
      <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#my-nav-bar">
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>                        
        </button>
        <a class="navbar-brand" href=".">Book Database</a>
      </div>
      <div class="collapse navbar-collapse" id="my-nav-bar">
        <ul class="nav navbar-nav">
          <li><a href=".">Home</a></li>
          <li><a href="add_book">Add a book</a></li>
        </ul>
      </div>
    </div>
  </nav>
  <div class="container">
    <h1>Books written by <s:property value="authorName"/></h1>
    <table class="table table-hover">
      <thead>
        <tr>
          <th>Title</th>
          <th>ISBN</th>
          <th>Publisher</th>
          <th>Publish Date</th>
          <th>Price</th>
        </tr>
      </thead>
      <tbody>
      <s:iterator value="books">
        <s:url action="book_details" var="bookLink">
          <s:param name="isbn"><s:property value="isbn"/></s:param>
        </s:url>
        <tr>
          <td>
            <a href="${bookLink}"><s:property value="title"/></a>
          </td>
          <td>
            <s:property value="isbn"/>
          </td>
          <td>
            <s:property value="publisher"/>
          </td>
          <td>
            <s:property value="publishDate"/>
          </td>
          <td>
            <s:property value="price"/>
          </td>
        <tr>
      </s:iterator>
      </tbody>
    </table>
  </div>
</body>
</html>
