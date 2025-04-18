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

drop table order_product;
drop table cart;
drop table review;
drop table service_center;
drop table delivery_address;
drop table product;
drop table order_history;
drop table user;
drop table category;



-- 회원 테이블
CREATE TABLE `user` (
  `user_code` INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT '사용자 고유번호',
  `user_type` ENUM('user', 'guest') NULL COMMENT '사용자 구분',
  `manager_id` INT UNSIGNED NULL COMMENT '관리자 고유번호',
  `user_id` VARCHAR(50) NOT NULL COMMENT '사용자 아이디',
  `user_pwd` VARCHAR(255) NULL COMMENT '사용자 비밀번호',
  `username` VARCHAR(50) UNIQUE NULL COMMENT '사용자 이름',
  `phone_num` VARCHAR(20) UNIQUE NOT NULL COMMENT '전화번호',
  `email` VARCHAR(50) UNIQUE NOT NULL COMMENT '이메일',
  `address` VARCHAR(255) NOT NULL COMMENT '주소',
  `cash_point` INT UNSIGNED DEFAULT 0 COMMENT '적립 포인트',
  `gender` ENUM('male', 'female') NULL COMMENT '성별'
);

-- 카테고리 테이블
CREATE TABLE `category` (
  `category_id` INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT '카테고리 고유번호',
  `category_name` VARCHAR(50) NOT NULL COMMENT '카테고리 이름'
);

-- 상품 테이블
CREATE TABLE `product` (
  `product_id` INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT '상품 고유번호',
  `product_name` VARCHAR(100) NOT NULL UNIQUE KEY COMMENT '상품 이름',
  `product_description` VARCHAR(100) NOT NULL COMMENT '상품 설명',
  `price` INT UNSIGNED NOT NULL COMMENT '상품 가격',
  `product_amount` INT UNSIGNED DEFAULT 0 COMMENT '남은 재고',
  `product_image` VARCHAR(50) NOT NULL COMMENT '상품 이미지',
  `category_id` INT UNSIGNED NOT NULL COMMENT '카테고리 고유번호',
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
  `product_image` VARCHAR(50) NOT NULL COMMENT '상품 이미지',
  `product_weight` VARCHAR(10) DEFAULT '상세페이지 참조' COMMENT '중량',
  `delivery area` VARCHAR(50) NOT NULL COMMENT '배송가능지역',
  `delivery_method` VARCHAR(50) DEFAULT '택배' COMMENT '배송방법',
  `import_notice` VARCHAR(30) DEFAULT '해당사항 없음' COMMENT '수입식품 문구',
  `special_category` VARCHAR(50) DEFAULT '해당사항 없음' COMMENT '영유아식 또는 체중조절식품 등에 해당 여부',
  `customer_service` VARCHAR(30) DEFAULT '마이셰프 고객센터 (1668-3980)' COMMENT '소비자상담번호',
  `warnings` VARCHAR(30) DEFAULT '상세페이지 참조' COMMENT '주의사항',  
  FOREIGN KEY (`product_name`) REFERENCES `product`(`product_name`)
);


-- 주문 기록 테이블
CREATE TABLE `order_history` (
  `order_id` INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT '주문 고유번호',
  `user_code` INT UNSIGNED NOT NULL COMMENT '사용자 고유번호',
  `order_date` DATETIME NOT NULL COMMENT '주문일',
  `order_state` VARCHAR(50) NOT NULL COMMENT '주문 상태',
  `order_price` INT UNSIGNED NOT NULL COMMENT '결제 금액',
  `payment` VARCHAR(50) NOT NULL  COMMENT '결제 방식',
  FOREIGN KEY (`user_code`) REFERENCES `user`(`user_code`)
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
  `user_code` INT UNSIGNED NULL COMMENT '사용자 고유번호',
  `product_id` INT UNSIGNED NOT NULL COMMENT '상품 고유번호',
  `amount` INT UNSIGNED DEFAULT 1 COMMENT '장바구니 수량',
  FOREIGN KEY (`user_code`) REFERENCES `user`(`user_code`),
  FOREIGN KEY (`product_id`) REFERENCES `product`(`product_id`)
);

-- 리뷰 테이블
CREATE TABLE `review` (
  `review_id` INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT '리뷰 고유번호',
  `product_id` INT UNSIGNED NOT NULL  COMMENT '상품 고유번호',
  `order_id` INT UNSIGNED NOT NULL COMMENT '주문 고유번호',
  `user_code` INT UNSIGNED NULL COMMENT '사용자 고유번호',
  `rating` TINYINT UNSIGNED CHECK (`rating` BETWEEN 1 AND 5) COMMENT '평점',
  `comment` VARCHAR(500) NULL COMMENT '리뷰 코맨트',
  `review_date` DATETIME NOT NULL COMMENT '리뷰 날짜',
  FOREIGN KEY (`product_id`) REFERENCES `product`(`product_id`),
  FOREIGN KEY (`order_id`) REFERENCES `order_history`(`order_id`),
  FOREIGN KEY (`user_code`) REFERENCES `user`(`user_code`)
);

-- 고객센터 테이블
CREATE TABLE `service_center` (
  `inquiry_id` INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT '고객센터 고유번호',
  `user_code` INT UNSIGNED NULL COMMENT '사용자 고유번호',
  `inquiry_type` VARCHAR(50) NOT NULL COMMENT '문의유형',
  `inquiry_content` VARCHAR(500) NOT NULL COMMENT '문의내용',
  `inquiry_date` DATETIME NOT NULL COMMENT '문의날짜',
  `response_status` VARCHAR(20) NOT NULL COMMENT '답변상태',
  `response_content` VARCHAR(500) NULL COMMENT '답변내용',
  `response_date` DATETIME NULL COMMENT '답변날짜',
  FOREIGN KEY (`user_code`) REFERENCES `user`(`user_code`)
);

-- 배송 주소 테이블
CREATE TABLE `delivery_address` (
  `delivery_id` INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT '배송지 고유번호',
  `order_id` INT UNSIGNED NOT NULL COMMENT '주문 고유번호',
  `address` VARCHAR(255) NOT NULL COMMENT '주소',
  `username` VARCHAR(50) NOT NULL COMMENT '사용자 이름',
  `phone_num` VARCHAR(20) NOT NULL COMMENT '전화번호',
  FOREIGN KEY (`order_id`) REFERENCES `order_history`(`order_id`) ON DELETE CASCADE
);

insert into `user`(`user_type`, `manager_id`, `user_id`, `user_pwd`, `username`, `phone_num`, `email`, `address`, `cash_point`, `gender`)values('user', 123 , 'Lee', '12345678', '이순자', '010-1234-5678', 'Lee@test.com', '서울', 0, 'male');