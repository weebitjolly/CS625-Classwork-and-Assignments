## Name: Nick Darrow
## UIN: 01178936
## Class: CS625
## Assignment HW5
## Date: 03/24/25

link to the google colab where these visual were created: https://colab.research.google.com/drive/1wQig4G7FziJlTVUBhTbv3dRKzgAribFG#scrollTo=kUgTb-Ox_D4Q 

# Part 1: Chart Creation and Intial Analysis

## Chart 1:boxplot: Show the distributions of the urban and rural populations in 2000

### Data Manipulation
intially I didn't have to do much data manipulation on python until the later parts of this assignment, but originally I used power query editor to make my manipulations, please reference the link above to see the DAX for that. I had move some values around, rename some columns and replace some values, I really don't know how they use this format its inaccessible for data scientists.

![alt text](boxplotsURP.jpg)

### Explanation of Advantages, Disadvantages and Observations

```sns.boxplot(x='Population Type', y='Total', data=URP) 
#plt.yscale('log')
plt.savefig('boxplotsURP.jpg', dpi=300, bbox_inches='tight')
plt.show()
```
This is the code I used for this plot very simple and easy. I think this idiom works pretty well for this data, it shows that urban populations have a wider range of populations and larger population than the rural populations, what would be even more helpful is if we showed 5 distinct states in the distribution using highlighting just to give a better sense of place for many of these states. I think what's also helpful about this one is you can see where your median lies.


## Chart 2: histogram: Show the distribution of either the urban or rural population in 2000 (your chart title must indicate which)

### Data Manipulation
I know the directions say choose either rural or urban but I wanted to see both for my own curiosity so we had to run this code to get the histogram ready to show
```#Urban
urban_data = URP.loc[URP['Population Type'] == 'Urban Population_2000_Number (1,000)', 'Total'] 
urban_data = pd.to_numeric(urban_data, errors='coerce') # Convert the Series directly to numeric

#Rural
Rural_data = URP.loc[URP['Population Type'] == 'Rural population, 2000 (1,000)', 'Total'] 
Rural_data = pd.to_numeric(Rural_data, errors='coerce') 
```
what this does for us is isolate the unpivoted population type column to show either just the urban or rural values and the total column is the population then we change the value to numeric because it wouldn't run orginally because it was considered an object

![alt text](histogramurban.jpg)

### Explanation of Advantages, Disadvantages and Observations

```#Urban distribution
import seaborn as sns
import matplotlib.pyplot as plt
import numpy as np

# Create histogram
plt.figure(figsize=(8, 6))
sns.histplot(urban_data, bins = 30, kde=True, color="blue")

# Add labels and title
plt.xlabel("Population Totals")
plt.ylabel("Frequency")
plt.title("Distribution of Urban Populations in the US in 2000")

plt.savefig('histogramurban.jpg', dpi=300, bbox_inches='tight')
plt.show()
```
I'll only show the one for urban because the rural is pretty much the same code just with the 'rural_data' the advantage of this plot you can see the data over the x-axis with a KDE line overlayed on top so that we can get a better sense of the curve in the data, but this one is disdvantaged because there are gaps in ur bins due to under representation of data. We can see theres a huge average at around 2500 and then it dips drastically. this means there are huge outliers in the form of california which we'll see in part two

## Chart 3: eCDF: Show the distributions of urban and rural populations in 2000

### Data Manipulation

![alt text](URPeCDF.jpg)

### Explanation of Advantages, Disadvantages and Observations

# Part 2: Further Analysis

## References
