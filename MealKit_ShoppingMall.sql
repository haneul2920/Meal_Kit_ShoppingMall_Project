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

drop table user;
drop table category;
drop table product;
drop table order_history;
drop table order_product;
drop table cart;
drop table review;
drop table service_center;
drop table delivery_address;

-- 회원 테이블
CREATE TABLE `user` (
  `user_id` INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT '사용자 고유번호',
  `user_type` ENUM('member', 'guest') NULL COMMENT '사용자 구분',
  `manager_id` INT UNSIGNED NULL COMMENT '관리자 고유번호',
  `name` VARCHAR(50) NOT NULL COMMENT '사용자 아이디',
  `password` VARCHAR(255) NULL COMMENT '사용자 비밀번호',
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
  `product_name` VARCHAR(100) NOT NULL COMMENT '상품 이름',
  `product_description` VARCHAR(100) NOT NULL COMMENT '상품 설명',
  `price` INT UNSIGNED NOT NULL COMMENT '상품 가격',
  `product_amount` INT UNSIGNED DEFAULT 0 COMMENT '남은 재고',
  `product_image` VARCHAR(50) NOT NULL COMMENT '상품 이미지',
  `category_id` INT UNSIGNED NOT NULL COMMENT '카테고리 고유번호',
  FOREIGN KEY (`category_id`) REFERENCES `category`(`category_id`)
);

-- 주문 기록 테이블
CREATE TABLE `order_history` (
  `order_id` INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT '주문 고유번호',
  `user_id` INT UNSIGNED NOT NULL COMMENT '사용자 고유번호',
  `order_date` DATE NOT NULL COMMENT '주문일',
  `order_state` VARCHAR(50) NOT NULL COMMENT '주문 상태',
  `order_price` INT UNSIGNED NOT NULL COMMENT '결제 금액',
  `payment` VARCHAR(50) NOT NULL  COMMENT '결제 방식',
  FOREIGN KEY (`user_id`) REFERENCES `user`(`user_id`)
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
  `user_id` INT UNSIGNED NULL COMMENT '사용자 고유번호',
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
  `user_id` INT UNSIGNED NULL COMMENT '사용자 고유번호',
  `rating` TINYINT UNSIGNED CHECK (`rating` BETWEEN 1 AND 5) COMMENT '평점',
  `comment` VARCHAR(500) NULL COMMENT '리뷰 코맨트',
  `review_date` DATE NOT NULL COMMENT '리뷰 날짜',
  FOREIGN KEY (`product_id`) REFERENCES `product`(`product_id`),
  FOREIGN KEY (`order_id`) REFERENCES `order_history`(`order_id`),
  FOREIGN KEY (`user_id`) REFERENCES `user`(`user_id`)
);

-- 고객센터 테이블
CREATE TABLE `service_center` (
  `inquiry_id` INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT '고객센터 고유번호',
  `user_id` INT UNSIGNED NULL COMMENT '사용자 고유번호',
  `inquiry_type` VARCHAR(50) NOT NULL COMMENT '문의유형',
  `inquiry_content` VARCHAR(500) NOT NULL COMMENT '문의내용',
  `inquiry_date` DATE NOT NULL COMMENT '문의날짜',
  `response_status` VARCHAR(20) NOT NULL COMMENT '답변상태',
  `response_content` VARCHAR(500) NULL COMMENT '답변내용',
  `response_date` DATE NULL COMMENT '답변날짜',
  FOREIGN KEY (`user_id`) REFERENCES `user`(`user_id`)
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

