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
        document.loginForm.action="<c:url value='/uat/uia/actionLogin.do'/>";
        //document.loginForm.j_username.value = document.loginForm.userSe.value + document.loginForm.username.value;
        //document.loginForm.action="<c:url value='/j_spring_security_check'/>";
        document.loginForm.submit();
    }
}

function actionCrtfctLogin() {
    document.defaultForm.action="<c:url value='/uat/uia/actionCrtfctLogin.do'/>";
    document.defaultForm.submit();
}

function goRegiUsr() {

	var useMemberManage = '${useMemberManage}';

	if(useMemberManage != 'true'){
		alert("사용자 관리 컴포넌트가 설치되어 있지 않습니다. \n관리자에게 문의하세요.");
		return false;
	}

    var userSe = document.loginForm.userSe.value;
    // 일반회원
    if (userSe == "GNR") {
        document.loginForm.action="<c:url value='/uss/umt/EgovStplatCnfirmMber.do'/>";
        document.loginForm.submit();
    // 기업회원
    } 
}

</script>
</head>
<body onLoad="fnInit();">
<table width="700" cellspacing="0" cellpadding="0">
  <tr>
    <td align="center">
   		<c:import url="/uss/ion/lsi/getLoginScrinImageResult.do" charEncoding="utf-8"></c:import>
    </td>
  </tr>
</table>

  <table width="700" >
    <tr>
      <td width="350" height="250">
          <!--일반로그인 테이블 시작-->
          <form name="loginForm" action ="<c:url value='/uat/uia/actionLogin.do'/>" method="post">
			<div style="visibility:hidden;display:none;">
			<input name="iptSubmit1" type="submit" value="전송" title="전송">
			</div>
            <input type="hidden" id="message" name="message" value="<c:out value='${message}'/>">
            <table width="303" border="0" cellspacing="8" cellpadding="0">
              <tr>
                <td width="40%"class="title_left"><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif'/>" width="16" height="16" hspace="3" align="middle" alt="login">&nbsp;일반로그인</td>
              </tr>
              <tr>
                <td width="303" height="210" valign="top" style="background:url(<c:url value='/images/egovframework/com/uat/uia/login_bg01.gif' />) no-repeat;">
                    <table width="303" border="0" align="center" cellpadding="0" cellspacing="0">
                      <tr>
                        <td height="70">&nbsp;</td>
                      </tr>
                      <tr>
                        <td>
                            <table border="0" cellpadding="0" cellspacing="0" style="width:250px;margin-left:20px;">
                              <tr>
                                <td>
                                    <table width="250" border="0" cellpadding="0" cellspacing="0">
                                      <tr>
                                        <td class="required_text" nowrap><label for="id">아이디&nbsp;&nbsp;</label></td>
                                        <td><input type="text" name="id" id="id" style="height: 16px; width: 85px; border: 1px solid #CCCCCC; margin: 0px; padding: 0px; ime-mode: disabled;" tabindex="4" maxlength="10"/></td>
                                        <td/>
                                      </tr>
                                      <tr>
                                        <td class="required_text" nowrap><label for="password">비밀번호&nbsp;&nbsp;</label></td>
                                        <td><input type="password" name="password" id="password" style="height: 16px; width: 85px; border: 1px solid #CCCCCC; margin: 0px; padding: 0px; ime-mode: disabled;" maxlength="12" tabindex="5" onKeyDown="javascript:if (event.keyCode == 13) { actionLogin(); }"/></td>
                                      </tr>
                                    </table>
                                </td>
                              </tr>
                              <tr>
                                <td height="10">&nbsp;</td>
                              </tr>
                              <tr>
                                <td>
                                    <table border="0" cellspacing="0" cellpadding="0">
                                      <tr>
                                        <td><span class="button"><a href="#LINK" onClick="actionLogin()" tabindex="7">로그인</a></span></td>
                                        <td>&nbsp;</td>
                                        <td><span class="button"><a href="#LINK" onClick="goRegiUsr();" tabindex="8">회원가입</a></span></td>
                                      </tr>
                                    </table>
                                </td>
                              </tr>
                              <tr>
                                <td height="3"></td>
                              </tr>
                            </table>
                        </td>
                      </tr>
                      <tr>
                        <td height="2">&nbsp;</td>
                      </tr>
                    </table>
                </td>
              </tr>
            </table>
            <input name="userSe" type="hidden" value="GNR"/>
            <input name="j_username" type="hidden"/>
        </form>
        <!--일반로그인 테이블 끝-->
      </td>
    </tr>
  </table>

</body>
</html>


