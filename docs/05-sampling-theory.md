

# Learning from Random Samples 

![south hall](./images/south_hall.jpeg)


## Learning Objectives 

1. 
2. 
3. 

## Class Announcements

- You're done with probability theory. Congrats!
- You're also done with your first test. Congrats! 
- We're going to have a second test in a few weeks; then we're done testing for the semester


## Roadmap 

**Where We're Going -- Coming Attractions** 

- We're going to start bringing data into our work 
- First, we're going to develop a testing framework that is built on sampling theory and reference distributions -- `t.tests`, `wilcox.test` and the like
- Second, we're going to show that OLS regression is the sample estimator of the BLP 
- Third, we're going to use the testing distribution to test regression coefficients 

**Where We've Been -- Random Variables and Probability Theory** 

- Statisticians create a model (A.K.A. population) to represent the world.
- That model can be described by parameters like expecation, covariance.
- So far, these parameter values have come from our imaginations


**Where we Are**

- We want to fit models -- use data to set their parameter values.
- A sample is a set of random variables
- Sample statistics are functions of a sample, and they are random variables
- Under iid and other assumptions, we get useful properties: 
  - Statistics may be consistent estimators for population parameters
  - The distribution of sample statistics may be asymptotically normal

## Key Terms and Assumptions


### Definitions

Define each of the following:

- Sample
- Sample Statistic
- Estimator
- Bias
- Efficiency 
- Consistency
- Convergence in Probability 
- Convergence in Distribution

### IID

For each scenario, is the IID assumption plausible?

- Call a random phone number.  If someone answers, interview all persons in the household.  Repeat until you have data on 100 people.
- Call a random phone number, interview the person if they are over 30.  Repeat until you have data on 100 people.
- Record year-to-date price change for 20 largest car manufacturers.
- Measure net exports per GDP for all 195 countries recognized by the UN.

### Understanding Sampling Distributions 

- Let $X$ be a Bernoulli random variable representing an unfair coin with $P(X=1) = 0.7$.
- You have an iid sample of size 2,  $(X_1,X_2)$.
- Compute the sampling distribution of $\overline X = \frac{X_1+X_2}{2}$.

<img src="05-sampling-theory_files/figure-html/make axes-1.png" width="672" />

**Questions:**

- Explain the difference between a population distribution and the sampling distribution of a statistic.
- As we toss more and more coins, $\overline X_{(100)} \rightarrow \overline X_{(10000)}$ what will the value of $\overline X$ get closer to? What law generates this, and why does this law generate this result?
- Why do we want to know things about the sampling distribution of a statistic?

## Uncertainty

**Which Result is Better?**

- Suppose that you measure salary data among individuals who try different strategies
- Report out in the following table: 

|                    | Early Rising | Mindfulness Retreat | MIDS Degree |
|--------------------|--------------|---------------------|-------------|
| Increase in Salary |    \$1020    |            \$5130   |      \$9200 |
| $SE$               |   (\$350)    |          (\$4560)   |             |
| $N =$              |  1,000       | 77                  | 700         |  

*(Standard errors in parentheses when available)*


## Write Code to Demo the Central Limit Theorem (CLT)

### Motivating the Central Limit Theor (CLT)

- Standard Errors tell us a lot about the uncertainty in our statistics
- But we want to say more: 
  - How confident are we that this vitamin has a positive effect?
  - How plausible is a mean income \$1000 below our estimate?
- For these questions, we need to know the sampling distribution of our statistic.
- How is this possible when we don't know the population distribution?

### Sampling from the Bernoulli Distribution in R 
- To demonstrate the CLT, we chose a Bernoulli distribution with parameter $p$.
  - This distribution is very simple
  - This distribution is non-normal, and can be very skewed depending on $p$.
  
- First, set `p=0.5` so your population distribution is symmetric.  Use a variable `n` to represent your sample size.  Initially, set `n=3`.


```r
n <- 3
p <- 0.5
```


### Useful R Commands

**sample() or rbinom()**

- R doesn't have a `bernoulli` function.
- To simulate draws from a Bernoulli variable, you can either: 
  - Use `sample` 
  - Or, use `rbinom` (the Bernoulli distribution is a special case of a binomial distribution.  In this function, `size` refers to a distribution parameter, not the number of draws.)



```r
sample(x=0:1, size=n, replace=TRUE, prob=c(1-p, p))
rbinom(n=n, size=1, prob=p)
```

```
## [1] 0 1 1
## [1] 0 1 1
```

**replicate()** 

- To repeat an action, you can use `replicate`


```r
replicate(10, log(10))
```

```
##  [1] 2.302585 2.302585 2.302585 2.302585 2.302585 2.302585 2.302585 2.302585
##  [9] 2.302585 2.302585
```

**hist()** 

- To quickly visualize your results, try `hist`


```r
hist(x = rnorm(100), main = "Simulated Sample Means")
```

<img src="05-sampling-theory_files/figure-html/quick histogram-1.png" width="672" />

**ggplot()**

- Or, to work with `ggplot` store these results in a data.frame.  


```r
d <- data.frame(x = rnorm(100))
d %>% 
  ggplot(aes(x=x)) + 
  geom_histogram() 
```

<img src="05-sampling-theory_files/figure-html/ggplot histogram-1.png" width="672" />

## Exercise
**Part 1**

Throughout this part, we will use fair coins (`p = 0.5`).  

1. Fill in the function below so that it simulates taking n draws from a Bernoulli distribution with parameter p.  This is like tossing n coins at the same time. Use the `mean` function to compute the sample mean -- the average of the number of heads that are showing.  Make sure that when you run it, you return values in $\{0,1/3,2/3,1\}$.


```r
experiment = function(n, p){
}
```

2. The sample mean is a random variable. To understand it, use the visualization trick from a few weeks ago.  Use the `replicate` function to run the above experiment 1000 times, and plot a histogram of the results.



3. If you replicate the experiment enough times, will the distribution ever look normal?  Why or why not?



4. Use `sd()` to check the standard deviation of the sampling distribution of the mean for `number_of_coins = 3`.  What sample size is needed to decrease the standard deviation by a factor of 10?  Check that your answer is correct.



**Part 2**

For this part, we'll continue to study a fair coin. 

5. Try different values for the sample size n, and examine the shape of the sampling distribution of the mean.  At what point does it look normal to you?



**Part 3**

For this part, we'll study a very unfair coin. `p = 0.01`.  

This is an example of a highly skewed random variable.  That roughly means that one tail is a lot longer than the other.

For this activity, you can simply use your eyes to gauge how skewed a distribution is.  If you prefer, you can also use the skewness command in the univar package to measure skewness.  You may hear a rule of thumb that a skewness above 1 or below -1 is a highly skewed distribution.

6. Start with n=3 as before.  What do you notice about the shape of the sampling distribution?



7. Try different values for the sample size n, and examine the shape of the sampling distribution of the mean.  At what point does it look normal to you?




## Discussion Questions

1. How does the skewness of the population distribution affect the applicability of the Central Limit Theorem?  What lesson can you take for your practice of statistics?

2. Name a variable you would be interested in measuring that has a substantially skewed distribution.

3. One definition of a heavy tailed distribution is one with infinite variance.  For example, you can use the `rcauchy` command in R to take draws from a Cauchy distribution, which has heavy tails.  Do you think a "heavy tails" distribution will follow the CLT? What leads you to this intuition? 


