-- Grouping
-- group by 절을 이용해서 결과 집합을 특정 열의 값에 따라 그룹화 하는데 사용
-- HAVING은 Group by 절과 함께 사용해야하며, 그룹에 대한 조건을 적용하는데 사용된다.

-- MENU TABLE에서 카테고리 그룹 조회
select
    category_code
from
    tbl_menu
group by
    category_code;

-- 카테고리 그룹에서 Count를 사용해서 갯수를 조회
-- 카테고리별 갯수 조회하기
select
    category_code,
    count(*) -- 매개변수와 위치에 따라 여러 사용방법이 있음
             -- 전체 행 중 일치하는 행이 몇개인지 갯수를 반환하는 역할
from
    tbl_menu
group by
    category_code;

-- Sum으로 그룹화된 값의 총합을 구할 수 있다.
-- 카테고리별 가격 총합 계산하기
select
    category_code,
    sum(menu_price)
from
    tbl_menu
group by category_code;

-- AVH으로 그룹화된 값의 평균을 구할 수 있다.
-- 카테고리별 가격 평균 계산하기
select
    category_code,
    count(*) 총갯수,
    sum(menu_price) 총합,
    avg(menu_price) 평균
from
    tbl_menu
group by
    category_code;
