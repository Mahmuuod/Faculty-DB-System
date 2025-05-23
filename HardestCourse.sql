DECLARE 
    counter NUMBER(2):=0;
    maxx number(2):=-1;
    C_NAME VARCHAR2(255);
    I_NAME VARCHAR2(255);

    cursor c IS
        select S_ID, COURSES.C_NAME, COURSES.C_ID, STUDENT_COURSE.GRADE, 
               INSTRUCTOR.S_FRAME || ' ' || INSTRUCTOR.S_LNAME as full_Name
        from STUDENT_COURSE 
        inner join COURSES on STUDENT_COURSE.C_ID=COURSES.C_ID 
        inner join INSTRUCTOR on courses.I_ID=INSTRUCTOR.I_ID;
        
    cursor c2 IS 
        select S_ID, COURSES.C_NAME, COURSES.C_ID, STUDENT_COURSE.GRADE, 
               INSTRUCTOR.S_FRAME || ' ' || INSTRUCTOR.S_LNAME as full_Name
        from STUDENT_COURSE 
        inner join COURSES on STUDENT_COURSE.C_ID=COURSES.C_ID 
        inner join INSTRUCTOR on courses.I_ID=INSTRUCTOR.I_ID;

BEGIN
    for course in c LOOP
        counter := 0;
        for data in c2 LOOP
            if course.c_id = data.c_id then
                IF data.grade < 50 then
                    counter := counter + 1;
                END IF;
            END IF;
        END LOOP;

        IF counter > maxx THEN
            maxx := counter;
            C_NAME := course.C_NAME;
            I_NAME := course.full_Name;
        END IF;

    END LOOP;
    DBMS_OUTPUT.PUT_LINE('****************************************************************');

    DBMS_OUTPUT.PUT_LINE('hardest course is: ' || C_NAME || ' and its instructor is ' || I_NAME);

END;