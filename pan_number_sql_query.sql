create table pannumber_data
(
pan_number text 
);

select * from pannumber_data;

SELECT COUNT(*) FROM pannumber_data;

--DATA CLEANING AND PREPROCESSING
--IDENTIFY AND HANDLE MISSING DATA:

SELECT count(*) FROM pannumber_data WHERE pan_number is null;

--CHECK FOR DUPLICATES

select count(distinct pan_number) from pannumber_data;

--handle leading trailing spaces
SELECT * FROM pannumber_data WHERE pan_number !=trim(pan_number);

--CORRECT LETTER CASE
SELECT count(*) FROM pannumber_data WHERE pan_number != upper(pan_number);

--cleaned pan number
SELECT DISTINCT upper(TRIM(pan_number)) as pan_number
FROM pannumber_data
WHERE pan_number IS NOT NULL
AND trim(pan_number) != ' ';

--VALIDATION 
--FUNCTION TO CHECK ADJACENT CHARACTER ARE THE SAME
CREATE OR REPLACE FUNCTION check_adjacent(p_str text)
returns BOOLEAN
language plpgsql
as $$
begin
	for i in 1..(length(p_str)-1)
	loop
		if substring(p_str,i,1)= substring(p_str,i+1 ,1)
		then 
			RETURN TRUE; --the characters are adjacent 
		END IF;
	 end loop;
	 return FALSE;   ---NON OF THE CHARACTER ADJACENT TO EACH OTHER WERE THE SAME
end;
$$

SELECT check_adjacent('BFDQW')

--FUNCTION TO CHECK IF SEQUENTIAL CHARACTERS ARE USED

CREATE OR REPLACE FUNCTION check_sequential(p_str text)
returns BOOLEAN
language plpgsql
as $$
begin
	for i in 1..(length(p_str)-1)
	loop
		If ascii(substring(p_str,i+1 ,1))-ascii(substring(p_str,i ,1))!=1
	 	then
			 return false ;-- THE STRING DOES NOT FORM A SEQUENCE
		end if;
	 end loop;
	 return TRUE;   ---THE STRING IS FORMING A SEQUENCE
end;
$$

select check_sequential('ABCXE')

SELECT * FROM pannumber_data
WHERE pan_number ~'^[A-Z]{5}[0-9]{4}[A-Z]$';

with cte_cleaned_pan as 
  	 (SELECT DISTINCT upper(TRIM(pan_number)) as pan_number
		FROM pannumber_data
		WHERE pan_number IS NOT NULL
		AND trim(pan_number) != ' '),
	cte_valid_pan as
		(select * from cte_cleaned_pan
		where check_adjacent(pan_number)=false
		and check_sequential(substring(pan_number,1,5))=false
		and check_sequential(substring(pan_number,6,4))=false
		and pan_number ~'^[A-Z]{5}[0-9]{4}[A-Z]$')
select cln.pan_number,
case when vld.pan_number is not null 
		then 'Valid pan' 
	else 'Invalid Pan' 
end as status
from cte_cleaned_pan  cln 
left join cte_valid_pan  vld on vld.pan_number=cln.pan_number;

--WUFAR0132H valid
--WOUCP7730E invalid