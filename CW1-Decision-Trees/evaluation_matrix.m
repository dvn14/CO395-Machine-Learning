function T = evaluation_matrix(C)

eval = zeros(5,7);
%                      |_________class_________|___|
%______________________|_1_|_2_|_3_|_4_|_5_|_6_|ACR|
%(row1)Recall rate     |   |   |   |   |   |   |NaN|
%(row2)Precision rate  |   |   |   |   |   |   |NaN|
%(row3)F1 measure      |   |   |   |   |   |   |NaN|
%(row4)CR              |   |   |   |   |   |   |NaN|   
%(row5)Average CR      |NaN|NaN|NaN|NaN|NaN|NaN|   |
%---------------------------------------------------

Total = sum(sum(C));

for i=1:1:6
   TP = C(i,i);
   FN = sum(C(i,:)) - C(i,i);
   FP = sum(C(:,i)) - C(i,i);
   TN = Total - TP - FN - FP;
   
   %recall rate
   Rr = (TP/(TP+FN))*100;
   eval(1,i) = Rr;
   %precision rate
   Pr = (TP/(TP+FP))*100;
   eval(2,i) = Pr;
   %F1 measure
   eval(3,i) = 2*(Pr*Rr)/(Pr+Rr);
   %CR
   eval(4,i) = 100*(TP+TN)/Total;
   eval(5,i) = NaN;
end

eval(:,7) = NaN;
eval(5,7) = mean(eval(4,1:6));

colNames = {'Class_1','Class_2','Class_3','Class_4','Class_5','Class_6','Average_CR'};
rowNames = {'Recall Rate','Precision Rate','F1 Measure','CR','Average CR'};
T = array2table(eval,'RowNames',rowNames,'VariableNames',colNames);

end
