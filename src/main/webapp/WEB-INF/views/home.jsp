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
	<div>
		<div>
			<button id="call-me-btn-1">누르시오-1</button>
			<div id="call-me-1"></div>
		</div>
		<div>
			<button id="call-me-btn-2">누르시오-2</button>
			<div id="call-me-2"></div>
		</div>
		<div>
			<button id="call-me-btn-3">누르시오-3</button>
			<div id="call-me-3"></div>
		</div>
		<div>
			<button id="call-me-btn-4">누르시오-4</button>
			<div id="call-me-4"></div>
		</div>
	</div>
	<script type="text/javascript">
document.querySelector("button#call-me-btn-1").addEventListener("click",() => {
	fetch("/api/conn")
	.then(function(response){
		return response.text()
		})
	.then(function(result){
		document.querySelector("div#call-me-1").innerHTML = `<h3>\${result}</h3>`
	})
})

document.querySelector("button#call-me-btn-2").addEventListener("click",() => {
	fetch("/api/testJson")
	.then(function(response){
		return response.json()
		})
	.then(function(result){
		document.querySelector("div#call-me-2").innerHTML = `<h3>\${result.name}</h3>`
	})
})

document.querySelector("button#call-me-btn-3").addEventListener("click",() => {
	const data =             {
            "name" : "클라이언트 이름11",
            "password" : "qwer1234",
            "age" : 123,
            "address" : {
                "city" : "나주"
            }
        }
	fetch("/api/testJson",{
		method: 'post',
		body: JSON.stringify(data),
		headers:{
			'Content-type' : 'application/json'
		}
	})
	.then(function(response){
		return response.json()
		})
	.then(function(result){
		document.querySelector("div#call-me-3").innerHTML = `<h3>\${result.name}</h3>`
	})
})
$('button#call-me-btn-4').on('click',function(){
	const data ={   
		    "id": 77,
		    "users" :
		        [
		            {
		                "name" : "클라이언트 이름11",
		                "password" : "qwer1234",
		                "age" : 123,
		                "address" : {
		                    "city" : "나주"
		                }
		            },
		            {
		                "name" : "클라이언트 이름22",
		                "password" : "qwer1234",
		                "age" : 123,
		                "address" : {
		                    "city" : "대전"
		                }
		            },
		            {
		                "name" : "클라이언트 이름33",
		                "password" : "qwer1234",
		                "age" : 123,
		                "address" : {
		                    "city" : "춘천"
		                }
		            }
		        ]
		}
	
	$.ajax({
		url : '/api/joinList',
		method: 'post',
		contentType : 'application/json',
		data: JSON.stringify(data),
		success: function(result){
			$("#call-me-4").empty();
			result.forEach((user, idx) => {
				console.log(user)
				let userDiv = $("<div></div>").addClass(`user-info-\${idx + 1}`);
				
				userDiv.append(`<p>Name: \${user.name}</p>`);
				userDiv.append(`<p>Password: \${user.password}</p>`);
				userDiv.append(`<p>Age: \${user.age}</p>`);
				userDiv.append(`<p>City: \${user.address.city}</p><br>`);
				
				$("#call-me-4").append(userDiv);
				
			})
		},
		error : (error) => { console.error(error) }
	})
})


</script>
</body>
</html>
