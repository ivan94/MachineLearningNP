function [J_h, t_h] = gradientDescendMultivariate(x,y,t,n,alpha,maxIter)
   m=length(y);
   J_h = zeros(maxIter,1);%Initialize J_h with zeros- J_h is 1500 x 1 if maxIter is 1500
   t_h = zeros(maxIter,n);
   for i=1:n
	t_h(1,i) = t(i,1);
   end
   stp = 100/maxIter;
   progress = 0;
   pc = 0;
   J_h(1,1)=costFunctionN(x,y,t,n);
   for j=2:maxIter
          s=zeros(n,1);
   	  for i=1:m
		for k=1:n
			t_aux = 0;
			for l=1:n
				if(l==1)
					t_aux = t(l,1);
				else
					t_aux = t_aux+t(l,1)*x(i,l-1);
				end
			end
			if(k==1)
				s(k,1) = s(k,1)+(t_aux-y(i,1));
			else
				s(k,1) = s(k,1)+(t_aux-y(i,1))*x(i,k-1);
			end
		end
   	  end
	  for i=1:n
		t(i,1) = t(i,1)-alpha/m*s(i,1);
		t_h(j,i) = t(i,1);
	  end
   	  % Compute costFunction for this t0 and t1 and store in the appropriate place in J_h
   	  J_h(j,1)=costFunctionN(x,y,t,n);
	  progress = progress +stp;
	  pc = pc + 1;
          if(pc >= 1/stp)
	  	printf('%f\n',progress);
	  	fflush(stdout);
		pc = 0;
	  end
    end
end




