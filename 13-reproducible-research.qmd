# Reproducible Research

## Learning Objectives 

1. 
2. 
3. 

## Class Announcements


## Roadmap

**Rearview Mirror**

**Today**

**Looking Ahead**


## What data science hopes to accomplish

- As a data scientist, our goal is to learn about the world:
  - *Theorists* and *theologians* build systems of explanations that are consistent with themselves
  - *Analysts* build systems of explanations that are consistent with the past
  - *Scientists* build systems of explanations that usefully predict events, **or data**, that hasn't yet been seen


## Learning from Data

- As a data scientist, the way we learn about the world is through the streams of data that **real world** events produce
  - Machine processes 
  - Political outcomes 
  - Customer actions 

- The watershed moment in our field has been the profusion of data available, from many places, that is richer than at any other point in our past. 
  - In 251, and 266 we place structure on data series like audio, video and text that are *transcendently* rich 
  - In 261 we bring together flows of data that are generated at massive scales 
  - In 209 we ask, "How can we take data, and produce a *new* form of it that is most effectively understood by the human visual and interactive mind? 
  

## Data Science and Statistics

- So why statistics? 
- And why the way we've chosen to approach statistics in 203? 


## Why Statistics?: A Closing Argument for Statistics 

- Business, policy, education and medical decisions are made *by humans* based on data 
- A central task when we observe some pattern in data is to **infer** whether the pattern will occur in some novel context

- Statistics, as we practice it in 203, allows us to characterize: 
  - What we have seen 
  - What we *could have seen* 
  - Whether any guarantees exist about what we have seen
  - What we can infer about the population
- So that we can either describe, explain or predict behavior. 


## Course Goals 
### Course Section III: Purpose-Driven Models 

- Statistical models are unknowing transformations of data
  - Because they're built on the foundation of probability, we have certain guarantees what a model "says" 
  - Because they're unknowing, the models themselves know-not what they say. 
- As the data scientist, bring them alive to achieve our modeling goals 

- In Lab 2 we have expanded our ability to parse the world using regression, built a model that accomplishes our goals, and done so in a way that brings the ability to test under a *"null"* scenario 
  - **Key insight**: regression is little more than conditional averages 

### Course Section II: Sampling Theory and Testing

- Under **very** general assumptions, sample averages follow a predictable, known, distribution -- the *Gaussian  distribution*
- This is true, even when the underlying probability distribution is *very* complex, or unknown! 
- Due to this common distribution, we can produce reliable, general tests! 
- In Lab 1 we computed simple statistics, and used guarantees from sampling theory to **test** whether these differences were likely to arise under a *"null"* scenario

### Course Section I: Probability Theory

- Probability theory
  - Underlies modeling and regression (Part III); 
  - Underlies  sampling, inference, and testing (Part II)
  - **Every** model built in **every** corner of data science

We can: 

- Model the complex world that we live in using probability theory; 
- Move from a probability density function that is defined in terms of a single variable, into a function that is defined in terms of many variables 
- Compute useful summaries -- i.e. the BLP, expected value, and covariance -- even with *highly* complex probability density functions. 


### Statistics as a Foundation for MIDS 

- In w203, we hope to have laid a foundation in probability that can be used not only in statistical applications, but also in every other machine learning application that are likely to ever encounter

## Reproducibility Discussion 
**Green Jelly Beans** 

<img src=https://imgs.xkcd.com/comics/significant.png></img>

**What went wrong here?** 

### Discussion

**Status Update** 
You have a dataset of the number of Facebook status updates by day of the week.  You run 7 different t-tests, one for posts on Monday (versus all other days), or for Tuesday (versus all other days), etc.  Only the test for Sunday is significant, with a p-value of .045, so you throw out the other tests.  

Should you conclude that Sunday has a significant effect on number of posts?  (How can you address this situation responsibly when you publish your results?)



**Such Update**
As before, you have a dataset of the number of Facebook status updates by day of the week.  You do a little EDA and notice that Sunday seems to have more "status updates" than all other days, so you recode your "day of the week" variable into a binary one: Sunday = 1, All other days = 0.  You run a t-test and get a p-value of .045.  Should you conclude that Sunday has a significant effect on number of posts?


**Sunday Funday** 
Suppose researcher A tests if Monday has an effect (versus all other days), Researcher B tests Tuesday (versus all other days), and so forth.  Only Researcher G, who tests Sunday finds a significant effect with a p-value of .045.  Only Researcher G gets to publish her work.  If you read the paper, should you conclude that Sunday has a significant effect on number of posts?  



**Sunday Repentence**
What if researcher G above is a sociologist that chooses to measure the effect of Sunday based on years of observing the way people behave on weekends?  Researcher G is not interested in the other tests, because Sunday is the interesting day from her perspective, and she wouldn't expect any of the other tests to be significant.


**Decreasing Effect Sizes** 
Many observers have noted that as studies yielding statistically significant results are repeated, estimated effect sizes go down and often become insignificant.  Why is this the case?
