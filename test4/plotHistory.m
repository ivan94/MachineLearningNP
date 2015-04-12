function scatterPlot(X, idx)
 %X is a m x 2 matrix of data points in 2D
 %idx is an index assigning each point in X to a cluster
 K=length(unique(idx)); % Number of clusters
 palette = hsv(K + 1); % a color palette using the hsv() function
 colors = palette(idx, :); % same color for data associated with the same idx value
 scatter(X(:,1), X(:,2), 15, colors);
end

function rv=plotHistory(X, v, vH, idx)
 % X is the sample data
 % v is the final centroids
 % vH is the history of centroids
 % idx is the index of cluster assignments to data points
 % note that v, vH, idx are returned by a call to kMeansHistory()
 K=length(unique(idx)); % Number of clusters
 n=size(vH,1);
 figure;hold on;scatterPlot(X,idx);
 plot(v(:,1),v(:,2),'ro','markerfacecolor','r', 'markersize',10);
 %% YOUR CODE below
 K=length(unique(idx));
 for i=1:K
  plot(vH(i:3:end,1),vH(i:3:end,2),'ro','markerfacecolor','r', 'markersize',5);
  plot(vH(i:3:end,1),vH(i:3:end,2),'-bo', 'markersize',5);
 end
 % % parse vH, and take apart the movement of each cluster centroid through the iterations
end
