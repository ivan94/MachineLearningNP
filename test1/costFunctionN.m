function J = costFunctionN(X, y, theta,n)
%   J = costFunction(X, y, theta1,theta2) computes the cost of using theta as the
%   parameter for linear regression to fit the data points in X and y

m = length(y); % number of training examples

J = 0;

% Compute the cost of a particular choice of theta
s=0;
for i=1:m
	t_aux = 0;
	for j=1:n
		if(j==1)
			t_aux = theta(j,1);
		else
			t_aux = t_aux+theta(j,1)*X(i,j-1);
		end
	end
	s = s+(t_aux-y(i,1))^2;
end
J=s/(2*m);

% =========================================================================

end
