# Homework 2: Data Cleaning

CS625-HW2
Nicholas Darrow
Due Date: February 9, 2025

## Part One: Data Cleaning Steps
### Remove rows/columns:

i. Remove blank rows/row contain misleading values/columns that has no values (more than one column of the same row for example). 
-facet-customized facet-facet by blank, do this on each column then, on each facet choose true then click dropdown for "All" and remove all matching rows, do this for each facet created until there are no more facets with true values

ii.Remove the column "Gross".
- hover over the drop down on "Gross" and click remove this column

iii. Remove rows that contain misleading info. You must explain in your report the criteria you defined to remove those selected row(s)/column(s). [It should be noted movie/series may have several sequels with same name]
-will come back to this

### Refilling the values in the column(s):

Refill the blank cells for the columns "Rating", "Votes", and "Run Time" to 0 and change their data type to numeric. Similarly check values of all other columns and update the values accordingly (free to decide).

no need blank rows removed, changing datatype to numeric. if(isNumeric(value), toNumber(value), toNumber(replace(value, ",", ""))) this is the GREL expression used to chang the vote values to numeric, apply this by using drop down menu on the vote column, will not work on other columns. no need for rating to be changed is already numeric/float, same as runtime. you can check for text type data by spot checking and using text facets. no need to change the others

Your solution must be arrived via GREL or Python functions wherever it is required. Fill "N/A" for text type column(s) that has blank cells otherwise 0.

Refer https://openrefine.org/docs/manual/grelfunctions

### The column "Year" has numerous ambiguous values. Follow the steps given below to proceed further.

i. Remove the rows if the cell value is Roman numerals/string only.
-use customized facet-word facet this will show all values in the column, include all values not desired and remove matching cells

ii. Replace the value of the year that enclosed by (xxxx) single year only.

Example: (2024) --> 2024, (2021-) --> 2021, 1965 TV Special --> 1965, (ii) (2012-) --> 2012 [Apply GREL/Python commands to arrive at the solution wherever is possible]
iii. After successful execution of (i) to (iii) the "Year" column may have values in the format (xxxx-xxxx) or ( xxxx-xxxx).

Create new columns namely "startYear" and "endYear". Then fill the their cell by extracting value(s) from "Year" column. Refer the example given below.

Year --> 1966: startYear --> 1966; endYear --> 1966 Yea --> (1966-1969): startYear --> 1966; endYear --> 1969 Year --> (I/II/?) (1966): startYear  1966; endYear --> 1966

Remove the column "Year" after successful execution of steps 3.(i) - 3(iii).

- could not perform changes successfully

### Create a new column called "Verdict" and fill its values based on the criteria given below:

Rating	Verdict
0	Not known
>0 and <=4.5	Flop
>4.5 and <=6.5	Average
>6.5 and <=8.0	Hit
Above>8.0	Super Hit
----------------	--------------
used this code to add a new column based on ratings: if(value == 0, "Not known",
   if(value > 0, 
      if(value <= 4.5, "Flop",
         if(value <= 6.5, "Average",
            if(value <= 8.0, "Hit",
               if(value > 8.0, "Super Hit", null)
            )
         )
      ), null)
) #need to use nested if statememnts because GREL does not use logical operators

