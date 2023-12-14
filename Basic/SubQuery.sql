/*
* 사장을 제외한 평균 월급보다 작게 받는 사원의 이름, 월급, 부서명을 출력하시오.
* 만약 SUB QUERY 사용 할 때 ROUND 사용 시 감점 (항상 출력할 때만 사용)
*/
	SELECT ename, sal, deptno
	FROM emp
	WHERE sal < ( SELECT AVG(sal)
		      FROM emp 
		      WHERE job != 'PRESIDENT')
	ORDER BY sal ASC
	/

-- '컴퓨터정보공학부'에 소속된 학과의 인원수를 출력하시오.

	SELECT COUNT(*)
	FROM department
	WHERE dname = '컴퓨터정보공학부'
	/

-- EMP TABLE을 조회해서 직원들 중에서 자신의 직급의 평균 연봉과 같거나 많이 받는 사람들의 이름과 직급, 현재 연봉을 출력하시오.

	SELECT ename, job, sal
	FROM ( SELECT ename, job, sal,
		      AVG(sal) OVER (PARTITION BY job) AS avg_sal
	       FROM emp ) avg_salaries
	WHERE sal >= avg_sal
	/
