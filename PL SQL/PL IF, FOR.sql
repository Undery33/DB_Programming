-- 575 페이지 IF~THEN~ELSE~END IF

	DECLARE
		vprofno		professor.profno%TYPE;
		vname		professor.name%TYPE;
		vbonus		professor.bonus%TYPE := NULL;
	BEGIN
		SELECT profno, name, bonus INTO vprofno, vname, vbonus
		FROM   professor
		WHERE  profno =& profno AND bonus IS NOT NULL;
		
		IF vbonus > 0 THEN
			DBMS_OUTPUT.PUT_LINE(vname ||' ''s bonus is $' || vbonus);
		END IF;
	EXCEPTION
		WHEN NO_DATA_FOUND THEN
			DBMS_OUTPUT.PUT_LINE('NO Member!');
		WHEN TOO_MANY_ROWS THEN
			DBMS_OUTPUT.PUT_LINE('More Than 2 Member !');

	END;
	/

-- 581 페이지 예제 2번 (CASE)

	DECLARE
		vempno		emp.empno%TYPE;
		vename		emp.ename%TYPE;
		vsal		emp.sal%TYPE;
		vdeptno		emp.deptno%TYPE;
		vupsal		emp.sal%TYPE;
	BEGIN
		SELECT empno, ename, sal, deptno INTO vempno, vename, vsal, vdeptno
		FROM emp
		WHERE empno = &empno;
		vupsal := CASE
				WHEN vdeptno = 10 THEN vsal * 1.3
				WHEN vdeptno IN (20, 30) THEN vsal * 1.5
				WHEN vdeptno > 30 THEN vsal * 1.2
				ELSE vsal
			END;
		DBMS_OUTPUT.PUT_LINE(vempno ||'/'|| vename ||'/'|| vsal ||'/'|| vdeptno ||'/'|| vupsal);
	END;
	/

-- 581 페이지 예제 2번 (IF~ELSE)

	DECLARE
		vempno		emp.empno%TYPE;
		vename		emp.ename%TYPE;
		vsal		emp.sal%TYPE;
		vdeptno		emp.deptno%TYPE;
		vupsal		emp.sal%TYPE;
	BEGIN
		SELECT empno, ename, sal, deptno INTO vempno, vename, vsal, vdeptno
		FROM emp
		WHERE empno = &empno;
		
		IF vdeptno = 10 
			THEN vupsal := vsal * 1.3;
		ELSIF vdeptno IN (20, 30) 
			THEN vupsal := vsal * 1.5;
		ELSIF vdeptno > 30 
			THEN vupsal := vsal * 1.2;
		ELSE 
			vupsal := vsal;
		END IF;

		DBMS_OUTPUT.PUT_LINE(vempno ||'/'|| vename ||'/'|| vsal ||'/'|| vdeptno ||'/'|| vupsal);
	END;
	/