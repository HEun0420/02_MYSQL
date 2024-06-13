-- BUILD IN FUNCTIONS

-- 문자열 관련 함수
-- ASCII(아스키코드), CHAR(숫자)
-- ASCII : 아스키 코드 값 추출
-- CHAR : 아스키코드로 문자 추출

select ASCII('A'), char(65);

-- BIT_LENGTH(문자열), CHAR_LENGTH(문자열), LENGTH(문자열)
-- BIT_LENGTH : 할당된 비트 크기 반환
-- CHAR_LENGTH : 문자열의 길이 반환
-- LENGTH : 할당된 바이트의 크기 반환
select bit_length('pie'), char_length('pie'), length('pie');
select
    menu_name,
    bit_length(menu_name),
    char_length(menu_name),
    length(menu_name)
from
    tbl_menu;

-- concat(문자열1, 문자열2,...) : 문자열을 이어붙임
-- concat_ws(구분자, 문자열1, 문자열 2, ...) : 문자열을 구분자랑 같이 이어붙임
select concat('호랑이', '기린', '토끼');
select concat_ws(',','호랑이', '기린', '토끼');
select concat_ws('-','호랑이', '기린', '토끼');

-- ELT(위치, 문자열1, 문자열2, ...) : 해당 위치의 문자열을 반환
-- FIELD(찾을 문자열, 문자열1, 문자열2, ...) : 찾을 문자열을 반환
-- FIND_IN_SET(찾을 문자열, 문자열 리스트) : 찾을 문자열의 위치를 반환
-- INSTR(기준 문자열, 부분 문자열) : 기준 문자열에서 부분 문자열의 시작 위치 반환
-- LOCATE(부분문자열, 기준 문자열) : INSTR 랑 순서만 반대

select
    elt(2, '사과','딸기', '바나나') as ELT,
    field('딸기', '사과', '딸기', '바나나') as FIELD,
    find_in_set('바나나', '사과,딸기,바나나') as FIND_IN_SET,
    INSTR('사과딸기바나나', '딸기') as INSTR,
    LOCATE('딸기', '사과딸기바나나') as LOCATE;


-- INSERT(기준문자열, 위치, 길이, 삽입할 문자열)
-- INSERT : 기준 문자열의 위치부터 길이만큼 지우고 문자열을 끼워넣는다.
select insert('내 이름은 아무개입니다.', 7, 3, '홍길동');

-- LEFT(문자열, 길이) : 왼쪽에서 문자열의 길이만큼 반환
-- RIGHT(문자열, 길이) : 오른쪽에서 문자열의 길이만큼 반환
select
    left('hello world!', 3),
    right('Hello world', 3);

-- UPPER() : 소문자를 대문자로 바꿈
-- LOWER() : 대문자를 소문자로 바꿈
select lower('Hello World!'), upper('Hello World!');


-- Lpad(문자열, 길이, 채울 문자열) : 문자열을 길이만큼 왼쪽으로 늘린 후에, 빈 곳을 채울 문자열로 채운다.
-- Rpad(문자열, 길이, 채울 문자열) : 문자열을 길이만큼 오른쪽으로 늘린 후에, 빈 곳을 채울 문자열로 채운다.
select lpad('왼쪽', 6,'@') , rpad('오른쪽',6,'@');  -- @@@@왼쪽, 오른쪽@@@

