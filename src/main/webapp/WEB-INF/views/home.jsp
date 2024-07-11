<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Home</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"
	integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
	crossorigin="anonymous"></script>
</head>
<body>
	<h1>Hello world!</h1>

	<P>The time on the server is ${serverTime}.</P>

	<button id="call-me-btn-1">누르시오-1</button>
	<div id="call-me-1"></div>
	<button id="call-me-btn-2">누르시오-2</button>
	<div id="call-me-2"></div>
	<button id="call-me-btn-3">누르시오-3</button>
	<div id="call-me-3"></div>
	<button id="call-me-btn-4">누르시오-4</button>
	<div id="call-me-4"></div>
	<script type="text/javascript">
		$("#call-me-btn-1").on('click', function() {
			testConn();
		});

		$("#call-me-btn-2").on('click', function() {
			testJson();
		});

		$("#call-me-btn-3").on('click', function() {
			testPost();
		});

		$("#call-me-btn-4").on('click', function() {
			testPostList();
		});

		function testConn() {
			$.ajax({
				url : "/api/conn",
				method : "GET",
				success : function(result) {
					console.log(result);
					$("#call-me-1").text(result);
				},
				error : function(error) {
					console.log(error);
				}
			});
		}

		function testJson() {
			$.ajax({
				url : "/api/testJsonShape",
				method : "GET",
				success : function(result) {
					$("#call-me-2").text(result.name);
					console.log(result);
					console.log(typeof (result), result.name);
				},
				error : function(error) {
					console.log(error);
				}
			});
		}

		function testPost() {
			const data = {
				name : "클라이언트 이름",
				password : "qwer1234",
				age : 123,
				address : {
					city : "대전"
				}
			};
			// "/api/join" 먼저 테스트 후 변경
			const url = "/api/joinWithConverter";
			$.ajax({
				url : url,
				method : "POST",
				contentType : "application/json",
				data : JSON.stringify(data),
				success : function(result) {
					console.log(result);
					$("#call-me-3").text(result.name);
				},
				error : function(error) {
					console.log(error);
				}
			});
		}
		function testPostList() {
			const data = {
				users : [ {
					name : "클라이언트 이름1",
					password : "qwer1234",
					age : 123,
					address : {
						city : "대전"
					}
				}, {
					name : "클라이언트 이름2",
					password : "qwer1234",
					age : 123,
					address : {
						city : "익산"
					}
				}, {
					name : "클라이언트 이름3",
					password : "qwer1234",
					age : 123,
					address : {
						city : "춘전"
					}
				}, ]
			}

			const url = "/api/joinList";
			$.ajax({
				url : url,
				method : "POST",
				contentType : "application/json",
				data : JSON.stringify(data),
				success : function(result) {
					console.log(result);
					$("#call-me-4").empty();
					result.forEach((u,i) => {
				           let userDiv = $("<div></div>").addClass("user-info-" + (i + 1));

				            userDiv.append(`<p>Name: \${u.name}</p>`);
				            userDiv.append(`<p>Password: \${u.password}</p>`);
				            userDiv.append(`<p>Age: \${u.age}</p>`);
				            userDiv.append(`<p>City: \${u.address.city}</p>`);

				            $("#call-me-4").append(userDiv);
				            console.log(u);
					})
					
					for(let i=0; i < result.length; i++){
						const user = result[i];
						$("#call-me-4").append(user);
					}
					
				},
				error : function(error) {
					console.log(error);
				}
			})
		}
	</script>
</body>
</html>
