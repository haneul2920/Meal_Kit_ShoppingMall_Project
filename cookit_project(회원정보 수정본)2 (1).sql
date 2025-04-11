DROP DATABASE IF EXISTS MealKit_ShoppingMall;
Create Database MealKit_ShoppingMall;
Use MealKit_ShoppingMall;

select * from user;
select * from category;
select * from product;
select * from order_history;
select * from order_product;
select * from cart;
select * from review;
select * from service_center;
select * from delivery_address;

delete from service_center where user_id = 'asd';

drop table delivery_address;
drop table order_product;
drop table review;
drop table order_history;
drop table faq;
drop table cart;
drop table service_center;
drop table product_inform;
drop table product;
drop table order_history;
drop table user;
drop table category;

-- 회원 테이블
CREATE TABLE `user` (
  `user_id` VARCHAR(50) NOT NULL PRIMARY KEY  COMMENT '사용자 아이디',
  `user_type` ENUM('user', 'guest') NULL COMMENT '사용자 구분',
  `manager_id` INT UNSIGNED UNIQUE NULL COMMENT '관리자 고유번호',
  `user_pwd` VARCHAR(255) NULL COMMENT '사용자 비밀번호',
  `username` VARCHAR(50) UNIQUE NULL COMMENT '사용자 이름',
  `phone_num` VARCHAR(20) UNIQUE NOT NULL COMMENT '전화번호',
  `email1` VARCHAR(50) UNIQUE NOT NULL COMMENT '앞이메일',
  `email2` VARCHAR(50) UNIQUE NOT NULL COMMENT '이메일주소',
  `roadAddress` VARCHAR(255) NOT NULL COMMENT '도로명 주소',
  `jibunAddress` VARCHAR(255) NOT NULL COMMENT '지번 주소',
  `namujiAddress` VARCHAR(255) NOT NULL COMMENT '나머지 주소',
  `zipcode` VARCHAR(20) NULL COMMENT '우편번호',
  `cash_point` INT UNSIGNED DEFAULT 0 COMMENT '적립 포인트',
  `gender` ENUM('male', 'female') NULL COMMENT '성별'
); 

-- 주문 기록 테이블(cash_point 추가, order_date 변경, use_point 추가)
CREATE TABLE `order_history` (
  `order_id` INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT '주문 고유번호',
  `user_id` VARCHAR(50) NOT NULL COMMENT '사용자 고유번호',
  `order_date` DATE  DEFAULT(CURRENT_DATE) COMMENT '주문일',
  `order_state` VARCHAR(50) NOT NULL COMMENT '주문 상태',
  `order_price` INT UNSIGNED NOT NULL COMMENT '결제 금액',
  `payment` VARCHAR(50) NOT NULL  COMMENT '결제 방식',
  `cash_point` INT UNSIGNED DEFAULT 0 COMMENT '적립 포인트',
  `use_point` INT UNSIGNED DEFAULT 0 COMMENT '사용한 포인트',
  FOREIGN KEY (`user_id`) REFERENCES `user`(`user_id`)
);

-- 배송 주소 테이블
CREATE TABLE `delivery_address` (
  `delivery_id` INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT '배송지 고유번호',
  `order_id` INT UNSIGNED NOT NULL COMMENT '주문 고유번호',
  `phone_num` VARCHAR(20) NOT NULL COMMENT '받는 분 휴대폰번호',
  `receiver_name` VARCHAR(20) NOT NULL COMMENT '받는 분 이름',
  `desired_delivery_date` DATE NOT NULL COMMENT '배송희망일',
  `delivery_method` VARCHAR(10) NOT NULL COMMENT '배송방법',
  `road_address` VARCHAR(255) NOT NULL COMMENT '도로명 주소',
  `namuji_address` VARCHAR(255) NOT NULL COMMENT '상세주소',
  `zipcode` VARCHAR(255) NOT NULL COMMENT '우편번호',
  `delivery_request` VARCHAR(255) NOT NULL COMMENT '배송요청사항',
  FOREIGN KEY (`order_id`) REFERENCES `order_history`(`order_id`) ON DELETE CASCADE
);

-- 카테고리 테이블
CREATE TABLE `category` (
  `category_id` INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT '카테고리 고유번호',
  `category_name` VARCHAR(50) NOT NULL COMMENT '카테고리 이름'
);

-- 상품 테이블
CREATE TABLE `product` (
  `product_id` INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT '상품 고유번호',
  `product_name` VARCHAR(100) UNIQUE KEY NOT NULL COMMENT '상품 이름',
  `price` INT UNSIGNED NOT NULL COMMENT '상품 가격',
  `product_amount` INT UNSIGNED DEFAULT 0 COMMENT '남은 재고',
  `category_id` INT UNSIGNED NOT NULL COMMENT '카테고리 고유번호',
  `product_inf_image` VARCHAR(50) NOT NULL COMMENT '상품 정보 이미지',
  `product_image` VARCHAR(50) NOT NULL COMMENT '상품 이미지',
  `reg_id` VARCHAR(30) NOT NULL COMMENT '작성자',
  `post_date` DATE  DEFAULT(CURRENT_DATE) COMMENT '게시일자',
  FOREIGN KEY (`category_id`) REFERENCES `category`(`category_id`)
);

