package com.cookit.user.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.cookit.user.dao.UserDAO;
import com.cookit.user.vo.UserVO;



@Service("userService")
@Transactional(propagation=Propagation.REQUIRED)
public class UserServiceImpl implements UserService {
	@Autowired
	private UserDAO userDAO;
	
	@Override
	public UserVO login(Map  loginMap) throws Exception{
		return userDAO.login(loginMap);
	}
	
	@Override
	public void addUser(UserVO userVO) throws Exception{
		userDAO.insertNewUser(userVO);
	}
	
	@Override
	public String overlapped(String id) throws Exception{
		return userDAO.selectOverlappedID(id);
	}
	
    @Override
    public UserVO getUserInfo(String userId) {
        return userDAO.selectUserInfo(userId);
    }
    
    @Override
    public UserVO getUserById(String userId) throws Exception {
        return userDAO.selectUserById(userId);
    }

    @Override
    public void updateUser(UserVO userVO) throws Exception {
        userDAO.updateUser(userVO);
    }
    
    @Override
    public void updatePassword(UserVO userVO) throws Exception {
        userDAO.updatePassword(userVO);
    }
}