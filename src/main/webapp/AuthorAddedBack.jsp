<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<script>
function back() {
  window.opener.setAddedAuthor("<s:property value="name"/>", <s:property value="id"/>);
  self.close();
}
</script>
</head>
<body onload="back()">
</body>
</html>
