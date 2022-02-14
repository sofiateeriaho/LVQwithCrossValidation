filename = 'lvqdata.csv';
file = load(filename);

Column1 = file(:,1);
Column2 = file(:,2);
Row1 = file(1,:);

% The dimension of input vectors
dim = length(Row1);

% The number of examples
size = length(Column1);

% Create new column with 50x 0s and 50x 1s (for class representation)
v = [0 1];
u = repelem(v,50)';

% Create new table
newTable = table(Column1, Column2, u);

% From table to matrix
data = newTable{:,:};

% Shuffle dataset
newData = shuffle(data);

train_means = [];
test_means = [];
train_stds = [];
test_stds = [];

k = 10;

for k = 1:k
    
    [mean_train, mean_test, train_std, test_std] = split(size, newData, k);
    
    train_means(end+1) = mean_train;
    train_stds(end+1) = train_std;
    
    test_means(end+1) = mean_test;
    test_stds(end+1) = test_std;
    
end

x = 1:1:k;

errorbar(x,train_means, train_stds, 'b', 'LineWidth',1.2, 'DisplayName', 'Training errors')
hold on;

errorbar(x,test_means, test_stds, 'r', 'LineWidth',0.8, 'DisplayName', 'Validation errors')

ylabel('Error percentage')
xlabel('K number of protoypes')
title('Training and validation error as a function of K');
legend()

hold off
