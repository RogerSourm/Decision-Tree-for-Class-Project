### If you need to install the required libraries,
### remove the `#` before `install.packages(...)`:
#install.packages("rpart") # For decision tree model.
#install.packages("rpart.plot") # For plotting the decision tree.
#install.packages("dplyr") # For looking into the data set.


# Load the required libraries.
library(rpart)
library(rpart.plot)
library(dplyr)


# Using the built-in `iris` data set.
# Taking a look at the data set.
glimpse(iris)


# Cross-validation.
n <- NROW(iris)

set.seed(777) # For reproducibility purposes.
index <- sample(1:n, n*0.8)
training_set <- iris[index, ]
test_set <- iris[-index, ]


# Fitting the decision tree model on the training set.
# We want to build the model for species classification.
tree1 <- rpart(Species ~ ., data = training_set)


# Making predictions using the test set.
prediction1 <- predict(tree1, newdata = test_set, type = "class")


# Checking for prediction accuracy.
cm <- table(Prediction = prediction1,
            Actual = test_set$Species)
addmargins(cm)
# Accuracy: (12 + 5 + 12) / 30 = 0.9666667.


# Decision tree plot.
rpart.plot(tree1, type = 5)
