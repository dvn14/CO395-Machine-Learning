% Setting 1 : 50 epochs, lr:0.05(scalling:0.99)
L2coef1  = [0.05,   0.01,   0.009,  0.008,  0.007,  0.006,  0.005,  0.004,  0.003,  0.002,  0.001,  0.0009, 0.0005, 0.0001, 0.00001]; % 0.1,    0.09,   
ValErr1  = [65.42,  59.43,  57.79,  57.76,  57.65,  57.51,  57.59,  57.01,  56.59,  56.87,  57.37,  58.51,  56.59,  59.49,  59.24]; % 75.06,  73.42,  
TestCR1  = [33.88,  42.32,  42.24,  42.88,  42.83,  42.35,  42.80,  43.61,  42.88,  43.05,  41.93,  41.57,  41.77,  41.91,  40.21]; % 24.49,  25.41,  

% Setting 2 : 50 epochs, lr:0.05
L2coef2  = [0.0001, 0.001,  0.003,  0.005,  0.008,  0.01,   0.03,   0.05,   0.08,   0.1]; % ,    0.3,    0.5,    0.8
ValErr2  = [58.15,  58.37,  56.90,  57.15,  59.26,  59.04,  62.50,  65.39,  69.57,  75.06]; % ,  75.06,  75.06,  75.06
TestCR2  = [41.40,  42.80,  43.74,  42.49,  41.04,  40.51,  37.31,  34.66,  30.09,  24.49]; % ,  24.49,  24.49,  24.49

% Setting 3 : 50 epochs, lr:0.0125(scalling:0.85)
L2coef3  = [0.0001, 0.001,  0.003,  0.005,  0.008,  0.01,   0.03,   0.05,   0.08,   0.1]; % ,    0.3,    0.5,    0.8
ValErr3  = [59.18,  58.34,  57.54,  58.21,  57.29,  57.59,  61.94,  63.11,  68.65,  72.22]; % ,  75.06,  75.06,  75.06
TestCR3  = [42.02,  41.85,  42.44,  42.96,  43.35,  42.57,  38.92,  36.33,  30.70,  26.89]; % ,  24.49,  24.49,  24.49

% Setting 1 
dir = 'results/';
timestamp = datestr(now, 'dd-mm-yy_HH-MM-SS-FFF');
% visualise loss per epoch
figure()
hold on
p1 = semilogx(L2coef1,TestCR1, 'b-', 'Markersize', 8);
p2 = semilogx(L2coef1,ValErr1, 'r-', 'Markersize', 8);
title('L2 Regularisation, 50 epochs, lr:0.05(scalling:0.99)')
xlabel('L2 coefficient')
ylabel('(%)')
legend([p1,p2], {'TestCR','ValidationError'},'Location','East')
hold off
% save figure
saveas(gca, strcat(dir, timestamp, '_L2_setting_1.png'))

% Setting 2
% visualise loss per epoch
figure()
hold on
p1 = semilogx(L2coef2,TestCR2, 'b-', 'Markersize', 8);
p2 = semilogx(L2coef2,ValErr2, 'r-', 'Markersize', 8);
title('L2 Regularisation, 50 epochs, lr:0.05')
xlabel('L2 coefficient')
ylabel('(%)')
legend([p1,p2], {'TestCR','ValidationError'},'Location','East')
hold off
% save figure
saveas(gca, strcat(dir, timestamp, '_L2_setting_2.png'))

% Setting 3
% visualise loss per epoch
figure()
hold on
p1 = semilogx(L2coef3,TestCR3, 'b-', 'Markersize', 8);
p2 = semilogx(L2coef3,ValErr3, 'r-', 'Markersize', 8);
title('L2 Regularisation, 50 epochs, lr:0.0125(scalling:0.85)')
xlabel('L2 coefficient')
ylabel('(%)')
legend([p1,p2], {'TestCR','ValidationError'},'Location','East')
hold off
% save figure
saveas(gca, strcat(dir, timestamp, '_L2_setting_3.png'))