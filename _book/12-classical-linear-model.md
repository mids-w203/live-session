
# The Classical Linear Model

## Learning Objectives 

1. 
2. 
3. 

## Class Announcements

- Lab 2 Deliverable and Dates 
  - Research Proposal (Today)
  - Within-Team Review (Today)
  - Final Report (Week 14)
  - Final Presentation (Week 14)

## Roadmap

**Rearview Mirror**

- Statisticians create a population model to represent the world.
- The BLP is a useful summary for a relationship among random variables.
- OLS regression is an estimator for the Best Linear Predictor (BLP).
- For a large sample, we only need two mild assumptions to work with OLS
    - To know coefficients are consistent
    - To have valid standard errors, hypothesis tests

**Today**

- The Classical Linear Model (CLM) allows us to apply regression to smaller samples.
- The CLM requires more to be true of the data generating process, to make coefficients, standard errors, and tests *meaningful* in small samples. 
- Understanding if the data meets these requirements (often called assumptions) requires considerable care.

**Looking Ahead**

- The CLM -- and the methods that we use to evaluate the CLM -- are the basis of advanced models (*inter alia* time-series)
- (Week 13) In a regression studies (and other studies), false discovery is a widespread problem.  Understanding its causes can make you a better member of the scientific community.

## The Classical Linear Model     

### Comparing the Large Sample Model and the CLM

**Part I**

- We say that in small samples, more needs be true of our data for OLS regression to "work." 
  - What do we mean when we say "work"? 
    - If our goals are descriptive, how is a "working" estimator useful?
    - If our goals are explanatory, how is a "working" estimator useful? 
    - If our goals are predictive, are the requirements the same? 
    
**Part II**

- Suppose that you're interested in understanding how subsidized school meals benefit under-resourced students.
  - Using the tools from 201, refine this question to a data science question.
  - Suppose that to answer the question you have identified, there are two data sources:
    - Individual-level data about income, nutrition and test scores, self-reported by individual families who have opted in to the study.  
    - Government data about school district characteristics, including district-level college achievement; county-level home prices, and state-level tax receipts.
  - What are the tradeoffs to these different sources?

  
**Part III**

- Suppose you use individual-level data (you have a large sample).  
    - Which of the large-sample assumptions do you expect are valid, and which are problematic?
- Say you use school-district-level data (you have a small sample).
    - Which of the CLM assumptions do you expect are valid, and which do you expect are most problematic?
- Which dataset do you think will give you more precise estimates?

  
## Problems with the CLM Requirements 

- There are five requirements for the CLM

  1. IID Sampling 
  2. Linear Conditional Expectation 
  3. No Perfect Collinearity
  4. Homoskedastic Errors 
  5. Normally Distributed Errors
  
- For each of these requirements: 
  - Identify one **concrete** way that the data might not satisfy the requirement. 
  - Identify what the consequence of failing to satisfy the requirement would be. 
  - Identify a path forward to satisfy the requirement. 
  

## R Exercise

```r
library(tidyverse)
library(wooldridge)
library(car)
library(lmtest)
library(sandwich)
library(stargazer)
```

If you haven't used the `mtcars` dataset, you haven't been through an intro applied stats class! 

In this analysis, we will use the mtcars dataset which is a dataset that was extracted from the 1974 Motor Trend US magazine, and comprises fuel consumption and 10 aspects of automobile design and performance for 32 automobiles (1973-74 models). The dataset is automatically available when you start R.  For more information about the dataset, use the R command: help(mtcars)


```r
data(mtcars)

glimpse(mtcars)
```

```
## Rows: 32
## Columns: 11
## $ mpg  <dbl> 21.0, 21.0, 22.8, 21.4, 18.7, 18.1, 14.3, 24.4, 22.8, 19.2, 17.8,~
## $ cyl  <dbl> 6, 6, 4, 6, 8, 6, 8, 4, 4, 6, 6, 8, 8, 8, 8, 8, 8, 4, 4, 4, 4, 8,~
## $ disp <dbl> 160.0, 160.0, 108.0, 258.0, 360.0, 225.0, 360.0, 146.7, 140.8, 16~
## $ hp   <dbl> 110, 110, 93, 110, 175, 105, 245, 62, 95, 123, 123, 180, 180, 180~
## $ drat <dbl> 3.90, 3.90, 3.85, 3.08, 3.15, 2.76, 3.21, 3.69, 3.92, 3.92, 3.92,~
## $ wt   <dbl> 2.620, 2.875, 2.320, 3.215, 3.440, 3.460, 3.570, 3.190, 3.150, 3.~
## $ qsec <dbl> 16.46, 17.02, 18.61, 19.44, 17.02, 20.22, 15.84, 20.00, 22.90, 18~
## $ vs   <dbl> 0, 0, 1, 1, 0, 1, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0,~
## $ am   <dbl> 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0,~
## $ gear <dbl> 4, 4, 4, 3, 3, 3, 3, 4, 4, 4, 4, 3, 3, 3, 3, 3, 3, 4, 4, 4, 3, 3,~
## $ carb <dbl> 4, 4, 1, 1, 2, 1, 4, 2, 2, 4, 4, 3, 3, 3, 4, 4, 4, 1, 2, 1, 1, 2,~
```

**Questions:**

1. Using the mtcars data, run a multiple linear regression to find the relationship between displacement (`disp`), gross horsepower (`hp`), weight (`wt`), and rear axle ratio (`drat`) on the miles per gallon (`mpg`).



2. For **each** of the following CLM assumptions, assess whether the assumption holds.  Where possible, demonstrate multiple ways of assessing an assumption.  When an assumption appears violated, state what steps you would take in response.
   - I.I.D. data
   - Linear conditional expectation
   - No perfect collinearity
   - Homoskedastic errors
   - Normally distributed errors


3. In addition to the above, assess to what extent (imperfect) collinearity is affecting your inference. 

4. Interpret the coefficient on horsepower. 

5. Perform a hypothesis test to assess whether rear axle ratio has an effect on mpg. What assumptions need to be true for this hypothesis test to be informative? Are they? 

6. Choose variable transformations (if any) for each variable, and try to better meet the assumptions of the CLM (which also maintaining the readability of your model).

7. (As time allows) report the results of both models in a nicely formatted regression table.
