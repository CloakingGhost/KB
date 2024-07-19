<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Home</title>
</head>
<body>
	<h1>Hello world!</h1>

	<P>The time on the server is ${serverTime}.</P>
	<input type="text" id="btn1">
	<input type="text" id="btn2">
	<input type="text" id="btn3">
	<input type="button" id="btn">

	<script type="text/javascript">
document.querySelector("#btn1").addEventListener("click",()=>{
	fetch("/api/1")
	.then((response)=>response.text())
	.then(result => 
	{
		document.querySelector("#btn1").value = result
	})
})

document.querySelector("#btn2").addEventListener("click",()=>{
	fetch("/api/2")
	.then((response)=>response.text())
	.then(result => 
	{
		document.querySelector("#btn2").value = result
	})
})
document.querySelector("#btn3").addEventListener("click",()=>{
	fetch("/api/3")
	.then((response)=>response.text())
	.then(result => 
	{
		document.querySelector("#btn3").value = result
	})
})
document.querySelector("#btn").addEventListener("click", () =>{
	document.querySelector("#btn1").click();
	document.querySelector("#btn2").click();
	document.querySelector("#btn3").click();
})
</script>
</body>
</html>
