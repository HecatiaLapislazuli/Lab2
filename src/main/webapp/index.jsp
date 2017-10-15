<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u">
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/site.css">
<script src="${pageContext.request.contextPath}/static/js/jquery-3.2.1.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"></script>
<script src="${pageContext.request.contextPath}/static/js/bootstrap3-typeahead.min.js"></script>
<script>
$(document).ready(function() {
  $.get('api/all_authors', function(authors) {
    $('#search-input').typeahead({ source: authors.map(function(author) { return $('<div/>').text(author.name).html(); }) });
  });
});
</script>
<title>Book Database</title>
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
        <a class="navbar-brand" href="#">Book Database</a>
      </div>
      <div class="collapse navbar-collapse" id="my-nav-bar">
        <ul class="nav navbar-nav">
          <li class="active"><a href="#">Home</a></li>
          <li><a href="add_book">Add a book</a></li>
        </ul>
      </div>
    </div>
  </nav>
  <div class="container">
    <div class="row margin-top-30">
      <h1 class="text-center">Book Database</h1>
    </div>
    <form id="search-form" action="books">
      <div class="container">
        <div class="row">
          <div class="col-sm-8 col-sm-offset-2 input-group stylish-input-group">
            <input id="search-input" type="text" name="authorName" class="form-control" data-provide="typeahead" autocomplete="off" placeholder="Search books by author name">
            <span class="input-group-addon">
              <button type="submit">
                <span class="glyphicon glyphicon-search"></span>
              </button>
            </span>
          </div>
        </div>
      </div>
    </form>
    <div class="row margin-top-10">
      <button type="submit" form="search-form" class="btn btn-default col-md-2 col-md-offset-4 col-sm-3 col-sm-offset-3 col-xs-4 col-xs-offset-2">Search</button>
      <a href="add_book" class="btn btn-default col-md-2 col-sm-3 col-xs-4">Add a book</a>
    </div>
  </div>
</body>
</html>
