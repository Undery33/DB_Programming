SELECT CEIL(-12.345), FLOOR(-12.345)
FROM dual
/

SELECT ROUND(100000000 * 0.05 * (SYSDATE - TO_DATE('2023-01-01')) / 365, -1) "금액"
FROM dual
/

SELECT TRUNC(SYSDATE - TO_DATE('2023-01-01')) "DATE"
FROM dual
/

SELECT ROUND(100000000 * 0.05 * TRUNC(SYSDATE - TO_DATE('2023-01-01'))/365, -1) "MONEY"
FROM dual
/

SELECT MONTHS_BETWEEN(SYSDATE, '2000-11-22')
FROM dual
/

-- p106 1번
SELECT studno, name, birthday
FROM student
WHERE TO_CHAR(birthday, 'MM') = 01
/

-- p106 2번
SELECT empno, ename, hiredate
FROM emp
WHERE TO_CHAR(hiredate, 'MM') BETWEEN 01 AND 03
/

SELECT empno, ename, hiredate
FROM emp
WHERE TO_CHAR(hiredate, 'MM') IN (1, 2, 3)
/

SELECT TO_CHAR(1234.56, '9999.9') "RESULT"
FROM dual
/

SELECT TO_CHAR(1234.56, 'L9,999.9') "RESULT"
FROM dual
/

-- 작년 시험 문제(p.107)

-- 1번
SELECT empno, ename, sal, comm, 
	TO_CHAR(salary, '999,999') salary, 
	TO_CHAR(salary * 0.1, '99,999') tax
FROM (	SELECT emp.*, (sal * 12) + NVL(comm, 0) salary
	FROM emp )
/

-- 2번
SELECT name, pay, bonus,
	TO_CHAR((pay * 12) + NVL(bonus, 0),'999,999') TOTAL
FROM professor
/

-- NVL2
SELECT empno, ename, sal, comm,
	sal+NVL(comm, 0) salary,
	NVL2(comm, sal+comm, sal) salary2
FROM emp
/

SELECT empno, ename, sal, comm,
	NVL2(comm, 'Exist', 'NULL') nvl2
FROM emp
/

SELECT empno, ename, sal, comm,
	NVL2(comm, TO_CHAR(comm, '9,999'), '없음') nvl2
FROM emp
/