# Assignment 1: The Basic Naming Game

## Description

In this assignment, you have to implement a basic Naming Game as explained in class. We first give a short summary of the basic Naming Game.

In the basic Naming Game, the world can be implemented as a list of symbols, e.g. `obj-1`. The context is a random subset of the world. The population is a list of agents. An agent should be able to build up and maintain a lexicon of names for the symbols of the world. Agents need to be able to pick a random topic from the context and they can point to the topic. Pointing, in this context, means to transfer the chosen symbol from speaker agent to hearer agent. A word in the lexicon always consists of two sides: a meaning (in this case a symbol) and a form (in this case a random string). A word also has a score. The endpoint of your experiment should be a population of agents with a shared lexicon of minimal size (i.e. without synonymy). So, if there are $N$ objects (symbols) in the world, the population should converge to a shared lexicon of $N$ names.

You will experiment with different parameters and alignment strategies as explained in class. Implement the **lateral inhibition** strategy and **at least one other** alignment strategy. 

In your experiment, you should be able to easily play around with the following parameters:

 - Number of agents in the population
 - Number of objects in the world
 - The alignment strategy
 - Parameters of the chosen alignment strategies, e.g. increment/decrement of scores for lateral inhibition.

You should graphically measure (at least) the following:

 - Communicative success
 - Average lexicon size
 - Average lexicon coherence

Optionally, you can define additional measures:

 - Frequency of lexicon change
 - Average number of forms per meaning
 - Average meaning-form competition

## Technical

Your implementation should be written in Common Lisp as it is defined in the Hyperspec. Additionally, you will use the Babel2 multi-agent experiment framework. A manual about the Babel2 framework will be made available on Canvas.

Each student will have their own private Git repository, through GitHub Classroom. Starter code for the basic Naming Game will be provided in this repository. You can commit and push your changes to this repository anytime you want. Use proper version control standards, such as descriptive commit messages. The last commit before the deadline counts as the final version of your assignment.

## Report

Write a short paper (max. 5 pages) that adheres to academic standards. In other words, it should contain an abstract, an introduction, a conclusion and references. Explain in your own words what a Naming Game is. Highlight the most important features of the strategies you experimented with. Describe your experiments and their results through the graphs that you created.

Add this report, in .pdf format, to your Git repository.

## Evaluation

The following criteria will be used to grade your assignment:

 - Do the agents reach full communicative success (100%)?
 - Is the lexicon size optimised?
 - Is the code conform to a good programming style?
 - Does the report conform to academic standards?

Note that this is an **individual** assignment. Any form of plagiarism will result in a score of 0.

## Questions

General questions concerning the basic Naming Game, Common Lisp, Emacs or the use of the Babel2 framework can be posted on the **Canvas discussion forum**. We urge you to post your questions there such that all students have access to the same information. If you have any other questions, please send us an email **through Canvas.**

## Deadline

**Friday October 19th 2018, 12pm (noon)**