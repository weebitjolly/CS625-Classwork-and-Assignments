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


## Part 2. Analyze Cleaned Data
Use the cleaned data to answer the following questions in your report (and explain how you arrived at the answers):

How many movies were listed as “Super Hit” in the year 2021?
109, this includes shows and movies that started, ran their course or ended in 2021

Which movie got highest rating in the years 2018 to 2020 by genre [one movie for each genre]?
had to split multi-valued cells for this one. 
Action: Cobra Kai

Adventure: Sa-rang-eui bul-sa-chak

Animation: She-Ra and the Princesses of Power

Biography: When They See Us

Comedy: Kota Factory 

Crime: Elite

Documentary: Formula 1: Drive to Survive

Drama: The Queen's Gambit

Family: The Bureau of Magical Things

Fantasy: The King: Youngwonui Gunjoo

Gameshow: Million Pound Menu

History:The Coldest Game

Horror: Typewriter

Music: Hikaru Utada: Laughter in the Dark Tour 2018

Musical: Westside

Mystery: O Escolhido

Reality TV:Car Masters: Rust to Riches

Romance: TharnType

Sci-Fi: Tau

Short: 13 Reasons Why: Season 2 Date Announcement Commercial

Sport: Selection Day

Talk-show: My Next Guest Needs No Introduction with David Letterman

Thriller: Black Earth Rising

War: 21 Sarfarosh Saragarhi 1897

List the top 3 genres (no duplicates) that got lowest number of votes (excluding 0)
1 News             27793
 2 Talk-Show        32750
 3 Game-Show        73980

Name the director who directed the 10 minutes run time movie in the year 2020 that received highest number of votes. The output must list name of the movie, number of votes, and genre.

### Teen Titans Go!
(2013– )
Animation, Action, Adventure
5.4
Superhero roommates Robin, Cyborg, Starfire, Raven and Beast Boy love saving the day, but what happens when they're done fighting crime?
                 Stars: Scott Menville,  Greg Cipes,  Khary Payton,  Hynden Walch
18481
10
NA
2

### Goedam
(2020– )
Short, Horror, Mystery
5.8
When night falls on the city, shadows and spirits come alive in this horror anthology series centered on urban legends.
                 Stars: Song Chae-Yoon,  Ga-rim Han,  Seola
694
10
NA


List the top 5 movies that received highest number of votes, but verdict is “Flop”
## 1

### The Human Centipede (First Sequence)
(2009)
Horror
4.4
Flop
A mad scientist kidnaps and mutilates a trio of tourists in order to reassemble them into a human centipede, created by stitching their mouths to each others' rectums.
Director: Tom Six |      Stars: Dieter Laser,  Ashley C. Williams,  Ashlynn Yennie,  Akihiro Kitamura
75214
92

## 2

### Scary Movie 5
(2013)
Comedy
3.5
Flop
A couple begin to experience some unusual activity after bringing their lost nieces and nephew home. With the help of home-surveillance cameras, they learn they're being stalked by a nefarious demon.
Directors: Malcolm D. Lee,  David Zucker |      Stars: Simon Rex,  Ashley Tisdale,  Charlie Sheen,  Lindsay Lohan
67762
88

## 3

### 365 dni
(2020)
Drama, Romance
3.3
Flop
Massimo is a member of the Sicilian Mafia family and Laura is a sales director. She does not expect that on a trip to Sicily trying to save her relationship, Massimo will kidnap her and give her 365 days to fall in love with him.
Directors: Barbara Bialowas,  Tomasz Mandes |      Stars: Anna Maria Sieklucka,  Michele Morrone,  Bronislaw Wroclawski,  Otar Saralidze
63620
114

## 4

### In the Name of the King: A Dungeon Siege Tale
(2007)
Action, Adventure, Fantasy
3.8
Flop
A man named Farmer sets out to rescue his kidnapped wife and avenge the death of his son, two acts committed by the Krugs, a race of animal-warriors who are controlled by the evil Gallian.
Director: Uwe Boll |      Stars: Jason Statham,  Ron Perlman,  Ray Liotta,  Leelee Sobieski
46327
127

## 5

### Alvin and the Chipmunks: The Squeakquel
(2009)
Animation, Adventure, Comedy
4.5
Flop
The world-famous singing preteen chipmunk trio return to contend with the pressures of school, celebrity, and a rival female music group known as The Chipettes.
Director: Betty Thomas |      Stars: Jason Lee,  Zachary Levi,  David Cross,  Justin Long
45491
88

