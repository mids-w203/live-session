# Probability Spaces

Probability is a system of reasoning about the world in the face of incomplete information. In this course, we're going to develop an understanding of the implications of core parts of this theory, how this theory was developed, and how these implications relate to every other part of the practice of data science. 

## Learning Objectives 

At the end of this week's learning, student will be able to: 

1. **Find** and *access* all of the course materials
2. **Develop** a course of study that is builds toward success
3. **Apply** the axioms of probability to make a valid statement
4. **Solve** word problems through the *application* of probability and math rules

## Course Learning Objectives

At the end of this course, students will be able to: 

1. **Understand the building blocks of probability theory that prepare learners for the study of statistical models.** 
    1. Understand the mathematical objects of probability theory and be able to apply their properties.
    2. Understand how high-level concepts from calculus and linear algebra are related to common procedures in data science.
    3. Translate between problems that are defined in business or research terms into problems that can be solved with math. 
2. **Understand and apply statistical models in common situations.**
    1. Understand the theory of statistics to prepare students for inferrential statements.
    2. Understand model parameters and high level strategies to estimate them: means, least squares, and maximum likelihood.
    3. Choose an appropriate statistic, and conduct a hypothesis test in the Neyman-Pearson framework.
    4. Interpret the results of a statistical test, including statistical significance and practical significance.
    5. Recognize limitations of the Neyman-Pearson hypothesis testing framework and be a conscientious participant in the scientific process
3. **Analyze a research question using a linear regression framework.**
    1. Explore and wrangle data with the intention of understanding the information and relationships that are (and are not) present
    2. Identify the goals of your analysis
    3. Build a model that achieves the goals of an analysis
4. **Interpret the results of a model and communicate them in manner appropriate to the audience.**
    1. Identify their audience and report process and findings in a manner appropriate to that audience.
    2. Construct regression oriented reports that provide insight for stakeholders.
    3. Construct technical documents of process and code for collaboration and reproducability with peer data scientists.
    4. Read, understand, and assess the claims that are made in technical, regression oriented reports 
5. **Contribute proficient, basic work, using industry standard tools and coding practices to a modern data science team.**
Demonstrate programming proficiency by translating statistical problems into code.
    1. Understand and incorporate best practices for coding style and data carpentry
    2. Utilize industry standard tooling for collaboration

## Introductions

### Instructor Introductions

The instructors for the course come to the program, and to statistics from different backgrounds. Instructors hold PhDs in statistics, astrophysics, biology, political science, information.  



### What does a statistician look like?

**A statistician looks like YOU!**

Identity shapes how people approach and understand their world. We would like to acknowledge that we have limited diversity of identity among the instructors for this course. 

However, every one of the instructors shares a core identity as an empathetic educator that wants to understand your strengths, areas for growth, and unique point of view that is shaped by who you are. 

