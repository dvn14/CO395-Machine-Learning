% load MNIST data
load('data4students.mat')

% training inputs
train_x = double(datasetInputs{1,1});
% training targets
train_y = double(datasetTargets{1,1});

% test inputs
test_x = double(datasetInputs{1,2});
% test targets
test_y = double(datasetTargets{1,2});

% validation inputs
val_x = double(datasetInputs{1,3});
% validation targets
val_y = double(datasetTargets{1,3});

inputSize = size(train_x,2);
outputSize = size(train_y,2); % in case of classification it should be equal to the number of classes

hiddenActivationFunctions = {'ReLu','ReLu','ReLu','softmax'};
hiddenLayers = [500 500 1000 outputSize]; 

% parameters used for visualisation of first layer weights
visParams.noExamplesPerSubplot = 1; % number of images to show per row
visParams.noSubplots = floor(hiddenLayers(1) / visParams.noExamplesPerSubplot);
visParams.col = 30;% number of image columns
visParams.row = 30;% number of image rows 

inputActivationFunction = 'linear'; %sigm for binary inputs, linear for continuous input

% normalise data
% we assume that data are images so each image is z-normalised. If other
% types of data are used then each feature should be z-normalised on the
% training set and then mean and standard deviation should be applied to
% validation and test sets.
train_x = normaliseData(inputActivationFunction, train_x, []);
val_x = normaliseData(inputActivationFunction, val_x, []);
test_x = normaliseData(inputActivationFunction, test_x, []);

%initialise NN params
nn = paramsNNinit(hiddenLayers, hiddenActivationFunctions);

% Set some NN params
%-----
nn.batchsize = 80;
nn.epochs = 20;

% set initial learning rate
nn.trParams.lrParams.initialLR = 0.001;
% set the threshold after which the learning rate will decrease (if type
% = 1 or 2)
nn.trParams.lrParams.lrEpochThres = 10;
% set the learning rate update policy (check manual)
% 1 = initialLR*lrEpochThres / max(lrEpochThres, T), 2 = scaling, 3 = lr / (1 + currentEpoch/lrEpochThres)
nn.trParams.lrParams.schedulingType = 1;

nn.trParams.momParams.schedulingType = 1;
%set the epoch where the learning will begin to increase
nn.trParams.momParams.momentumEpochLowerThres = 10;
%set the epoch where the learning will reach its final value (usually 0.9)
nn.trParams.momParams.momentumEpochUpperThres = 15;

% set weight constraints
nn.weightConstraints.weightPenaltyL1 = 0;
nn.weightConstraints.weightPenaltyL2 = 0;
nn.weightConstraints.maxNormConstraint = 4;

% show diagnostics to monnitor training  
nn.diagnostics = 1;
% show diagnostics every "showDiagnostics" epochs
nn.showDiagnostics = 5;

% show training and validation loss plot
nn.showPlot = 1;

% use bernoulli dropout
nn.dropoutParams.dropoutType = 0;

% if 1 then early stopping is used
nn.earlyStopping = 0;
nn.max_fail = 10;

nn.type = 2;

% set the type of weight initialisation (check manual for details)
nn.weightInitParams.type = 8;
nn.weightInitParams.sigma            = 0.1;  % st. dev. of gaussian used to initialse weights, applies to type 1 only
nn.weightInitParams.mean             = 0;    % mean of gaussian used to initialse weights, applies to type 1 only  
nn.weightInitParams.sparsity         = 0.8;  % number of neurons initialised to 0

% set training method
% 1: SGD, 2: SGD with momentum, 3: SGD with nesterov momentum, 4: Adagrad, 5: Adadelta,
% 6: RMSprop, 7: Adam
nn.trainingMethod = 2;
%-----------

% initialise weights
[W, biases] = initWeights(inputSize, nn.weightInitParams, hiddenLayers, hiddenActivationFunctions);

nn.W = W;
nn.biases = biases;

% if dropout is used then use max-norm constraint and a
%high learning rate + momentum with scheduling
% see the function below for suggested values
% nn = useSomeDefaultNNparams(nn);

[nn, Lbatch, L_train, L_val, clsfError_train, clsfError_val]  = trainNN(nn, train_x, train_y, val_x, val_y);

nn = prepareNet4Testing(nn);

% RESULTS LOGGING
dir = 'results/';
timestamp = datestr(now, 'dd-mm-yy_HH-MM-SS-FFF');
% visualise loss per epoch
figure()
hold on
p1 = plot(L_train, 'b-', 'Markersize', 8);
p2 = plot(L_val, 'r-', 'Markersize', 8);
xlabel('epoch')
ylabel('loss')
legend([p1,p2], {'Training','Validation'},'Location','NorthEast')
hold off
% save figure
saveas(gca, strcat(dir, timestamp, '_loss.png'))

% visualise classification error per epoch
figure()
hold on
p1 = plot(clsfError_train, 'b-', 'Markersize', 8);
p2 = plot(clsfError_val, 'r-', 'Markersize', 8);
xlabel('epoch')
ylabel('classification error (%)')
legend([p1,p2], {'Training','Validation'},'Location','NorthEast')
hold off
% save figure
saveas(gca, strcat(dir, timestamp, '_clasfError.png'))

% visualise weights of first layer
figure()
visualiseHiddenLayerWeights(nn.W{1},visParams.col,visParams.row,visParams.noSubplots);
[stats, output, e, L] = evaluateNNperformance( nn, test_x, test_y);

% save nn hyperparameters in text file
% format: ID, nw arch, epochs, initialLR, lrEpochThres, lrShedulingType,
%         momShedulingType, momEpochLowerThres, momEpochUpperThres,
%         dropoutType, earlyStopping, max_fail
fileID = fopen(strcat(dir, 'results.txt'),'a');
fprintf(fileID, '%21s | ', timestamp);
fprintf(fileID, '%10.4f | ', stats.clsfRate);
fprintf(fileID, strcat(repmat('%5d ', 1, length(nn.layersSize)), ' | '), nn.layersSize);
fprintf(fileID, '%6d | ', nn.epochs);
fprintf(fileID, '%10.3f | ', nn.trParams.lrParams.initialLR);
fprintf(fileID, '%7d | ', nn.trParams.lrParams.lrEpochThres);
fprintf(fileID, '%6d | ', nn.trParams.lrParams.schedulingType);
fprintf(fileID, '%5d | ', nn.trParams.momParams.schedulingType);
fprintf(fileID, '%6d | ', nn.trParams.momParams.momentumEpochLowerThres);
fprintf(fileID, '%6d | ', nn.trParams.momParams.momentumEpochUpperThres);
fprintf(fileID, '%6d | ', nn.dropoutParams.dropoutType);
fprintf(fileID, '%5d | ', nn.earlyStopping);
fprintf(fileID, '%6d | ', nn.max_fail);
fprintf(fileID, '%6d',    nn.weightInitParams.type);
fprintf(fileID, '\n');
fclose(fileID);
