# Summarizing Distributions

## Learning Objectives 

1. 
2. 
3. 


## Class Announcements 

## Roadmap 

**Roadmap -- Rearview mirror** 

- Statisticians create a population model to represent the world.
- Random variables are the building blocks of a model. 
- We can describe the distribution of a random variable using:
    - a cdf (all random varibles)
    - a pmf (discrete random variables)
    - a pdf (continuous random variables)
- When we have multiple random variables,
    - a joint pmf / pdf describes how they behave together
    - a marginal pmf / pdf describes one variable in isolation
    - a conditonal pmf / pdf describes one variable given the value of another

**Roadmap -- Today's Lesson**

- A joint distribution has more information than we can ever use (or estimate with finite data).
- To do useful things, we need to summarize certain features we care about:
    - Expectation
    - Variance
    - Covariance
    - Correlation
  
**Roadmap -- Coming Attractions** 

- A predictor is a function that provides a value for one variable, given values of some others.
- Using our summary tools, we will define a predictor's error and then minimize it.
- This is a basis for linear regression



## Proof Strategy Workshop: Expectation

> Let $Y$ be the random variable given by $X^2$ where $X$ is a uniform distribution on the support $[0, 1]$.
>
> What is the expected value of $Y$? 

- Your instructor will assign you to Proof 1, Proof 2, OR Proof 3.
- First, study your proof.
- Second, in breakout rooms, teach your proof to your classmates.

**Proof 1**

We first compute the CDF of Y.  For $0 \leq y \leq 1$,

$$
F_Y(y) = P(Y \leq y) = P(X^2 \leq y) = P(X \leq \sqrt{y}) = \sqrt{y}
$$
Next, we take the derivative to get Y's density for $0 \leq y \leq 1$:

$$
f_Y(y) = \frac{\partial}{\partial y} F_Y(y) = \frac{1}{2} y^{-1/2}
$$

(On your assignments, make sure you write a complete expression)  Finally, 

$$ 
E[Y] = \int_0^1 y f_Y(y) dy = \int_0^1 \frac{1}{2} y^{1/2} dy = \frac{1}{3}y^{3/2} \Bigg|_{y=0}^1 = \frac{1}{3} - 0 = \frac{1}{3}
$$



**Proof 2**

Apply the bonus result from HW 2:  Note that $Y=h(x)$ where $h(x)= x^2$.    For $0 \leq y \leq 1$,

$$
f_{Y}(y) =   f_X(h^{-1}(y)) \cdot \left| \frac{d}{dy} h^{-1}(y) \right| = f_X(\sqrt{y}) \left| \frac{d}{dy} \sqrt{y} \right| = 1\cdot  \frac{1}{2} y^{-1/2}
$$

(On your assignments, make sure you write a complete expression)  Finally, we find the expectation:

$$
E[Y] = \int_0^1 y f_Y(y) dy = \int_0^1 \frac{1}{2} y^{1/2} dy = \frac{1}{3}y^{3/2} \Bigg|_{y=0}^1 = \frac{1}{3} - 0 = \frac{1}{3}
$$


**Proof 3**

Apply the Law of the Unthinking Statistician (LOTUS):

$$
E[Y] = \int_{-\infty}^\infty x^2 f_X(x) dx = \int_{-\infty}^0 x^2 \cdot 0 + \int_0^1 x^2 \cdot 1 dx + \int_1^{\infty} x^2 \cdot 0
$$

$$
E[Y] = 0 + \frac{1}{3}x^3 \Bigg|_0^1 +  0 = \frac{1}{3}
$$

**Proof Debrief**

- In words, what is the power of the Law of the Unthinking Statistician?
- Which was your favorite proof?

## Linearity of Expectation

**Expectation is Linear**

- For a random variable $X$ and constants $a$ and $b$: $$E(aX + b) = aE(X) + b$$
- For two random variables $X$ and $Y$: $$E(X + Y) = E(X) + E(Y)$$.

**Using Linearity, Part I**

- Linearity is a very powerful property.  Using it can often make your solutions much cleaner.
- Say you want to find the expectation of a symmetric variable, $X$.  For example, here's a random variable that's symmetric around 5.

**Using Linearity, Part II**

```
## -- Attaching packages --------------------------------------- tidyverse 1.3.1 --
```

```
## v ggplot2 3.3.5     v purrr   0.3.4
## v tibble  3.1.6     v dplyr   1.0.7
## v tidyr   1.1.4     v stringr 1.4.0
## v readr   2.1.1     v forcats 0.5.1
```

```
## -- Conflicts ------------------------------------------ tidyverse_conflicts() --
## x dplyr::filter() masks stats::filter()
## x dplyr::lag()    masks stats::lag()
```

![](03-summarizing-distributions_files/figure-latex/unnamed-chunk-1-1.pdf)<!-- --> 
