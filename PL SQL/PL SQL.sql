SET SERVEROUTPUT ON;
SHOW ERRORS;

-- p528 예제

	DECLARE
		v_empno	emp.empno%TYPE;
		v_ename	emp.ename%TYPE;
	BEGIN
		SELECT empno, ename INTO v_empno, v_ename
		FROM emp
		WHERE empno = &empno;
			DBMS_OUTPUT.PUT_LINE(v_empno||' - This Member''s name is '|| v_ename);
	EXCEPTION
		WHEN NO_DATA_FOUND THEN
			DBMS_OUTPUT.PUT_LINE('NO Member!');
		WHEN TOO_MANY_ROWS THEN
			DBMS_OUTPUT.PUT_LINE('More Than 2 Member !');
	END ;
	/

-- Professor Table 중 profno, name, position 사용 해볼 것

	DECLARE
		v_profno 	professor.profno%TYPE;
		v_name		professor.name%TYPE;
		v_position	professor.position%TYPE;
	BEGIN
		SELECT profno, name, position INTO v_profno, v_name, v_position
		FROM professor
		WHERE profno = &profno;
			DBMS_OUTPUT.PUT_LINE(v_profno||' - This professor''s name is '|| v_name ||'. and hpage is '|| v_position);
	EXCEPTION
		WHEN NO_DATA_FOUND THEN
			DBMS_OUTPUT.PUT_LINE('NO Member!');
		WHEN TOO_MANY_ROWS THEN
			DBMS_OUTPUT.PUT_LINE('More Than 2 Member !');
	END;
	/

-- emp, dept Table / empno, ename, dname / join 사용 X
-- * 처음 emp만 SELECT 한다. emp 

	DECLARE
		v_empno		emp.empno%TYPE;
		v_name		emp.ename%TYPE;
		v_dname		dept.dname%TYPE;
	BEGIN
		SELECT empno, ename INTO v_empno, v_name
		FROM emp
		WHERE empno = &empno;
			DBMS_OUTPUT.PUT_LINE(v_empno||' - This Member''s name is '||v_ename);
		SELECT dname INTO v_dname
		FROM dept
		WHERE 
	EXCEPTION
		WHEN NO_DATA_FOUND THEN
			DBMS_OUTPUT.PUT_LINE('NO Member!');
		WHEN TOO_MANY_ROWS THEN
			DBMS_OUTPUT.PUT_LINE('More Than 2 Member !');
	END ;
	/
