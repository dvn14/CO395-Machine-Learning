function run_with_params
    
    % NW Architecture
    hiddenLayers = [750 750 500 7];
    hiddenActivationFunctions = {'sigm','sigm','sigm', 'softmax'};
    
    % Epochs
    epoch = 50;
    
    % Learning Rate Params
    initialLR = 0.05;
    lrEpochThres = 1;
    lrSchedulingType = 2; % 1 = decrease after lrEpochThres, 2 = scaling, 3 = decrease until half at lrEpochThres
    lrScalingFactor = 0.995; % scaling factor per epoch for lrSchedulingType = 2
    
    % Momentum Params
    momentumEpochLowerThres = 1;
    momentumEpochUpperThres = 2;
    
    % Weight Initialisation Method
    weightInit = 3;
    
    % Weight Regularisation
    L2  = 0; % L2 regularisation coefficient
    L1  = 0; % L1 regularisation coefficient
    maxNorm = 0; % maximum norm allowed, if 0 then it's disabled
    
    % Dropout Params
    dropoutType = 1; % Enable Dropout
    
    % Stopping Criterion
    earlyStopping = 0; % Enable early stopping
    maxFail = 5; % Max number of validation set increases

    run_train_test(hiddenLayers, epoch, initialLR, lrEpochThres, lrSchedulingType, lrScalingFactor, momentumEpochLowerThres, momentumEpochUpperThres, hiddenActivationFunctions, weightInit, L2, L1, maxNorm, dropoutType, earlyStopping, maxFail);
end
