# OLS Regression Estimates
![](./images/linear_regression.png)

## Learning Objectives 

1. 
2. 
3. 


## Class Announcements

1. Lab 1 is due next week.
2. There is no HW 8.  We will have HW 9 as usual.
3. You're doing great - keep it up!

## Roadmap

**Rear-View Mirror**

- Statisticians create a population model to represent the world.
- Sometimes, the model includes an "outcome" random variable $Y$ and "input" random variables $X_1, X_2,...,X_k$.
- The joint distribution of $Y$ and $X_1, X_2,...,X_k$ is complicated.
- The best linear predictor (BLP) is the canonical way to summarize the relationship.

**Today**

- OLS regression is an estimator for the BLP
- We'll discuss the *mechanics* of OLS

**Looking Ahead**

- To make regression estimates useful, we need measures of uncertainty (standard errors, tests...).
- The process of building a regression model looks different, depending on whether the goal is prediction, description, or explanation.


## Regression Discussion

### Discussion Questions

Suppose we have random variables $X$ and $Y$.

- Why do we care about the BLP?
- What assumptions are needed for OLS to consistently estimate the BLP?
- What assumptions are needed in terms of causality ($X$ causes $Y$, $Y$ causes $X$, etc.) in order to compute the regression of $Y$ on $X$?

### Reasoning by Analogies

Here are some phrases about regression "in the population."  Convert each of them to its sample counterpart.

- Population :: Sample 
- Error $\epsilon$ :: residuals :: $e_{i}$
- The BLP is the predictor that minimizes expected squared error.
- $\beta_1 = \frac{Cov[X,Y]}{V[X]}$.
- $Cov[X, \epsilon] = 0$
- $E[\epsilon] = 0$
- The population moment conditions uniquely specify one line, which is the BLP.

## Coding Activity:R Cheat Sheet

Suppose `x` and `y` are variables in dataframe `d`.

To fit an ols regression of Y on X:

    mod <- lm(y ~ x, data = d)

To access **coefficients** from the model object:

    mod$coefficients
    or coef(mod)
    
To access **fitted values** from the model object:

    mod$fitted
    or fitted(mod)
    or predict(mod)

To access **residuals** from the model object:

    mod$residuals
    or resid(mod)
   
To create a scatterplot that includes the regression line:

    plot(d['x'], d['y'])
    abline(mod)
    or 
    d %>% 
      ggplot() + 
      aes(x = x, y = y) + 
      geom_point() + 
      geom_smooth(method = lm)


## R Exercise

**Real Estate in Boston** 

The file `hprice1.Rdata` contains 88 observations of homes in the Boston area, taken from the real estate pages of the Boston Globe during 1990.  This data was provided by Wooldridge.


```r
load('data/hprice1.RData') # provides 3 objects 
```


```r
head(data)
```

```
##     price assess bdrms lotsize sqrft colonial   lprice  lassess llotsize
## 1 300.000  349.1     4    6126  2438        1 5.703783 5.855359 8.720297
## 2 370.000  351.5     3    9903  2076        1 5.913503 5.862210 9.200593
## 3 191.000  217.7     3    5200  1374        0 5.252274 5.383118 8.556414
## 4 195.000  231.8     3    4600  1448        1 5.273000 5.445875 8.433811
## 5 373.000  319.1     4    6095  2514        1 5.921578 5.765504 8.715224
## 6 466.275  414.5     5    8566  2754        1 6.144775 6.027073 9.055556
##     lsqrft
## 1 7.798934
## 2 7.638198
## 3 7.225482
## 4 7.277938
## 5 7.829630
## 6 7.920810
```

- Are there variables that would _not_ be valid outcomes for an OLS regression? If so, why? 
- Are there variables that would _not_ be valid inputs for an OLS regression? If so, why? 

### Assess the Relationship between Price and Square Footage

Suppose that you're interested in knowing the relationship between price and square footage. 

0. Assess the assumptions of the Large-Sample Linear Model.

1. Create a scatterplot of `price` and `sqrft`. Like every plot you make, ensure that the plot *minimally* has a title and meaningful axes. 



2. Find the correlation between the two variables.

3. Recall the equation for the slope of the OLS regression line -- here you can either use Variance and Covariance, or if you're bold, the linear algebra.  Compute the slope manually (without using `lm()`)



4.  Regress `price` on `sqrft` using the `lm` function. This will produce an estimate for the following model: 

\[ 
price = \beta_{0} + \beta_{1} sqrft + e
\] 




5. Create a scatterplot that includes the fitted regression.



6. Interpret what the coefficient means. 

- State what features you are allowing to change and what features you're requiring do not change.
- For each additional square foot, how much more (or less) is the house worth? 

7. Estimate a new model (and save it into another object) that includes the size of the lot and whether the house is a colonial. This will estimate the model: 

\[ 
price = \beta_{0} + \beta_{1} sqrft + \beta_{2} lotsize + \beta_{3} colonial? + e
\] 

- *BUT BEFORE YOU DO*, make a prediction: What do you think is going to happen to the coefficient that relates square footage and price? 
  - Will the coefficient increase, decrease, or stay the same? 

7. Compute the sample correlation between $X$ and $e_i$. What guarantees do we have from the book about this correlation? Does the data seem to bear this out?