-- Ltrim: 왼쪽 공백지우기.
-- Rtrim: 오른쪽 공백지우기.
-- trim: 양쪽 공백지우기.
-- trim(both(양쪽), leading(왼쪽), trainling(오른쪽) 있으면 해당 방향에 지정한 문자열을 제거.
select ltrim('    왼쪽'),
       rtrim('오른쪽  '),
       trim('    양쪽    '),
       trim(both '@' from '@@@@mysql@@@@'); -- mysql

-- repeat(문자열, 횟수) : 문자열을 횟수만큼 반복
select repeat('재밌다',3);

-- replace(문자열, 찾을 문자열, 바꿀 문자열) : 문자열을 문자열을 찾아 바꿈
select replace('마이sql','마이','my');

-- reverse(문자열) : 문자열의 순서가 뒤집힘
select reverse('stressed'); -- 스트레스를 뒤집으면?

-- space(길이) : 길이만큼의 공백을 반환해준다.
select space('제 이름은', space(5), '이고, 나이는' , space(3),'세 입니다.');

-- substring(문자열, 시작위치, 길이) : 시작 위치로부터 길이의 문자를 반환 (길이를 생략하면 시작부터 끝까지 반환)
select substring('안녕하세요 반갑습니다.',7,2),
       substring('안녕하세요 반갑습니다.',7,8);


-- substring_index(문자열, 구분자, 횟수): 구분자가 왼쪽부터 횟수 번째 나오면 그 이후의 오른쪽은 버린다.
-- 횟수가 음수일 경우, 오른쪽부터 세고 왼쪽을 버린다.
select substring_index('hong.test@gmail.com', '.', 2), SUBSTRING_INDEX('hong.test@gmail.com', '.', -2);
 -- hong.test@gmail / test@gmail.com

-- bin( 숫자): 2진수
-- oct(숫자): 8진수
-- hex(숫자) 16진수
select bin(65), oct(65), hex(65);

-- 수학관련 함수
-- ABS(숫자) 절대값 변환
select abs(-123);

-- Ceiling(숫자),Floor(숫자), round(숫자)
-- ceiling : 올림값 반환
-- floor: 내림값 반환
-- round : 반올림값 반환
select ceiling(1234.56), floor(1234.56), round(1234.56);

-- Mod(숫자1, 숫자2), (숫자1 % 숫자2), 숫자1 mod 숫자2
-- 숫자1을 숫자2로 나눈 나머지 추출
select mod(75,10), 75% 10, 75 mod 10;

-- pow(숫자1, 숫자2) : 거듭제곱값 반환
-- sqrt(숫자1) : 제곱근 추출
select
    pow(2,4),
    sqrt(16);

-- rand() : 0 이상 1 미만의 실수를 반환
-- 'm' <= 임의의 정수 < n' 구하고 싶을 때
-- floor((rand() * (n-m) +m)을 사용한다.
-- 1부터 10까지 난수
select
    rand(),
    floor(rand() * (111-1), +1);

-- sign(숫자)
-- 양수면 1, 0이면 0, 음수면 -1을 반환
select sign(10.1), sign(0), sign(-10,1);

-- truncate(숫자, 정수)
-- 소수점을 기준으로 정수 위치까지 구하고 나머지는 버림
select truncate(12345.2) , truncate(12345.23456, -2);

-- 날짜 및 시간 관련 함수
-- ADDDATE(날짜, 차이) : 날짜를 기준으로 차이를 더함
-- SUBDATE(날짜, 차이) : 날짜를 기준으로 차이를 뺌
select adddate('2024-06-13', interval 30 day), adddate('2024-06-13', interval 6 month);
select subdate('2024-06-13', interval 30 day), subdate('2024-06-13', interval 6 month);


-- ADDTIME(날짜/시간, 시간) : 날짜/시간을 기준으로 시간을 더함
-- SUBTIME(날짜/시간, 시간) : 날짜/시간을 기준으로 시간을 뺌
select addtime('2024-06-13 12:00:00', '1:0:1'), subtime('2024-06-13 12:00:00', '1:0:1');
-- 현재 연-월-일 시간-분-초 반환해주는 함수들
-- curdate(): 2024-06-13
-- curtime():12:03:26
-- now(): 20224-06-13 12:03:26
-- sysdate():2024-06-13, 12:03:26
select curdate(), curtime(), now(), sysdate();

-- year()
-- month()
-- days()
-- hour()
-- minute()
-- second()
-- microsecond()
-- 날짜 또는 시간에서 연,월,일,시,초,밀리초를 추출
select year(curdate());
select hour(hour(curtime()));

-- date() : 연,월,일
-- time() : 시,분,초
select date(now()), time(now());

-- last_day(날짜): 해당 날짜의 달에서 마지막 날짜를 구한다.
select last_day('20240201');

-- maketime(시,분,초): '시:분:초' time 형식을 만든다.
-- makedate(연도, 정수) : 해당 연도의 정수만큼 지난 날짜를 구한다.
select maketime(17, 03, 02);
select makedate(2024, 200);

-- quarter(날짜)
-- 해당 날짜의 분기를 구한다.
select quarter(now());

-- time_to_sec(시간)
-- 시간을 초단위로 구해준다.
select time_to_sec('1:1:1');




