# An Activity Recognition framework on Matlab

In this framework, two supervised learning methods were implemented that would classify different activites, whose data is provided in the .mat file. The classification performance of the two methods are given as:

| Method | Accuracy | Time |
|:-------|:-------:|:-------:|
| Naive Bayes| 97.5% | 15s |
| k-Nearest Neighbor | 98.5% | 115s|

To be updated...

## Description

The detailed description of the task is given in the project description file. 

In the data, there are five action classes that needs to be classified. For the classification task, two models were trained in the corresponding .m files. Then, these models were tested using the testing function.The final results were reported using a k-fold crossvalidation on the given training data. No access was available to the real testing data, which was used on the model after it was submitted.

## Dependedcies

-Matlab

This project doesnt require any external software or libraries.
