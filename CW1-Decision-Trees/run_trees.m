function run_trees(strategy, dataset)
% USAGE: 
% strategy - 1 = random, 2 = min depth, 3 = max depth
% dataset - 1 = clean, 2 = noisy

%load our data
if dataset == 2
A = load('noisydata_students.mat');
else
A = load('cleandata_students.mat');
end

all_exs = A.x;
all_tgts = A.y;

total_size = numel(all_tgts);

%partition into 10 parts
[e1, e2, e3, e4, e5, e6, e7, e8, e9, e10] = partition(all_exs);
[t1, t2, t3, t4, t5, t6, t7, t8, t9, t10] = partition(all_tgts);

%generate the folds
[examples, targets, test_examples] = fold(e1, e2, e3, e4, e5, e6, e7, e8, e9, e10, t1, t2, t3, t4, t5, t6, t7, t8, t9, t10);

predict_tgt = [];

%for each fold, run learning and test the trees
for i=1:1:10  
    %learning
    trees{i} = decision_tree(examples{i}, targets{i});
    %generate predictions for 1 fold (100 examples)
    preds = testTrees(trees{i}, test_examples{i}, strategy);
    %generate the entire prediction vector (1000 examples)
    predict_tgt = [predict_tgt; preds];
end

%calculate the confusion and evaluation matrices
conf = confusion_matrix(all_tgts, predict_tgt);
disp(conf)
disp(evaluation_matrix(conf))
end