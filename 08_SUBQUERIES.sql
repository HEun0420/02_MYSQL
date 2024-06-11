-- Subquery
-- 서브 쿼리는 다른 쿼리에서 실행되는 쿼리
-- 존재하지 않는 조건에 근거한 값들을 검색하고자 할 때 사용한다.
-- 메인쿼리가 서브쿼리를 포함하는 종속적인 관계이다.

-- 서브쿼리의 유형
-- 1. 일반 서브쿼리
--   1-a. 단일행 일반 서브쿼리
--   1-b. 다중행 일반 서브쿼리
-- 2. 상관 서브쿼리
--   2-a. 스칼라 서브쿼리

-- 서브쿼리의 규칙
-- 서브쿼리는 반드시 소괄호()로 묶어야한다. (select...) gudxo
-- 서브쿼리는 연산자의 오른쪽에 위치해야한다.
-- 서브쿼리 내에서 order by 문법은 지원되지 안흔다.

-- 단일행 서브쿼리
-- 민트미역국이랑 같은 카테고리의 메뉴 조회
-- (메인코드, 메뉴명, 가격, 주문가능여부)

/*쿼리 2번을 이용해서 원하는 값 구하기 */
select
    category_code
from
    tbl_menu
where
    menu_name = '민트미역국';  --  4

select
    menu_code 메뉴코드,
    menu_name 메뉴명,
    menu_price 메뉴가격,
    orderable_status 주문가능여부
from
    tbl_menu
where
    category_code = 4;

    /*서브쿼리를 이용해서 값으 구함*/
 select
     menu_code 메뉴코드,
     menu_name 메뉴명,
     menu_price 메뉴가격,
     orderable_status 주문가능여부
 from
     tbl_menu
 where
     category_code = (-- 괄호 안에 쿼리문을 넣어서 서브쿼리로 사용 가능하다.
         select category_code
         from tbl_menu
         where menu_name = '민트미역국');

-- 다중행 서브쿼리
-- 카테고리 코드가 식사인 모든 category_code를 조회
select
    category_code
from
    tbl_menu;


select
    *
from
    tbl_menu
where
    category_code in (
        select
            category_code
        from
            tbl_category
        where
            ref_category_code = 1
        );

-- all 연산자
-- 서브쿼리의 결과 모두에 대한 연산결과가 참이면 참을 반환한다.
-- x > All(..) : 모든 값보다 크면 참, 최대값보다도 크면 참
-- x >= All(..) : 모든 값보다 크거나 같으면 참, 최대값보다도 크거나 같으면 참
-- x < All(..) : 모든 값보다 작으면 참, 최소값보다도 작으면 참
-- x <= All(..) : 모든 값보다 작거나 같으면 참, 최소값보다도 작거나 같으면 참
-- x = All(..) : 모든 값과 같으면 참
-- x != All(..) : 모든 값과 다르면 참 (NOt In과 동일하다.)

-- 가장 비싼 메뉴 조회
select
    max(menu_price)
from
    tbl_menu;

select
    *
from
    tbl_menu
where
    menu_price /* 22000*/ >= all(
        select -- tbl_menu에 있는 가격들
            menu_price
        from
            tbl_menu
    );

-- 한식보다 비싼 양식  or 중식을 찾아붜
select
    *
from
    tbl_menu
where
    category_code in(5,6) -- 일식/중식만 조회
    and
    menu_price > all( -- 한식의 메뉴 가격들
        select
            menu_price
        from
            tbl_menu
        where category_code =4 -- 한식 코드
    );

-- 상관 서브쿼리
-- 메인 쿼리가 서브쿼리의 결과에 영향을 주는 경우를 의미한다.
-- 메인쿼리의 값을 서브쿼리에게 주고 서브쿼리를 수행한 다음
-- 그 결과를 다시 메인쿼리로 반환하는 형식으로 수앻되는 서브쿼리

-- 서브쿼리의 where절 수행을 위해, 메인쿼리가 먼저 수행되는 구조
-- 메인쿼리 테이블의 행에 따라 서브쿼리의 결과값도 바뀐다.

-- 카테고리별 평균 가격이 비싼 메뉴 조회
select
    category_code,
    max(menu_price)
from
    tbl_menu
group by
    category_code;

select
    *
from
    tbl_menu a -- 이 테이블을
where
    menu_price =(
        select
            max(menu_price)
        from
            tbl_menu
        where category_code = a.category_code -- 여기서 가져다 쓴다.
        )
