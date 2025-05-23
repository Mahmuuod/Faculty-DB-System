SET SERVEROUTPUT ON
DECLARE
gpa2 number(3,2);

cursor c2 IS
select STUDENTS.S_ID,STUDENTS.F_NAME,STUDENTS.L_NAME,sum(STUDENT_COURSE.GRADE)as grade 
from STUDENTS inner join STUDENT_COURSE on STUDENTS.S_ID=STUDENT_COURSE.S_ID 
inner join COURSES on COURSES.C_ID=STUDENT_COURSE.C_ID group by STUDENTS.S_ID,F_Name,STUDENTS.L_NAME order by STUDENTS.S_ID;
BEGIN
for student in c2 LOOP
gpa2:= (student.grade*4)/500;
    if gpa2<=2 then
    DBMS_OUTPUT.PUT_LINE('Student: ' || STUDENT.F_NAME || ' ' || STUDENT.L_NAME || ' has GPA =' || gpa2);
    end if;
end loop;


END;