- It doesn't matter if you've never taken a stats class before, or if you're reviewing using this class. There will be challenges for everyone to overcome. 
- It doesn't matter how old or young you are. We will all be learning frequentist statistics which is timeless. 
- The color of your skin doesn't matter; nor does whether you identify as a woman or a man or trans or non-binary; neither does your sexual orientation. There are legacies of exclusion and discrimination against people due to these identities. We will not continue to propagate those legacies and instead will work to controvert those discriminations to build a diverse community of learning in line with the University's [Principles of Community](https://diversity.berkeley.edu/principles-community). 

## Student Introductions

Please take 90 seconds to tell us:

- Your name as you would like to be called; 
- Where you dial in from; 
- What brings you to an interest in data science; and, 
- Any other interests, or identities that you would like your classmates and instructor to know about. 

Please, try to keep these intros to just 90 seconds. We've a lot to cover this week! 

## Probability Theory

**Probability** 

Probability is a system of reasoning that we use to model the world under incomplete information. This model underlies virtually *every* other model you'll ever use as a data scientist. 

![picard](./images/picard.jpg)

In this course, probability theory builds out to random variables; when combined with sampling theory we are able to develop p-values (which are also random variables) and an inferential paradigm to communicate what we know and how certain a statement we can make about it. 

In introduction to machine learning, literally the first model that you will train is a naive bayes classifier, which is an application of Bayes' Theorem, trained using an iterative fitting algorithm. Later in machine learning, you'll be fitting non-linear models, but at every point the input data that you are supplying to your models are generated from samples from random variables. That the world can be represented by random variables (which we will cover in the coming weeks) means that you can transform -- squeeze and smush, or stretch and pull -- variables to heighten different aspects of the variables to produce the most useful *information* from your data. 

As you move into NLP, you might think of generative text as a conditional probability problem: given some particular set of words as an input, what is the most likely *next* word or words that someone might type? 

Beyond the direct instrumental value that we see working with probability, there are two additional aims that we have in starting the course in the manner. 

First, because we are starting with the axioms of probability as they apply to data science statistics, students in this course develop a *much* fuller understanding of classical statistics than students in most other programs. Unfortunately, it is very common for students and then professionals to see statistics as a series of rules that have to be followed absolutely and without deviation. In this view of statistics, there are distributions to memorize; there are repeated problems to solve that require the rote application of some algebraic rule (i.e. compute the sample average and standard deviation of some vector); and, there are myriad, byzantine statistical tests to memorize and apply. In this view of statistics, if the real-world problem that comes to you as a data scientist doesn't clearly fit into a box, there's no way to move forward. 

> Statistics like this is not fun. 

In the way that we are approaching this course, we hope that you're able to learn *why* certain distributions (like the normal distribution) arise repeatedly, and why we can use them. We also hope that because you know how sampling theory and random variables combine, that you can be more creative and inventive to solve problems that you haven't seen before. 

The second additional aim that we have for this course is that it can serve as either an introduction or a re-introduction to reading and making arguments using the language of math. For some, this will be a new language; for others, it may have been some years since they have worked with the language; for some, this will feel quite familiar. New algorithms and data science model advancements *nearly always* developed in the math first, and then applied into algorithms second. In our view, being a literate reader of graduate- and professional-level math is a necessary skill for any data scientist that is going to keep astride of the field as it continues to develop and these first weeks of the course are designed to bring everyone back into reading and reasoning in the language.  

## Working with a Sample Space
### Working with a Sample Space, Part I

1. **You roll two six-sided dice**: 
    1. How would you define an appropriate sample space, $\Omega$? 
    2. How many elements exist in $\Omega$? 
    3. What is an appropriate event space, and how many elements does it have?
    4. Give an example of an event.

### Working with a Sample Space, Part II

2. **For a random sample of 1,000 Berkeley students**:   
    1. How would you define an appropriate sample space, $\Omega$? 
    2. How big is $\Omega$? How many elements does it contain? 
    3. What is an example of an event for this scenario?
    4. Can a single person be represented in the space twice? Why or why not? 
    
### Working with a Sample Sapce, Part III

3. **Suppose that you're sitting in a surf lineup, and you have to pick a wave that is the right height. Too small, and you won't get anywhere, too large and you'll get crushed.** 
    1. What sample space is appropriate to represent the height of a single wave, $\Omega$? 
    2. How big is $\Omega$? How many elements does it contain? 
    3. What is an example of an event that could be part of the event space?
    4. What sample space is appropriate to represent the height of the next 10 waves?  How large is this sample space?
    
::: notes
To represent 10 waves, you should use $\mathbb{R}^{10}$.  It is curious mathematical fact that $\mathbb{R}$ and $\mathbb{R}^{10}$ actually have the same cardinality -- there are the same number of elements in each of these sets and there exists a function -- i.e. a one-to-one mapping -- between these sets.
:::
    
    
## Proofs: Style Counts

In each week of a class, you are either caught up or behind.

- The probability that you are caught up in Week 1 is 0.7. 
- If you are caught up in a given week, the probability that you will be caught up in the next week is 0.7. 
- If you are behind in a given week, the probability that you will be caught up in the next week is 0.4. 
- **What is the probability that you are caught up in week 3?**

Identify as many ways to improve this proof as you can:

If you are caught up in a week, there are two possibilities for the previous week: caught up and behind.  Let $P(C)$ be the probability of being caught up.  In week 1, $P(C) = .7$.  The probability of being behind is $P(B) = 1 - .7 = .3$.  We first break down the probability for week 2:

$$P(C) = .7 \cdot .7 + .3 \cdot .4 = .65$$

Now we can repeat the process for week 3:

$$P(C) = .65 * .7 + .35 * .4 = .595$$

## A practice problem 

Let's go and work on a practice problem over on the course practice problem website. 

[link here](https://w203.herokuapp.com/problems/106)

## Concluding Reminders

1. Welcome! 
2. Before next live session: 
    1. Complete the homework that builds on this unit
    2. Complete all videos and reading for unit 2
