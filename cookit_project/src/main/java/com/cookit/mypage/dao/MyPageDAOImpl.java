package com.cookit.mypage.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cookit.mypage.vo.MyPageVO;

@Repository
public class MyPageDAOImpl implements MyPageDAO {
    @Autowired
    private SqlSession sqlSession;

    private static final String NAMESPACE = "mypageMapper.";

    @Override
    public MyPageVO getUserInfo(int userId) {
        return sqlSession.selectOne(NAMESPACE + "getUserInfo", userId);
    }
}

