
DECLARE
gpa2 number(3,2);

cursor c1 is 
select STUDENTS.S_ID,COURSES.C_NAME, STUDENTS.F_NAME ||' '|| STUDENTS.L_name as fullName,COURSES.C_ID,STUDENT_COURSE.GRADE as grade
,COURSES.MAX_GRADE from STUDENTS inner join STUDENT_COURSE on STUDENTS.S_ID=STUDENT_COURSE.S_ID 
inner join COURSES on COURSES.C_ID=STUDENT_COURSE.C_ID;

begin 
for student in c1 LOOP
    if student.grade<(student.MAX_GRADE/2) then 
    DBMS_OUTPUT.PUT_LINE('Student: ' || student.fullName || ' got =' || student.grade || ' in course: '||student.C_NAME );
    end if;
end loop;


END;

--select * from STUDENTS;