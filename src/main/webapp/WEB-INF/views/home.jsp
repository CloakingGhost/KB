<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Home</title>
</head>
<body>
	<h1>Hello world!</h1>

	<P>The time on the server is ${serverTime}.</P>

	<button id="call-me-btn">누르시오</button>
	<div id="call-me"></div>

	<script type="text/javascript">
	document.querySelector("button#call-me-btn")
	.addEventListener('click',
		function(){
			//testConn();
			//testJson();
			testPost();
			
		})
	
	
		// 이 함수는 비동기적인 함수이고 Promise를 반환 한다
		// 비동기 함수가 반환하는 객체, 함수의 성공 또는 실패 상태를 알려줌	
		function testConn() {
			fetch("/api/conn")
			.then(function(response) {
				return response.text();
			})
			.then(function(result){
				document.querySelector("div#call-me").innerText = result;
			})
			.catch(function(error){
				console.log(error);
			})
			
		}
		//testConn()

		function testJson(){
			fetch("/api/test")
			.then(function(response){
				return response.json()
			}).then(function(result){
				document.querySelector("div#call-me").innerText = result;
				document.querySelector("div#call-me").innerText = result.name;
				console.log(result)
				console.log(typeof(result), result.name)
			}).catch(function(error){
				console.log(error);
			})
		}
		
		function testPost(){
			const data = {name:"martha",
					password:"qwer"}
			
			fetch("/api/login",{
				method: "POST",
				body: JSON.stringify(data)
			})
			.then(function(response){
				return response.text()
			}).then(function(result){
				document.querySelector("div#call-me").innerText = result.name;
			}).catch(function(error){
				console.log(error);
			})
		}
		
		
		
		
	</script>
</body>
</html>
