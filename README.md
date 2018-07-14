# CO395-Machine-Learning

## Coursework 1: Decision Trees

### Abstract 

This report covers our implementation of decisions trees that determines emotions from input vectors of Action Units. The code was written in MATLAB and evaluation of the performance of our implementation was also done in MATLAB. An analysis is given within, along with some answers to some questions posed in the coursework specification.

### Introduction

Emotion recognition is something most people do effortlessly, our brains can perform this subconsciously. People can usually immediately tell whether the person they see is happy, sad, or angry, yet it is very difficult to make a machine perform the same task. Even with advanced facial feature recognition, standard algorithms are not always up to the task. Machine learning offers a potential solution to this problem, as instead of formulating a complicated computer program, the machine can learn to distinguish different emotions, much like a real person would.

For this task, we were given examples of 6 basic emotions - anger, disgust, fear, happiness, sadness and surprise - and their corresponding facial expressions described using the Facial Action Coding System (FACS). It splits up images of the human face into multiple smaller sections, allowing for easier identification of which muscles, or Action Units, are being used for any given expression. There were around 1000 examples, using which the algorithm would be both taught and evaluated.

### Results

Code Accuracy 	= 73.51%
Overall		= 91%

## Coursework 2: Neural Networks

### Abstract

This report covers our implementation of a neural network trained to classify facial images into one of 7 emotions. The hyperparameter optimisation process is detailed step by step and the performance results of the final network is presented. Finally, the questions given in the coursework specification are answered.

### Introduction

Previously we have used Decision Trees to classify facial expressions into one of 6 basic emotions: anger, disgust, fear, happiness, sadness and surprise. However, the input data given to us was in the form of Action Units (AU), essentially combinations of different active muscles in a face that result in facial expressions that we as humans can perceive as emotions. Whilst trivial for humans, identifying emotions is still quite difficult for computers to do correctly. We found that Decision Trees were good at classifying emotions from arrays of AUs, however this would not be the case in a practical example, such as providing an image of a person's face as input. For this, a more advanced machine learning technique is required, namely 'Neural Networks'.

For this exercise, we were provided 30x30 pixel greyscale images of people's faces, along with the target for that image, which was one of the 6 basic emotions: anger, disgust, fear, happiness, sadness and surprise, as well as a 7th, neutral. We were provided a toolkit for initialising, training and testing a neural network, as well as steps on how to optimise the hyperparameters (which we will simply refer to as parameters for the rest of this report) in order to achieve the highest classification performance when the network was run on the 'unseen' test set given.

### Results

Code Accuracy 	= 49.26%

