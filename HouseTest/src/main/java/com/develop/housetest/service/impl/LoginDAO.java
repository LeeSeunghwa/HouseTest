package com.develop.housetest.service.impl;

import org.springframework.stereotype.Repository;

@Repository("loginDAO")
public class LoginDAO extends EgovComAbstractDAO {

	public LoginVO actionLogin(LoginVO vo) throws Exception {
    	return (LoginVO)select("loginDAO.actionLogin", vo);
    }
}
