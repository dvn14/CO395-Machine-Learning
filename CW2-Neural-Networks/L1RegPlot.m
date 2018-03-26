% Setting 1 : 50 epochs, lr:0.05(scalling:0.99) 
L1coef1  = [0.001,  0.0009, 0.0005, 0.0003, 0.0001, 0.00008,0.00005,0.00003,0.00001];%0.008,  0.007,  0.006,  0.005,  0.004,  0.003,  0.002,  
ValErr1  = [64.89,  63.05,  62.39,  59.93,  58.04,  58.54,  58.65,  56.67,  57.43]; %75.06,  75.06,  75.06,  75.06,  75.06,  75.06,  75.06,  
TestCR1  = [35.41,  36.83,  37.45,  41.13,  42.96,  41.85,  42.10,  42.99,  42.05]; %24.49,  24.49,  24.49,  24.49,  24.49,  24.49,  24.49,  

% Setting 2 : 50 epochs, lr:0.05
L1coef2  = [0.00001,0.00003,0.00005,0.00008,0.0001, 0.0003, 0.0005, 0.0008, 0.001]; %,  0.003,  0.005,  0.008
ValErr2  = [56.76,  56.56,  56.48,  56.92,  57.29,  57.73,  62.50,  63.03,  64.31]; %,  75.06,  75.06,  75.06
TestCR2  = [42.77,  41.82,  43.10,  42.91,  42.10,  42.44,  38.40,  36.58,  35.50]; %,  24.49,  24.49,  24.49

% Setting 3 : 50 epochs, lr:0.0125(scalling:0.85)
L1coef3  = [0.00001,0.00003,0.00005,0.00008,0.0001, 0.0003, 0.0005, 0.0008, 0.001]; %,  0.003,  0.005,  0.008
ValErr3  = [58.26,  58.93,  57.98,  58.46,  57.82,  57.93,  58.54,  61.77,  62.89]; %,  68.93,  75.06,  75.06
TestCR3  = [41.66,  41.82,  42.91,  42.88,  41.54,  42.55,  42.16,  39.68,  37.61]; %,  29.95,  24.49,  24.49

% Setting 1 
dir = 'results/';
timestamp = datestr(now, 'dd-mm-yy_HH-MM-SS-FFF');
% visualise loss per epoch
figure()
hold on
p1 = semilogx(L1coef1,TestCR1, 'b-', 'Markersize', 8);
p2 = semilogx(L1coef1,ValErr1, 'r-', 'Markersize', 8);
title('L1 Regularisation, 50 epochs, lr:0.05(scalling:0.99)')
xlabel('L1 coefficient')
ylabel('(%)')
legend([p1,p2], {'TestCR','ValidationError'},'Location','East')
hold off
% save figure
saveas(gca, strcat(dir, timestamp, '_L1_setting_1.png'))

% Setting 2
% visualise loss per epoch
figure()
hold on
p1 = semilogx(L1coef2,TestCR2, 'b-', 'Markersize', 8);
p2 = semilogx(L1coef2,ValErr2, 'r-', 'Markersize', 8);
title('L1 Regularisation, 50 epochs, lr:0.05')
xlabel('L1 coefficient')
ylabel('(%)')
legend([p1,p2], {'TestCR','ValidationError'},'Location','East')
hold off
% save figure
saveas(gca, strcat(dir, timestamp, '_L1_setting_2.png'))

% Setting 3
% visualise loss per epoch
figure()
hold on
p1 = semilogx(L1coef3,TestCR3, 'b-', 'Markersize', 8);
p2 = semilogx(L1coef3,ValErr3, 'r-', 'Markersize', 8);
title('L1 Regularisation, 50 epochs, lr:0.0125(scalling:0.85)')
xlabel('L1 coefficient')
ylabel('(%)')
legend([p1,p2], {'TestCR','ValidationError'},'Location','East')
hold off
% save figure
saveas(gca, strcat(dir, timestamp, '_L1_setting_3.png'))