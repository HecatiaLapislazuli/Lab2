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
<title>Add Book</title>
<script>
function addAuthor() {
  window.open("add_author", "_blank",
      "height=400, width=600, status=yes, toolbar=no, menubar=no, location=no,addressbar=no");
}

function setAddedAuthor(name, id) {
  var select = document.getElementById("author-select");
  var option = document.createElement("option");
  option.text = name;
  option.value = id;
  option.selected = true;
  select.add(option);
}
</script>
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
          <li class="active"><a href="#">Add a book</a></li>
        </ul>
      </div>
    </div>
  </nav>
  <div class="container margin-top-10">
    <s:form id="book-form" action="add_book_post" method="post">
      <div class="form-group">
        <label for="title">Title:</label>
        <s:textfield name="title" required="required" maxlength="255" class="form-control"/>
      </div>
      <div class="form-group">
        <label for="author">Author:</label>
        <s:select
          id="author-select"
          name="author"
          list="%{authors}"
          listKey="id"
          listValue="name"
          class="form-control"/>
        <button type="submit" class="form-control btn btn-default" onclick="addAuthor(); return false;">Add Author</button>
      </div>
      <div class="form-group">
        <label for="isbn">ISBN:</label>
        <s:textfield name="isbn" required="required" maxlength="20" class="form-control"/>
      </div>
      <div class="form-group">
        <label for="publisher">Publisher:</label>
        <s:textfield name="publisher" required="required" maxlength="255" class="form-control"/>
      </div>
      <div class="form-group">
        <label for="publishDate">Publish Date:</label>
        <s:textfield type="date" name="publishDate" required="required" class="form-control"/>
      </div>
      <div class="form-group">
        <label for="price">Price:</label>
        <s:textfield type="number" name="price" step="0.01" placeholder="0.00" required="required" min="0.00" max="10000000.00" class="form-control"/>
      </div>
      <s:token name="%{tokenId}" id="token-input"/>
      <button type="submit" class="btn btn-default">Add</button>
    </s:form>
  </div>
</body>
</html>
