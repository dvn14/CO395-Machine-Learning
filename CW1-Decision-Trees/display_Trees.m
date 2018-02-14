function display_Trees()

% Load clean dataset
A = load('cleandata_students.mat');
examples = A.x;
targets = A.y;

% Generate decision trees
trees = decision_tree(examples, targets);

% Save to .mat file
save('trees.mat','trees')

% Display all 6 trees
for i=1:6
   drawtree(trees(i)) 
end