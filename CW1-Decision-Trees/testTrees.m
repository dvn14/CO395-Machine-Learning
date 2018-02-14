function predictions = testTrees(T,x2, strategy)
%USAGE: T - decision tree, x2 - examples to test, 
% strategy - 1 = random, 2 = min depth, 3 = max depth

predict_tgt = [];

[test_rows, ~] = size(x2);
    %preallocate the prediction vector
    
    % for each row in examples, classify the example using the tree
    for r=1:test_rows
        
        % test for each of the 6 emotions
        bin_test = [];
        bin_depth = [];
        for e=1:1:6
            
            %call classification function
            [class_result, depth] = get_class(T(e), x2(r:r,:), 0); 
            
            %add to array of solutions if found something
            if class_result
                bin_test = [bin_test, e];
                bin_depth = [bin_depth, depth];
            end
        end

        %check how many solutions we have
        sols_found = numel(bin_test);
        
        %ideal scenario - we are sure an example is emotion e
        if (sols_found == 1)
            predict_tgt = [predict_tgt; bin_test(1)];
            
        %non-ideal scenario - we need to pick one of the possible options
        elseif (sols_found > 1)
            %Strategy 1 - random
            if (strategy == 1)
                guess = randi([1 sols_found]);
                predict_tgt = [predict_tgt; bin_test(guess)];
            %Strategy 2 - pick node that had the minimum depth
            elseif (strategy == 2)
                best_d = 999;
                for j=1:numel(bin_depth)
                    if bin_depth(j) < best_d
                        best_d = bin_depth(j);
                        best_j = j;
                    end
                end
                predict_tgt = [predict_tgt; bin_test(best_j)];
            %Strategy 3 - pick node that had the maximum depth
            elseif (strategy == 3)
                best_d = 0;
                for j=1:numel(bin_depth)
                    if bin_depth(j) > best_d
                        best_d = bin_depth(j);
                        best_j = j;
                    end
                end
                predict_tgt = [predict_tgt; bin_test(best_j)]; 
            end
            
            else
            %What do we do if we don't find a solution?
            %For now we just guess..
            
            guess = randi([1 6]);
            predict_tgt = [predict_tgt; guess];
            %fprintf("No solutions found for fold %i example %i.\n", i, r)
        end
    end
    predictions = predict_tgt;
end

