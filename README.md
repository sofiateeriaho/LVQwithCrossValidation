University course assignment to model **5-fold cross validation** using the supervised classification algorithm LVQ in Matlab

[`lvqdata.csv`](lvqdata.csv) is the dataset used, containing 100 two-dimensional feature vectors, 50% belonging to class 1 and 50% to class 2.

The algorithm uses LVQ to optimise the positions of k randomly initialized prototypes. Each prototype or set of prototypes per class is trained for up to 100 epochs. In order to evaluate learning performance M-fold cross validation is used. This is a resampling procedure that splits our given data into training and testing data. The model’s performance is evaluated on an error metric which determines the accuracy of the model. In order to avoid a big difference among accuracy of test and training data, the data is split into folds, in this case it is split into 5 folds, and each time the data is split we ensure that a different fold is used as testing data.
