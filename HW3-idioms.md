Nicholas Darrow
CS625 HW3
02/23/25

Please follow along here: *https://github.com/weebitjolly/CS625-Classwork-and-Assignments/blob/main/HW3visuals.ipynb* 

# Data
The three dastasets I decided to use was the **norfolk water quality dataset**, **Gate Cuttoff Dataset**, and the **Amazon Stocks Dataset**

## Data Preprocessing
there wasn't much I had to do in terms of data pre-processing, the data is already pretty clean. The only changes I actually made was before creating the visual for the amazon highs and lows I created monthly average aggregations.

## Visualization Idioms & visual encoding choices

![Alt text](https://github.com/weebitjolly/CS625-Classwork-and-Assignments/blob/main/Screenshot%202025-02-23%20at%2019.19.21.png)

For this idiom I wanted to see what plants processed the different types of compounds. essentially the federal government classifies different compounds into different categories based on how important they are as contaminants in tap water (i.e. Primary, Secondary, Unregulated). The idiom itself was a good choice because we have two categorical variables that we want to plot along with their counts as a quantitative variable on the y-axis. we can see that across the board different compouns are processed at equal levels at each of the two locations

| Data: Attribute  | Data: Attribute Type |  Encode: Channel                                                   |
| ---------------  | -------------------- | -------------------------------------------------------------------| 
| Regulation       | Key, categorical     | horizontal position on a common scale (x-axis), entire bar         |
| Treatmenty Plant | value, categorical   | horizontal position on a common scale (x-axis), colors on the bar  |
| Count            | value, quantitative  | vertical spatial region (y-axis)                                   |


![Alt text](https://github.com/weebitjolly/CS625-Classwork-and-Assignments/blob/main/gate.png)
| Data: Attribute | Data: Attribute Type | Encode: Channel                        |
|----------------|---------------------|----------------------------------------|
| GEN           | value, numerical     | horizontal position (x-axis)          |
| SC/ST         | value, numerical     | vertical position (y-axis)            |
| Point Size    | value, numerical     | marker size (`s` parameter)           |
| Transparency  | value, numerical     | marker opacity (`alpha` parameter)    |

for this idiom I wanted to see the relationship between GEN and SC/ST. We find that it's a near perfect poszitive relationship. would have been more varied with more data. This idiom is perfect for this kind of analysis because you can see how variables interact with each other statisically. I think this idiom is appropriate for this dataset because maybe we want to see how different numerical influence one another and what factors influence these test cutoffs.


![Alt text](https://github.com/weebitjolly/CS625-Classwork-and-Assignments/blob/main/Screenshot%202025-02-23%20at%2019.19.52.png)

For this idiom I wanted to see how highs and lows changed overtime using monthly averages. We can see that early on the high and low averages don't differ all that much, but as we get into the late 2010's as the company grows we see that monthly highs and lows vary and fluctuate. This is an appropriate idiom choice because we have two numerical variable plotted over a time variable on the x-axis.

![Alt text](https://github.com/weebitjolly/CS625-Classwork-and-Assignments/blob/main/Screenshot%202025-02-23%20at%2019.21.32.png)
| Data: Attribute | Data: Attribute Type  | Encode: Channel                  |
|----------------|---------------------|----------------------------------|
| Date          | Key, temporal        | horizontal position (x-axis)    |
| High          | value, quantitative  | vertical position (y-axis), line color 1 |
| Low           | value, quantitative  | vertical position (y-axis), line color 2 |
| Month         | Derived, temporal    | x-axis grouping (resampling)    |

### ease of use 
definitely powerBI; PowerBI makes making visualizations very accessible, much like tableau just drag and drop items onto your visualization and go from there. I will say though, if you ask a lot of data analyst many say that PowerBI is great at doing 95% of the job, but there's always 5% that it can't do and that's what's great about python or R, if you want a visual to be a certain way specifically, it can do it.

### References:
https://www.codecademy.com/resources/docs/markdown/tables
https://chatgpt.com/




