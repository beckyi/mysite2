<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>  
<!doctype html>
<html>
<head>
<title>mysite</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="/mysite2/assets/css/user.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="/mysite2/assets/js/jquery/jquery-1.9.0.js"></script>
<script type="text/javascript">
/*
$(function(){
	$("#join-form").submit(function(){
		console.log("form check");
		//이름 체크
		if($("#name").val() == ""){
		alert("이름은 필수 입력 항목입니다.");
		$("#name").focus();
		return false;
		}
		//이메일
		if($("#email").val() == ""){
			alert("이메일은 필수 입력 항목입니다.");
			$("#email").focus();
			return false;
			}
		//패스워드
		if($("#password").val() == ""){
			alert("비밀번호는 필수 입력 항목입니다.");
			$("#password").focus();
			return false;
			}
		//약관동의
		if($("#agree-prov").is(':checked') == false ) {
	         alert("약관 동의가 필요합니다.");
	         return false;
	      }
	console.log("submit!!");
	return true;
	
	});
	
	$("#email").change(function(){
		$("#image-checked").hide();
		$("#btn-checkEmail").show();
	});
	
	$("#btn-checkEmail").click(function(){
		var email = $("#email").val();
		if(email == ""){
			return;
		}
		$.ajax({
			"url": "/mysite/user?a=checkemail&email=" + email,
			"type": "get",
			"dataType": "json",
			"data": "",
			"success": function(response){
				//console.log(response);
				if(response.result == "fail"){
					console.error("error:"+response.message);
					return ;
				}
				
				if(response.data == true){
					alert("이미 존재하는 이메일입니다. 다른 이메일을 사용해 주세요.");
					$("#email").val("").focus();
					return;
				}
				//console.log("사용할 수 있음!");
				$("#image-checked").show();
				$("#btn-checkEmail").hide();
			},
			
			"error": function(jsXHR, status, e){
				console.error("error:"+status+":"+e);
			}
		});
	});
});
*/
</script>
</head>
<body>
	<div id="container">
	<c:import url='/WEB-INF/views/include/header.jsp'/>
		<div id="content">
			<div id="user">
				<form id="join-form" name="joinForm" method="post" action="/mysite2/user/join">
				<!-- <input type="hidden" name="a" value="join"/>  -->
					<label class="block-label" for="name">이름</label>
					<input id="name" name="name" type="text" value="">

					<label class="block-label" for="email">이메일</label>
					<input id="email" name="email" type="text" value="">
					<img id="image-checked"  style="width:16px; display: none" src="/mysite2/assets/images/check.png"/>
					<input type="button" id="btn-checkEmail" value="id 중복체크">
					
					<label class="block-label">패스워드</label>
					<input id="password" name="password" type="password" value="">
					
					<fieldset>
						<legend>성별</legend>
						<label>여</label> <input type="radio" name="gender" value="FEMALE" checked="checked">
						<label>남</label> <input type="radio" name="gender" value="MALE">
					</fieldset>
					
					<fieldset>
						<legend>약관동의</legend>
						<input id="agree-prov" type="checkbox" name="agreeProv" value="y">
						<label>서비스 약관에 동의합니다.</label>
					</fieldset>
					
					<input type="submit" value="가입하기">
					
				</form>
			</div>
		</div>
		<c:import url='/WEB-INF/views/include/navi.jsp'/>
		<c:import url='/WEB-INF/views/include/footer.jsp'/>
	</div>
</body>
</html>