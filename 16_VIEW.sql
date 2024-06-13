-- view
-- select 쿼리문을 저장한 객체 -- > 가상테이블이라고 불린다.
-- 실질적인 데이터를 물리적으로 저장하고 있지 않음
-- 테이블을 사용한느 것과 같이 동일하게 사용 가능하다.

select * from tbl_menu;

-- hansik
select * from tbl_menu
where
    category_code = 4;

-- view 생성
create view hansik as
    select *
from tbl_menu
where
    category_code = 4;

select * from hansik;

-- 베이스 테이블 (tbl_menu) 정보가 변경되면 view의 결과도 같이 변경된다.
insert into tbl_menu values(null, '식혜맛국밥', 5500, 4, 'Y');
select * from hansik;

-- view를 통해 데이터를 넣기
-- 1) view를 통한 insert(view auto_increment 가 없으므로, pk 컬럼의 값을 지정해줘야한다.)
insert into hansik values(null, '수정과맛국밥', 5500,4,'Y');

-- view를 통한 업데이트
update hansik
set
    menu_name = '버터맛국밥', menu_price = 5700
where
    menu_code = 23;

select * from tbl_menu;

-- view를 통한 delete
delete from hansik
where
    menu_code = 23;

-- 사용된 subquery에 따라 명령어로 조작이 불가능한 경우
-- 1) 뷰 정의에 포함되지 않은 컬럼을 조작하는 경우
-- 2) 뷰에 포함되지 않는 컬럼 중에 베이스가 되는 테이블 컬럼이 not null 제약조건에 지정된 경우
-- 3) 산술 표현식이 정의된 경우
-- 4) join를 이용해 미리 테이블을 연결한 경우
-- 5) distinct를 포함한 경우
-- 6) 그룹함수나 group by를 포함한 경우

-- view 삭제
drop view hansik;

-- view에 쓰인 subquery 연산 결과도 컬럼으로 사용 가능하다.
create view hansik as
    select
        menu_name as '메뉴명',
        truncate(menu_price / 1000, 1) as '가격(천원)',
        category_name as '카테고리명'
from tbl_menu a
join tbl_category b
on a.category_code = b.category_code
where
    b.category_name = '한식';

-- or replace 옵션
-- 테이블을 drop하지 않고 기존의 view를 새로운 view로 쉽게 교체가능
create or replace view hansik as
    select
        menu_code as '메뉴코드',
        menu_name as '메뉴명',
        category_name as '카테고리명'
from
    tbl_menu a
 join tbl_category b
on a.category_code = b.category_code
where b.category_name = '한식';