-- 상품 테이블_정보
CREATE TABLE `product_inform` (
  `product_name` VARCHAR(100) NOT NULL DEFAULT '상세페이지 참조' COMMENT '식품의 유형',
  `product_ex_date` VARCHAR(20) NOT NULL COMMENT '소비 기한',
  `ingredient_info` VARCHAR(30) DEFAULT '상세페이지 참조' COMMENT '원재료명 및 함량', 
  `GMO_status` VARCHAR(30) DEFAULT '해당사항 없음' COMMENT '유전자재조합식품 여부',
  `nutrition_facts` VARCHAR(30) DEFAULT '해당사항 없음' COMMENT '영양성분',
  `producer` VARCHAR(20) NOT NULL COMMENT '생산자(제조자)',
  `product_addr` VARCHAR(50) NOT NULL COMMENT '생산자 소재지',
  `product_weight` VARCHAR(10) DEFAULT '상세페이지 참조' COMMENT '중량',
  `delivery_area` VARCHAR(50) NOT NULL COMMENT '배송가능지역',
  `delivery_method` VARCHAR(50) DEFAULT '택배' COMMENT '배송방법',
  `import_notice` VARCHAR(30) DEFAULT '해당사항 없음' COMMENT '수입식품 문구',
  `special_category` VARCHAR(50) DEFAULT '해당사항 없음' COMMENT '영유아식 또는 체중조절식품 등에 해당 여부',
  `customer_service` VARCHAR(30) DEFAULT '쿠키트 고객센터 (1668-7700)' COMMENT '소비자상담번호',
  `warnings` VARCHAR(30) DEFAULT '상세페이지 참조' COMMENT '주의사항',  
  FOREIGN KEY (`product_name`) REFERENCES `product`(`product_name`)
);

-- 주문 상품목록 테이블
CREATE TABLE `order_product` (
  `order_id` INT UNSIGNED NOT NULL  COMMENT '주문 고유번호',
  `product_id` INT UNSIGNED NOT NULL COMMENT '상품 고유번호',
  `quantity` INT UNSIGNED NOT NULL DEFAULT 1  COMMENT '상품 수량',
  PRIMARY KEY (`order_id`, `product_id`),
  FOREIGN KEY (`order_id`) REFERENCES `order_history`(`order_id`) ON DELETE CASCADE,
  FOREIGN KEY (`product_id`) REFERENCES `product`(`product_id`) ON DELETE CASCADE
);

-- 장바구니 테이블
CREATE TABLE `cart` (
  `cart_id` INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT '장바구니 고유번호',
  `user_id`VARCHAR(50) NOT NULL COMMENT '사용자 고유번호',
  `product_id` INT UNSIGNED NOT NULL COMMENT '상품 고유번호',
  `amount` INT UNSIGNED DEFAULT 1 COMMENT '장바구니 수량',
  FOREIGN KEY (`user_id`) REFERENCES `user`(`user_id`),
  FOREIGN KEY (`product_id`) REFERENCES `product`(`product_id`)
);

-- 리뷰 테이블
CREATE TABLE `review` (
  `review_id` INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT '리뷰 고유번호',
  `product_id` INT UNSIGNED NOT NULL  COMMENT '상품 고유번호',
  `order_id` INT UNSIGNED NOT NULL COMMENT '주문 고유번호',
  `user_id` VARCHAR(50) NOT NULL COMMENT '사용자 아이디',
  `rating` TINYINT UNSIGNED CHECK (`rating` BETWEEN 1 AND 5) COMMENT '평점',
  `comment` VARCHAR(500) NULL COMMENT '리뷰 코맨트',
  `review_date` DATETIME NOT NULL COMMENT '리뷰 날짜',
  FOREIGN KEY (`product_id`) REFERENCES `product`(`product_id`),
  FOREIGN KEY (`order_id`) REFERENCES `order_history`(`order_id`),
  FOREIGN KEY (`user_id`) REFERENCES `user`(`user_id`)
);

-- 고객센터 테이블 
CREATE TABLE `service_center` (
  `inquiry_id` INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT '고객센터 문의 고유번호',
  `user_id` VARCHAR(50) NOT NULL COMMENT '사용자 아이디',
  `inquiry_type` VARCHAR(50) NOT NULL COMMENT '문의유형',
  `inquiry_product` VARCHAR(50) NOT NULL COMMENT '문의상품',
  `inquiry_title` TEXT NOT NULL COMMENT '문의제목',
  `inquiry_content` TEXT NOT NULL COMMENT '문의내용',
  `inquiry_date` TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '문의날짜',
  `status` ENUM('문의대기', '문의완료') DEFAULT '문의대기' COMMENT '문의상태',
  `answer_content` TEXT COMMENT '관리자 답변 내용',
  FOREIGN KEY (`user_id`) REFERENCES `user`(`user_id`) ON DELETE CASCADE
);

-- 질문 검색테이블(기능구현안되있음)
CREATE TABLE `faq` (
    `faq_id` INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT 'FAQ 고유번호',
    `question` VARCHAR(500) NOT NULL COMMENT '자주 묻는 질문',
    `answer` TEXT NOT NULL COMMENT '답변',
    `category` VARCHAR(100) NOT NULL COMMENT '카테고리',
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '생성 날짜'
);


insert into category (category_name) value('한식');
insert into category (category_name) value('중식');
insert into category (category_name) value('일식');
insert into category (category_name) value('양식');
insert into category (category_name) value('분식');
insert into category (category_name) value('동남아식');

