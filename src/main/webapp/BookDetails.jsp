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
<title><s:property value="book.title"/></title>
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
  <div class="container"/>
    <h2>Book Details</h2>
    <table class="table">
      <tr>
        <td>Title:</td><td><s:property value="book.title"/></td>
      </tr>
      <tr>
        <td>ISBN:</td><td><s:property value="book.isbn"/></td>
      </tr>
      <s:if test="%{author != null}">
        <tr>
          <td>Author:</td><td><s:property value="author.name"/></td>
        </tr>
        <tr>
          <td>Age:</td><td><s:property value="author.age"/></td>
        </tr>
        <tr>
          <td>Country:</td><td><s:property value="author.country"/></td>
        </tr>
      </s:if>
      <tr>
        <td>Publisher:</td><td><s:property value="book.publisher"/></td>
      </tr>
      <tr>
        <td>Publisher Date:</td><td><s:property value="book.publishDate"/></td>
      </tr>
      <tr>
        <td>Price:</td><td><s:property value="book.price"/></td>
      </tr>
    </table>
    <div class="row">
      <s:form action="delete_book" method="post">
        <s:hidden name="isbn" value="%{book.isbn}"/>
        <s:token name="%{tokenId}"/>
        <button type="submit" class="btn btn-default col-md-2 col-md-offset-4 col-sm-3 col-sm-offset-3 col-xs-4 col-xs-offset-2">Delete</button>
      </s:form>
      <s:form action="update_book" method="get">
        <s:hidden name="title" value="%{book.title}"/>
        <s:hidden name="author" value="%{book.authorId}"/>
        <s:hidden name="isbn" value="%{book.isbn}"/>
        <s:hidden name="publisher" value="%{book.publisher}"/>
        <s:hidden name="publishDate" value="%{book.publishDate.toString()}"/>
        <s:hidden name="price" value="%{book.price}"/>
        <button type="submit" class="btn btn-default col-md-2 col-sm-3 col-xs-4">Update</button>
      </s:form>
    </div>
  </div>
</body>
</html>
