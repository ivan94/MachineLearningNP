raw_data = csvread('wine.csv');
training_set = raw_data(2:1281,:);
test_set = raw_data(1282:end,:);

X = [training_set(:,1) training_set(:,7)];
y = training_set(:,9);
[J_M1, t_M1] = gradientDescendMultivariate(X,y,[1;0.5;0.5],3,0.01,2000);

X = [training_set(:,3) training_set(:,6)];

[J_M2, t_M2] = gradientDescendMultivariate(X,y,[1;0.5;0.5],3,0.01,2000);

tstx_M1 = [test_set(:,1) test_set(:,7)];
tstx_M2 = [test_set(:,3) test_set(:,6)];
tsty = test_set(:,9);

costM1 = costFunctionN(tstx_M1, tsty, [t_M1(end,1);t_M1(end,2);t_M1(end,3)], 3);
costM2 = costFunctionN(tstx_M2, tsty, [t_M2(end,1);t_M2(end,2);t_M2(end,3)], 3);

plot(J_M1,'rx');
figure;
plot(J_M2,'rx');

printf("Model 1 cost: %f\nModel 2 cost: %f\n",costM1,costM2);
