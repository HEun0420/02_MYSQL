-- JOIN
-- 여러개의 부낫ㄴ된 표를 조합해서 하나의 표로 만드는 기능
-- 관계형 데이터베이스에서 가장 중요한 파트이다.

-- 두개 이상 테이블을 관련있는 칼럼을 통행 결합하는데 사용된다.
-- 두개 이상 테이블은 반드시 연관있는 칼럼이 존재해야하며, 이를 통해
-- join된 테이블들의 컬럼을 모두 확인할 수 있다.

/*
  ALIAS
  - SQL의 컬럼 또는 테이블에 별칭을 달 수 있다.
 */

select
    -- 별칭에 띄어쓰기나 특수기호가 없다면, 홀따옴표와 as는 생략이 가능하다.
    a.menu_code as 'code',
    a.menu_name as name,
    a.menu_price price
from
    tbl_menu a
order by
    price;

/*
 Inner Join
 - 두 테이블의 교집합을 반환하는 SQL JOIN 유형
 - INNER JOIN에서 INNER 키워드는 생략 가능하다.
 - 컬럼명이 같거나, 다를 경우 ON으로 서로 연관있는 컬럼에 대한
 - 조건을 작성하여 join 한다.
 */

 select
     tbl_menu.menu_name,
     tbl_category.category_name
 from
     tbl_menu
 inner join tbl_category
     on tbl_menu.category_code = tbl_category.category_code
 order by
     tbl_category.category_name;

-- a, b 사용
select
    a.menu_name,
    b.category_name
from
    tbl_menu a
inner join tbl_category b
        on a.category_code= b.category_code
order by
    b.category_name;

-- inner join은 교집합을 반환하기 때문에
-- join 순서를 바꾸어도 영향이 없다.
select
    a.menu_name,
    b.category_name,
    a.category_code ACode,
    b.category_code BCode
from
    tbl_category b
inner join tbl_menu a
          on a.category_code= b.category_code
order by
    b.category_name;

-- using
-- 컬럼몇이 같을 경우 using으로 서로 연관있는 칼럼에 대한
-- 조건을 작성하여 join할 수 있다.
select
    a.menu_name,
    b.category_name
from
    tbl_menu a
inner join tbl_category b using(category_code)
order by
  b.category_name;

/*
 Left join
 - 첫번째(왼쪽) 테이블을 모두 조회하고, 왼쪽과 일치하는 오른쪽 테이블을
 - join 해준다.
 */
 select
     a.menu_name,
     b.category_name
 from
     tbl_menu a
 left join tbl_category b
 on a.category_code = b.category_code;

/*
 Right join
 - 두번째(오른쪽) 테이블을 모두 조회하고, 오른쪽과 일치하는 왼쪽 테이블을
 - join 해준다.
 */
 select
     a.menu_name,
     b.category_name
 from
     tbl_menu a
 right join tbl_category b
 on a.category_code = b.category_code;

/*
 cross join
 - 두테이블의 모든 가능한 조합을 반환하는 join( 모든 경우 수를 다 구함)
 - 카르테시안 곱이라고도 함. 모든 조합의 경우의 수를 보여줌
 */
select
    a.menu_name,
    b.category_name
from
    tbl_menu a
cross join tbl_category b;

/*
self join
 --같은 테이블 내에서 행과 행 사이의 관계를 찾기 위해 사용되는 join
 */
select
    a.category_name 카테고리,
    b.category_name 대분류
from
    tbl_category a
join tbl_category b
on a.ref_category_code = b.category_code;