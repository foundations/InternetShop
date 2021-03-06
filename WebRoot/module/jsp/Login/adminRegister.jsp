<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
    
    <title>My JSP 'adminRegister.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css"
	href="./module/css/Login/register.css">
	<script type="text/javascript" src="module/js/frame/jquery.js"></script>
<script type="text/javascript">
$(function() {
		$("#usernameSHU").blur(function() {
			var user = $("#usernameSHU").val();
			$.ajax({
				data : {
					username : user
				},
				url : 'loginController/validateAdmin.do',
				dataType : 'json',
				success : function(result) {
					if (result == 0) {
					var repeatSpan = document.getElementById("repeat");
						repeatSpan.style.display="inline";
						repeatSpan.innerText="用户名有人用了!";
						document.getElementById("password").disabled = true;
						document.getElementById("telphone").disabled = true;
						document.getElementById("realname").disabled = true;
						document.getElementById("registBtn").disabled = true;						
					}
				}
			});
		})	
	  $("#fileUpload").change(function() {  
	        var $file = $(this);  
	        var objUrl = $file[0].files[0];  
	        var windowURL = window.URL || window.webkitURL;  
	        var dataURL;  
	        
	        dataURL = windowURL.createObjectURL(objUrl); 
	        console.log(objUrl);
	        $("#imageview").attr("src",dataURL);  
	        
	    });  
	});
	function change(){
		document.getElementById("password").disabled = false;
		document.getElementById("telphone").disabled = false;
		document.getElementById("realname").disabled = false;
		document.getElementById("registBtn").disabled = false;	
		if($("input[name='username']").val()==""){
			var repeatSpan = document.getElementById("repeat");
			repeatSpan.innerText="";			
		}	
	}
	</script>
  </head>
  
  <body>
   	<form method="post" enctype="multipart/form-data" action="loginController/adminRegister.do">
    	<div class="input-group">
			<span class="input-group-addon">登录账号</span>
			<input type="text" onchange="change()" class="form-control" name="username" id="usernameSHU">
		</div>
		<span id="repeat" style="position:absolute;left:80%;top:8%;display:none;"></span>
		<div class="input-group">
			<span class="input-group-addon">真实姓名</span>
			<input type="text" class="form-control" name="realname" id="realname">
		</div>
		<div class="input-group">
			<span class="input-group-addon">登录密码</span>
			<input type="password" class="form-control" name="password" id="password">
		</div>
		<div class="input-group">
			<span class="input-group-addon">联系方式</span>
			<input type="text" class="form-control" name="telphone" id="telphone">
		</div>
		<div class="input-group">
			<span class="input-group-addon">用户头像</span>
			<img id="imageview"  width="100px" height="100px" src="./module/img/Login/defaultHeader.jpg">  
			<input type="file" class="form-control" name="file" id="fileUpload"/>
		</div>
		<div class="input-group">
			<span class="input-group-addon">用户性别</span>
			<input type=radio name="sex" checked value="0">男 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type=radio name="sex" value="1">女
		</div>
    	<div>
    		<input type="submit" value="注册" class="registerBtn" id="registBtn"/>
    		<input type="button" value="取消" class="registerBtn" onclick="cancelRegister()"/>
    	</div>
    </form>
  </body>
</html>
