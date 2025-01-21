package com.cookit.mypage.dao;

import com.cookit.mypage.vo.MyPageVO;

public interface MyPageDAO {
    MyPageVO getUserInfo(int userId); // 사용자 정보 조회
    void updateUserInfo(MyPageVO myPageVO); // 사용자 정보 수정
}
