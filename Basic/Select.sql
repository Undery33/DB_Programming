/* Student 테이블에서 모든 학생의 이름 ID, 체중을 아래 화면과 같이 출력하세요. 컬럼 이름은 "ID AND WEIGHT"로 나오게 하세요.

Student 테이블에서 모든 학생의 학번과 이름, 체중, 키를 아래 화면과 같이 출력하세요. 컬럼 이름도 "학번", "체중과 키"로 나오게 하세요.

 9411, James Seo's weight is 72kg, height is 180cm

Student 테이블에서 2학년과 3학년 학생의 학번과 이름, 체중, 키를 아래 화면과 같이 출력하세요. 컬럼 이름도 "학번", "체중과 키"로 나오게 하세요.

====================================================================================== */

-- 연습문제 01

SELECT name||'''s ID: '||id||' , WEIGHT is '|| weight ||'kg' "ID AND WEIGHT" 
FROM student;

-- 연습문제 02

SELECT studno||', '||name||''',s weight is '|| weight ||'kg, height is '|| height ||'cm' "STUDENT NUMBER, WEIGHT AND  HEIGHT"
FROM student;

-- 연습문제 03

SELECT studno||', '||name||''',s weight is '|| weight ||'kg, height is '|| height ||'cm' "STUDENT NUMBER, WEIGHT AND  HEIGHT"
FROM student
WHERE grade = 2 or grade = 3;
