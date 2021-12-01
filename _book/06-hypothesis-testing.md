# Hypothesis Testing
![update!](./images/frequentists_vs_bayesians.png)

## Learning Objectives 

1. 
2. 
3. 


## Class Announcements

- Test 2 is this week
    - Includes units 4-5 (not 6)
    - There is another practice test on Gradescope
- Lab 1 starts after live session 7
    - 2 week lab
    - You will work in a group to conduct hypothesis tests


## Roadmap

**Looking Backwards**

- Statisticians create a model to represent the world
- We saw examples of estimators, which approximate model parameters we're interested in.
- By itself, an estimate isn't much good; we need to capture the uncertainty in the estimate.
- We've seen two ways to express uncertainty in an estimator: standard errors and confidence intervals.

**Today**

- We introduce hypothesis testing
  - A hypothesis test also captures uncertainty, but in relation to a specific hypothesis.

**Looking Ahead**

- We'll build on the one-sample t-test, to introduce several other statistical tests.
- We'll see how to choose a test from different alternatives, with an eye on meeting the required assumptions, and maximizing power.

## Discussion

### Discussion Questions 1

- What are the two possible outcomes of a hypothesis test?
- What guarantee do you get if you follow the decision rules properly?
- Why do we standardize the mean to create a test statistic?

$$ t = \frac{ \overline{X}_n - \mu}{\sqrt{\frac{s^2}{n}}} $$

### Discussion Questions 2
- Explain this joke:

<img src=https://imgs.xkcd.com/comics/null_hypothesis.png></img>


## Manual Computation of a t-Test

In a warehouse full of power packs labeled as 12 volts we randomly measured the voltage of 7.  Here is the data:


```r
voltage <- c(11.77, 11.90, 11.64, 11.84, 12.13, 11.99,  11.77)
```

1. Find the mean and the standard deviation. 



2. Using `qt()`, compute the t critical value for a hypothesis test for this sample. (Following convention, set $\alpha = .05$.)



3. Define a test statistic, $t$, for testing whether the population mean is 12. 



4. Calculate the p-value using the t statistic.



5. Should you reject the null?  Argue this in two different ways.


6. Suppose you were to use a normal distribution instead of a t-distribution to test your hypothesis.  What would your p-value be for the z-test?



7. Without actually computing it, say whether a 95% confidence interval for the mean would include 12 volts.

8. Compute a 95% confidence interval for the mean.




## Data Exercise

**t-Test Micro Cheat Sheet**

- Key t-Test Assumptions
    - Metric variable
    - IID
    - No major deviations from normality, considering sample size
    
**Testing the Home Team Advantage**


The file athlet2.Rdata contains data on college football games.  The data is provided by Wooldridge and was collected by Paul Anderson, an MSU economics major, for a term project.  Football records and scores are from 1993 football season.


```r
load("data/athlet2.RData")
data
```

```
##    dscore dinstt doutstt htpriv vtpriv dapps htwrd vtwrd dwinrec dpriv
## 1      10   -409   -4679      0      0 -1038     1     1       0     0
## 2     -14     NA     -66      0      0 -7051     1     1       0     0
## 3      23   -654    -637      0      0  6209     1     0       1     0
## 4       8   -222     456      0      0  -129     1     1       0     0
## 5     -12    -10     208      0      0   794     1     1       0     0
## 6       7    494      17      0      0   411     0     0       0     0
## 7     -21      2       2      0      0 -4363     1     1       0     0
## 8      -5     96    -333      0      0  1144     1     0       1     0
## 9      -3    223    2526      0      0  3956     0     0       0     0
## 10    -32    -20       0      0      0  -641     0     1      -1     0
## 11      9     66       0      0      0  -278     1     0       1     0
## 12      1     56    -346      0      0 -2223     1     0       1     0
## 13      7    556     717      0      0 -5217     1     0       1     0
## 14    -20    169    -461      0      0  1772     0     1      -1     0
## 15     35   -135     396      0      0    85     1     0       1     0
## 16     35    -40       0      0      0  -988     1     0       1     0
## 17    -25     24       0      0      0 -8140     1     1       0     0
## 18     -9     90       0      0      0  8418     0     1      -1     0
## 19    -33     27     900      0      0 -3273     0     0       0     0
## 20      7    -89     -31      0      0  1906     1     0       1     0
## 21     -3    536    2352      0      0  -151     1     1       0     0
## 22     -6  13261    9111      1      0 -9936     1     1       0     1
## 23    -29  13809   10076      1      0 -6265     0     1      -1     1
## 24     14 -17631  -10589      0      1  1252     1     0       1    -1
## 25    -18  14885    9983      1      0 -4529     1     1       0     1
## 26     48 -15220  -11400      0      1  -318     1     0       1    -1
## 27     -3     99     -29      0      0  -797     0     1      -1     0
## 28     -3    -54     -88      0      0  -372     0     1      -1     0
## 29     -3    -98   -4175      1      0  2460     1     1       0     1
## 30      2   -304    2987      0      1 -3035     1     1       0    -1
```

We are especially interested in the variable, dscore, which represents the score differential, home team score - visiting team score.  We would like to test whether a home team really has an advantage over the visiting team.


1. The instructor will assign you to one of two teams.  Team 1 will argue that the t-test is appropriate to this scenario.  Team 2 will argue that the t-test is invalid.  Take a few minutes to examine the data, then formulate your best argument.



2. Should you perform a one-tailed test or a two-tailed test?  What is the strongest argument for your answer?



3. Execute the t-test and interpret every component of the output.



4. Based on your output, suggest a different hypothesis that would have led to a different test result.  Try executing the test to confirm that you are correct.



##  Assumptions Behind the t-test

For the following scenarios, what is the strongest argument against the validity of a t-test?

- You have a sample of 50 CEO salaries, and you want to know whether the mean salary is greater than $1 million.

- A nonprofit organization measures the percentage of students that pass an 8th grade reading test in 40 neighboring California counties.  You are interested in whether the percentage of students that pass in California is over 80%

- You have survey data in which respondents assess their own opinion of corgis, with options ranging from "1 - extreme disgust" to "5 - affection so intense it threatens my career."  You want to know whether people on the average like corgis more than 3, representing neutrality.


