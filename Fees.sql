DECLARE

price number(10):=0;

cursor c1 IS
select Students.F_NAME||' '||Students.L_NAME as full_name , Students.S_ID,courses.C_NAME,courses.PRICE
from Students inner join STUDENT_COURSE on students.s_id=STUDENT_COURSE.S_ID inner join 
courses on courses.C_ID=STUDENT_COURSE.C_ID;

cursor c2 IS
select distinct  students.S_ID,Students.F_NAME||' '||Students.L_NAME as full_name
from students inner join STUDENT_COURSE on students.S_ID=STUDENT_COURSE.S_ID;
BEGIN


for student in c2 LOOP
    price:=0;
    for data in c1 loop 
        if student.S_ID=data.s_id then
            price := price + data.PRICE;
        end if;
    end loop;
    DBMS_OUTPUT.PUT_LINE('fees for student: ' || student.full_Name || '= ' || price);

end loop;


END;