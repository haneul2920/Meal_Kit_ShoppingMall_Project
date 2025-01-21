package com.cookit.mypage.service;

import com.cookit.mypage.vo.MyPageVO;

public interface MyPageService {
    MyPageVO getUserInfo(int userId); // 사용자 정보 조회
    void updateUserInfo(MyPageVO myPageVO); // 사용자 정보 수정
}

