CREATE OR REPLACE FUNCTION max_sal
	(v_deptno  emp.deptno%TYPE)
RETURN NUMBER
IS
	max_sal  emp.sal%TYPE;
BEGIN
	SELECT  max(sal) INTO max_sal
	FROM	emp
	WHERE	deptno = v_deptno;
	RETURN	max_sal;
END;
/

--

CREATE OR REPLACE FUNCTION min_sal
	(v_deptno  emp.deptno%TYPE)
RETURN NUMBER
IS
	min_sal  emp.sal%TYPE;
BEGIN
	SELECT  min(sal) INTO min_sal
	FROM	emp
	WHERE	deptno = v_deptno;
	RETURN	min_sal;
END;
/

--

CREATE OR REPLACE FUNCTION avg_sal
	(v_deptno  emp.deptno%TYPE)
RETURN NUMBER
IS
	avg_sal  emp.sal%TYPE;
BEGIN
	SELECT  avg(sal) INTO avg_sal
	FROM	emp
	WHERE	deptno = v_deptno;
	RETURN	avg_sal;
END;
/

--

SELECT dname, max_sal(deptno) max_sal
FROM dept
ORDER BY 2
/

SELECT  deptno, dname, max_sal(deptno) max_sal, min_sal(deptno) min_sal, avg_sal(deptno) avg_sal
FROM	dept
ORDER BY deptno
/

--

CREATE OR REPLACE FUNCTION max_hiredate
	(v_deptno  NUMBER)
RETURN DATE
IS
	v_hiredate  emp.hiredate%TYPE;
BEGIN
	SELECT  max(hiredate) INTO v_hiredate
	FROM	emp
	WHERE	deptno = v_deptno;
	RETURN	v_hiredate;
END;
/

--

SELECT  dname, ename, max_hiredate(deptno)
FROM	emp NATURAL JOIN dept
WHERE (deptno, hiredate) IN ( SELECT deptno, max_hiredate(deptno) max 
			      FROM dept)
ORDER BY deptno
/
