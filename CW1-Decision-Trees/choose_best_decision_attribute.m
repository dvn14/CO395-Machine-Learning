function [best_attribute] = choose_best_decision_attribute(examples,attributes,binary_targets)

[~,n] = size(attributes);
highest_gain = 0;
best_attribute = [];

for i = 1:1:n
    subset0 = find(examples(:,attributes(i)) == 0);
    [s0,~] = size(subset0);
    subset1 = find(examples(:,attributes(i)) == 1);
    [s1,~] = size(subset1);
    [total, ~] = size(binary_targets);
    
    gain = get_entropy(binary_targets) - (s0/total)*get_entropy(binary_targets(subset0)) - (s1/total)*get_entropy(binary_targets(subset1));
    if gain > highest_gain
        highest_gain = gain;
        best_attribute = attributes(i);
    end
end