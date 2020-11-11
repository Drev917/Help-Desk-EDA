# Help-Desk-EDA

#### Problem statement: Examine average daily call patterns and staffing efficiencies during a representative population in the sample dataset. 

![ScreenShot](https://github.com/Drev917/Help-Desk-EDA/blob/main/Staffing%20Slides/Staffing%201.JPG)

The Help Desk data table provides information on typical volumes for a week of help desk calls; This sample in particular was pulled from calls recorded in the month of October.

![ScreenShot](https://github.com/Drev917/Help-Desk-EDA/blob/main/Staffing%20Slides/Staffing%202.JPG)

Structure of the data is 60 observations of 3 columns:
 - `Day` & `Hour` vectors have character data type
 - `Number of Calls` is a numerical data type
A quick summary of the data shows a total range of observable calls of 1,156, median value of 341, and a mean of 339 calls rounded as an integer.


Looking at the data table comprehensively, we quickly noticed a few outliers and values that we determined as erroneous inputs. Recoded negatives and erroneous character variables.

![ScreenShot](https://github.com/Drev917/Help-Desk-EDA/blob/main/Staffing%20Slides/Staffing%203.JPG)

Sliced the data by the unique `Day` values, added the `Hour` values as columns, and then stacked the calls horizontally, allowing us to easily see all the calls using the head() function. Used dplyr library to quickly sum by `Number of Calls`.

![ScreenShot](https://github.com/Drev917/Help-Desk-EDA/blob/main/Staffing%20Slides/Staffing%204.JPG)

Our team decided to use the mean statistic for the data set as the best metric to evaluate the data. By using mean you can quickly calculate any day’s variance based on the sample size and staff accordingly. The mean also allowed us to create quick ‘Mean calls by day’ and ‘Mean calls by shift’ variables in R

![ScreenShot](https://github.com/Drev917/Help-Desk-EDA/blob/main/Staffing%20Slides/Staffing%205.JPG)

We can then present our major findings:

![ScreenShot](https://github.com/Drev917/Help-Desk-EDA/blob/main/Staffing%20Slides/Staffing%206.JPG)

And our recommendations for action:

![ScreenShot](https://github.com/Drev917/Help-Desk-EDA/blob/main/Staffing%20Slides/Staffing%207.JPG)

Thanks for reading!

![ScreenShot](https://github.com/Drev917/Help-Desk-EDA/blob/main/Staffing%20Slides/Staffing%208.JPG)
