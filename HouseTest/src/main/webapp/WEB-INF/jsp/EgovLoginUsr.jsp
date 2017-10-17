<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
 /**
  * @Class Name : EgovLoginUsr.jsp
  * @Description : Login 인증 화면
  * @Modification Information
  * @
  * @  수정일         수정자                   수정내용
  * @ -------    --------    ---------------------------
  * @ 2009.03.03    박지욱          최초 생성
  *   2011.09.25    서준식          사용자 관리 패키지가 미포함 되었을때에 회원가입 오류 메시지 표시
  *   2011.10.27    서준식          사용자 입력 탭 순서 변경
  *  @author 공통서비스 개발팀 박지욱
  *  @since 2009.03.03
  *  @version 1.0
  *  @see
  *
  *  Copyright (C) 2009 by MOPAS  All right reserved.
  */
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
		<title>로그인</title>
		<script type="text/javaScript" language="javascript">

			function actionLogin() {
			
			    if (document.loginForm.id.value =="") {
			        alert("아이디를 입력하세요");
			    } else if (document.loginForm.password.value =="") {
			        alert("비밀번호를 입력하세요");
			    } else {
			        document.loginForm.action="<c:url value='/jsp/login.do'/>";
			        //document.loginForm.j_username.value = document.loginForm.userSe.value + document.loginForm.username.value;
			        //document.loginForm.action="<c:url value='/j_spring_security_check'/>";
			        document.loginForm.submit();
			    }
			}
			
			function goRegiUsr() {
			
				var useMemberManage = '${useMemberManage}';
			
				if(useMemberManage != 'true'){
					alert("사용자 관리 컴포넌트가 설치되어 있지 않습니다. \n관리자에게 문의하세요.");
					return false;
				}
			
			    var userSe = document.loginForm.userSe.value;
			  
			}
			
			</script>
	</head>
	<body onLoad="fnInit();">
		
		<div>
			<form name="loginForm" action ="<c:url value='jsp/login.do'/>" method="post">
				<div style="visibility:hidden;display:none;">
					<input name="iptSubmit1" type="submit" value="전송" title="전송">
				</div>
				<input type="hidden" id="message" name="message" value="<c:out value='${message}'/>">
				일반로그인
				<table>
					<tbody>
						<tr>
							<th class="required_text" nowrap><label for="id">아이디&nbsp;&nbsp;</label></th>
							<td><input type="text" name="id" id="id"/></td>
						</tr>
						<tr>
							<th class="required_text" nowrap><label for="password">비밀번호&nbsp;&nbsp;</label></th>
							<td><input type="password" name="password" id="password" onKeyDown="javascript:if (event.keyCode == 13) { actionLogin(); }"/></td> 
						</tr>
					</tbody>
				</table>
				<span class="button"><a href="#LINK" onClick="actionLogin()" tabindex="7">로그인</a></span>
				<span class="button"><a href="#LINK" onClick="goRegiUsr();" tabindex="8">회원가입</a></span>
			</form>
		</div>
	</body>
</html>


