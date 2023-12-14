/* CASE WHEN SUBSTR(tel, 1, INSTR(tel, ')') -1 = '02' THEN 'SEOUL'

CASE 작성 방법
1. CASE 조건문 WHEN 비교값 THEN 결과값
2. CASE WHEN 조건문 = 비교값 THEN 결과값

END "LOC" <<< 칼럼 이름

CASE 조건문 << 쓰면 코드중복이 생기기 때문에 SubQuery 사용을 해야함
*/

-- 0. p121 예제1

	SELECT name, tel,
		CASE(SUBSTR(tel, 1, INSTR(tel, ')')-1)) WHEN '02' THEN '서울'
							WHEN '031' THEN '경기'
							WHEN '051' THEN '부산'
							WHEN '052' THEN '울산'
							WHEN '055' THEN '경남'
								   ELSE 'ETC'
		END "LOC"
	FROM student
	WHERE deptno1 = 201;

-- 1. CASE WHEN SUBSTR(tel, 1, INSTR(tel, ')')-1 = '02' THEN '서울'

	SELECT name, tel,
		CASE WHEN (SUBSTR(tel, 1, INSTR(tel, ')')-1)) = '02' THEN '서울'
		     WHEN (SUBSTR(tel, 1, INSTR(tel, ')')-1)) = '031' THEN '경기'
		     WHEN (SUBSTR(tel, 1, INSTR(tel, ')')-1)) = '051' THEN '부산'
		     WHEN (SUBSTR(tel, 1, INSTR(tel, ')')-1)) = '052' THEN '울산'
		     WHEN (SUBSTR(tel, 1, INSTR(tel, ')')-1)) = '055' THEN '경남'
								      ELSE 'ETC'
		END "LOC"
	FROM student
	WHERE deptno1 = 201;

-- 2. DECODE

	SELECT name, tel,
		DECODE(SUBSTR(tel, 1, INSTR(tel, ')')-1), '02', '서울',
							  '031', '경기',
							  '051', '부산',
							  '052', '울산',
							  '055', '경남',
							  'ETC') "LOC"
	FROM student
	WHERE deptno1 = 201;

-- 3. SubQuery 1번

	SELECT name, tel,
		CASE WHEN area1 = '02' THEN '서울'
		     WHEN area1 = '031' THEN '경기'
		     WHEN area1 = '051' THEN '부산'
		     WHEN area1 = '052' THEN '울산'
		     WHEN area1 = '055' THEN '경남'
					ELSE 'ETC'
		END "LOC"
	FROM ( SELECT name, tel, (SUBSTR(tel, 1, INSTR(tel, ')')-1)) AS area1
	       FROM student
	       WHERE deptno1 = 201 );

-- 4. p123 퀴즈

	SELECT empno, ename, sal,
		CASE WHEN sal <= 1000 THEN 'LEVEL 1'
		     WHEN sal <= 2000 THEN 'LEVEL 2'
		     WHEN sal <= 3000 THEN 'LEVEL 3'
		     WHEN sal <= 4000 THEN 'LEVEL 4'
		     		      ELSE 'LEVEL 5'
		     END "LEVEL"
	FROM emp
	ORDER BY sal DESC;