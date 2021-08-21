clear all;
close all;
X = load('data3.txt');
scatter(X(:,1),X(:,2));

size = length(X);
hold on;
k = 4; 
C = X(1:k,:);
figure;
scatter(C(:,1),C(:,2))
U = zeros(size,2);
Q = 100;
e = 0.0001;
m = 1;
exit = false;

while exit == false
  for i = 1:size
    d = zeros(k,1);
    for j= 1:k
      d(j) = pdist([C(j,:);X(i,:)],'euclidean');
    end
    [U(i,2), U(i,1)] = min(d);
  end

  Qm = qm_function(U, X);
  if abs(Q-Qm) < e
     exit = true;
     continue
  end
  Q = Qm;

  C = zeros(k,2);
  razm = zeros(4,1);
  for i = 1:size
    C(U(i,1),:) = C(U(i,1),:) + X(i,:);
    razm(U(i,1)) = razm(U(i,1))+1;
  end
  for i = 1:k
      C(i, :) = C(i, :)/razm(i);
  end
  m = m+1;
end
hold on
gscatter(X(:,1),X(:,2), U(:,1))