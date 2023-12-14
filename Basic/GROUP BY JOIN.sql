-- 부서 별 평균 월급(p.160)

	SELECT deptno, ROUND(AVG(sal + NVL(comm, 0)),1) AVG_SAL
	FROM emp
	GROUP BY deptno
	ORDER BY AVG_SAL
	/


-- 카티션 곱 예시
	
	SELECT empno, ename, emp.deptno, dept.deptno, dname
	FROM emp, dept
	WHERE emp.deptno = dept.deptno
	/

-- 조인 예시 
-- * ON 사용 예시

	SELECT empno, ename, e.deptno, dname
	FROM emp e JOIN dept d ON e.deptno = d.deptno
	/

-- * USING () 사용 예시

	SELECT empno, ename, deptno, dname
	FROM emp JOIN dept USING (deptno)
	/

-- 부서 별 평균 인건비

	SELECT dname, ROUND(AVG(sal + NVL(comm, 0)), 1) AVG_SAL
	FROM emp JOIN dept USING(deptno)
	GROUP BY dname
	ORDER BY 2 DESC
	/

-- HAVING 절 사용 예시 (그룹 함수 WHERE 문)

	SELECT deptno, AVG(NVL(sal, 0))
	FROM emp
	WHERE deptno > 10
	GROUP BY deptno
	HAVING AVG(NVL(sal, 0)) >= 2000
	/

-- NATURAL JOIN

	SELECT dname
	FROM emp NATURAL JOIN dept
	WHERE ename = 'ALLEN'
	/

/*
============================== 문제 ======================================
급여는 sal + comm
사장(president)을 제외한 사원의 평균 급여가 2000 이상인 부서의 부서명과 평균 급여를 구하시오.
평균 급여는 소수점 1자리까지 표시합니다. (반올림)

* HAVING 절 사용 뒤 WHERE 사용하는 것을 추천
*/

	SELECT dname, ROUND(AVG(sal + NVL(comm, 0)), 1) AVG_SAL
	FROM emp JOIN dept USING (deptno)
	WHERE job != 'PRESIDENT'
	GROUP BY dname
	HAVING ROUND(AVG(sal + NVL(comm, 0)), 1) >= 2000
	/


	SELECT dname, AVG_SAL
	FROM ( SELECT dname, ROUND(AVG(sal + NVL(comm, 0)), 1) AVG_SAL
		FROM emp JOIN dept USING (deptno)
		WHERE job != 'PRESIDENT'
		GROUP BY dname
	     )
	WHERE AVG_SAL >= 2000
	/