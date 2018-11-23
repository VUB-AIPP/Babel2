# Assignment 3: The Grounded Guessing Game

## Description

In this assignment, you have to implement a Grounded Guessing Game as explained in class and in Chapter 9 of Loetzsch (2014). We will again focus on **single words for single categories**. Furthermore, the agents will observe the scene from the same perspective, so there is no perceptual deviation. You can earn **bonus points** when implementing the game with perceptual deviation (see later).

To represent the agent's categories, you can choose one of the representations used in the book: discrimination trees or prototypes. **Motivate this decision in your report.** 

The starter code will contain a dataset of scenes, captured using the QRIO robot. To load these scenes, you can make use of the `physical-robot-world` package, which you can find in the `Babel2/sharing` directory. The package contains a README file on how to use it.

As with the previous assignments, you need to experiment with different parameters. In your code, you should be able to easily play around with the following parameters using configurations:

 - Number of agents in the population
 - Number of objects in the context (random, fixed or increasing over time)
 - Parameter(s) of the lateral inhibition alignment strategy
 - Parameter(s) of the category shift (we call this $\alpha$), when using prototypes
 - Parameter(s) of the decision tree

You should graphically measure the following:

 - Discriminative success
 - Communicative success
 - Communicative success given discriminative success
 - Ontology size
 - Lexicon size
 - Lexicon coherence
 - Frequency of lexicon change
 - Number of forms per meaning
 - Number of meanings per form
 - Form competition for a single meaning
 - Meaning competition for a single form

### Bonus Points

You can earn bonus points by implementing perceptual deviation. If you decide to implement this, make sure that it is easy to switch on and off by using a configuration of the experiment. Describe the effects of perceptual deviation in your report.

## Technical

Your implementation should be written in Common Lisp as it is defined in the Hyperspec. Additionally, you will use the Babel2 multi-agent experiment framework. A manual about the Babel2 framework is available on Canvas.

Each student will have their own private Git repository, through GitHub Classroom. You can commit and push your changes to this repository anytime you want. Use proper version control standards, such as descriptive commit messages. The last commit before the deadline counts as the final version of your assignment.

_Tip:_ Check out the Lisp style guide on Canvas, under 'Pages'.

## Report

Write a short paper (max. 5 pages) that adheres to academic standards. In other words, it should contain an abstract, an introduction, a conclusion and proper references. Explain in your own words what a Grounded Guessing Game is. Highlight the most important features of the strategies you experimented with. Describe your experiments and interpret their results through the graphs that you created. When creating graphs, make sure to use the appropriate x-axis: total number of interactions or interactions per agent. **Add this report, in .pdf format, to the root of your Git repository.**

_Tip:_ Check out the document on academic writing on Canvas, under 'Pages'.

## Evaluation

The following criteria will be used to grade your assignment:

 - Do the agents reach full communicative success (100%)?
 - Is the lexicon size optimised?
 - Is the code conform to a good programming style?
 - Does the report conform to academic standards?

Note that this is an **individual** assignment. Cooperation is not allowed. Any form of code reuse without citing the source and any form of code exchange between students will be considered plagiarism. This will be santioned according to the rules of the exam commission.

## Questions

General questions concerning the Grounded Guessing Game, Common Lisp, Emacs or the use of the Babel2 framework can be posted on the **Canvas discussion forum**. We urge you to post your questions there such that all students have access to the same information. If you have any other questions, please send us an email **through Canvas.**

## Deadline

**Friday December 14th 2018, noon**