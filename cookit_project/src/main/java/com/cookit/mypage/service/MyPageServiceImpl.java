package com.cookit.mypage.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cookit.mypage.dao.MyPageDAO;
import com.cookit.mypage.vo.MyPageVO;

@Service
public class MyPageServiceImpl implements MyPageService {

    @Autowired
    private MyPageDAO myPageDAO;

    @Override
    public MyPageVO getUserInfo(int userId) {
        return myPageDAO.getUserInfo(userId);
    }

    @Override
    public void updateUserInfo(MyPageVO myPageVO) {
        myPageDAO.updateUserInfo(myPageVO);
    }
}

