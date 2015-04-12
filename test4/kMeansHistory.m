function [v v_hist idx]=kMeansHistory(X, initialCentroids, maxIter)
  %% Assume m data points in R^n, an mxn matrix
  %% Assume initialCentroids are K R^n vectors, a Kxn matrix
  %% Return final centroids, v, of size Kxn and 
  %% idx, the index of each sample data's associated centroid
  %% idx will be m x 1
  [m n]=size(X);
  K=size(initialCentroids,1);
  v=zeros(size(initialCentroids));
  v_hist=[initialCentroids];
  idx_previous=zeros(m,1);
  centroids=initialCentroids;
  for iter=1:maxIter
    idx=[];
    for i=1:m
      currentVector=X(i,:);
      list=[];
      for j=1:K
	d=norm(currentVector-centroids(j,:));
	list=[list d];
      end
      [s, t]=min(list);
      idx=[idx ; t];   
    end
    %If idx_previous is the same as idx, break out of the loop
    if(idx==idx_previous)
      printf("Centroids stopped moving after %d iterations\n",iter);
      break;
    endif
    %% At this point idx has the indices of associations of each 
    %% sample data X to a centroid.
    %% Now we can calculate the new centroids.
    for i=1:K
      temp=find(idx==i);
      centroids(i,:)=mean(X(temp,:),1);
    end
    idx_previous=idx;
    v_hist=[v_hist; centroids];
  end
  v=centroids;
end