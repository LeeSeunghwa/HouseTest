package com.develop.housetest.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.develop.housetest.service.LoginService;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("loginSerivce")
public class LoginServiceImpl extends EgovAbstractServiceImpl implements LoginService{

	@Resource(name="loginDAO")
    private LoginDAO loginDAO;
	
	@Override
	public LoginVO actionLogin(LoginVO vo) throws Exception {

		vo.getId();
		vo.getPass();
		
    	// 2. 아이디와 암호화된 비밀번호가 DB와 일치하는지 확인한다.
    	LoginVO loginVO = loginDAO.actionLogin(vo);

    	// 3. 결과를 리턴한다.
    	if (loginVO != null && !loginVO.getId().equals("") && !loginVO.getPass().equals("")) {
    		return loginVO;
    	} else {
    		loginVO = new LoginVO();
    	}

    	return loginVO;
    }
}
