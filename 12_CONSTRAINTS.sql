create database user_db;    -- db 생성
show databases;     -- 전체 db 목록 조회
grant all privileges on user_db.* to 'ohgirafrers'@'%'; -- 권한 부여
show grants for 'ohgiraffers'@'%';  -- 권한 조회

use user_db;    -- user_db 사용

-- constraints
-- 제약조건, 테이블에 데이터가 입력되거나 수정될 때의 규칙을 정의한다.
-- 데이터 무결성을 보장하는데 도움이 된다.

-- not null
-- null 값을 허용하지 않는 조건

drop table if exists user_notnull;

create table if not exists user_notnull
(
    user_no int not null,
    user_id varchar(255) not null,
    user_pwd varchar(255) not null,
    user_name varchar(255) not null,
    gender varchar(3),
    phone varchar(255) not null,
    email varchar(255)
);

insert into user_notnull
(user_no, user_id, user_pwd, user_name, gender, phone,email)
values(1, 'user01','pass01', '홍길동', '남','010-1234-5678','hon123@gmail.com'),
      (2, 'user02','pass02', '유관순', '여','010-7777-7777','yu77@gmail.com');

-- unique
-- 중복값 허용하지 않는 제약조건
drop table if exists user_unique;

create table if not exists user_unique
(
    user_no int not null, -- 기본키
    user_id varchar(255) not null,
    user_pwd varchar(255) not null,
    user_name varchar(255) not null,
    gender varchar(3),
    phone varchar(255) not null,
    email varchar(255)
);

select * from user_unique;

-- 같은 내용을 두번 insert 했을 때,
-- user_no의 unique 키가 중복되게 되면서
-- [23000][1062] Duplicate entry '1' for key 'user_unique.user_no' 발생
insert into user_unique
(user_no, user_id, user_pwd, user_name, gender, phone,email)
values(1, 'user01','pass01', '홍길동', '남','010-1234-5678','hon123@gmail.com'),
      (2, 'user02','pass02', '유관순', '여','010-7777-7777','yu77@gmail.com');

-- primary key
-- 테이블에서 한 행의 정보를 찾기 위해 사용할 컬럼의 읨
-- not null + unique 제약조건을 의미
-- 한 테이블당 한 개만 설정할 수 있다.
-- 한 개의 칼럼에 설정할 수도 있고, 여러 개의 칼럼을 묶어서 설정할 수 도 있다.(복합키)


drop table if exists user_primarykey;

create table if not exists user_primarykey
(
    user_no int not null, -- 기본키
    -- user_no int primary key,
    user_id varchar(255) not null,
    user_pwd varchar(255) not null,
    user_name varchar(255) not null,
    gender varchar(3),
    phone varchar(255) not null,
    email varchar(255),
    primary key (user_no)
);

select * from user_primarykey;

-- 같은 내용을 두번 insert 했을 때,
-- user_no의 unique 키가 중복되게 되면서
-- [23000][1062] Duplicate entry '1' for key 'user_unique.user_no' 발생
insert into user_unique
(user_no, user_id, user_pwd, user_name, gender, phone,email)
values(1, 'user01','pass01', '홍길동', '남','010-1234-5678','hon123@gmail.com'),
      (2, 'user02','pass02', '유관순', '여','010-7777-7777','yu77@gmail.com');




