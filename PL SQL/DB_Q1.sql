CREATE OR REPLACE FUNCTION wage(pay NUMBER, bonus NUMBER, position VARCHAR2) RETURN NUMBER IS
    v_bonus NUMBER;
    income NUMBER;
    tax NUMBER;
    monthly_salary NUMBER;
BEGIN

    v_bonus := NVL(bonus, 0);

    IF position = '정교수' THEN
        income := pay + v_bonus - (pay + v_bonus) * 0.2;
    ELSIF position = '조교수' THEN
        income := pay + v_bonus - (pay + v_bonus) * 0.1;
    ELSE
        income := pay + v_bonus;
    END IF;

    IF income <= 300 THEN
        tax := income * 0.1;
    ELSIF income <= 500 THEN
        tax := 300 * 0.1 + (income - 300) * 0.2;
    ELSE
        tax := 300 * 0.1 + 200 * 0.2 + (income - 500) * 0.3;
    END IF;

    monthly_salary := ROUND(income - tax, 0.1);

    RETURN monthly_salary * 10000;
END wage;
/

-- 실행 쿼리
SELECT profno, name, position, wage(pay, bonus, position) AS 월급
FROM professor
ORDER BY 월급 DESC;
