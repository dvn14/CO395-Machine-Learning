function C = confusion_matrix(actual,predicted)
    % Input should be vectors containing all values from all 10 folds

    % Matlab built-in function:
    %C = confusionmat(actual,predicted);
    
    % Ben implementation, tested against Matlab function
    C = zeros(6,6);
    
    for i = 1:length(actual)
        if ~isnan(predicted(i))
            C(actual(i),predicted(i)) = C(actual(i),predicted(i)) + 1;
        end
    end
    
    % Divides by number of folds to get average confusion matrix
    C = C./10;
    