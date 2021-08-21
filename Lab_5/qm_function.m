function Qm = qm_function(U, X)
Qm= 0;
P = zeros(80,2,4);
Z = zeros(80,80,4);
for i= 1:4
    k = 1;
    for j = 1:80
        if U(j,1)== i
            P(k,:,i)=X(j,:);
            k=k+1;
        end;
    end;
    for j= 1:80
        if P(j,1,i)== 0
            stop =  j-1;
            break;
        end;
    end;
    N = pdist(P(:,:,i));
    Z(:,:,i) = squareform(N);
    for c = 2 :stop
        for j = 1:c-1
            Qm = Qm + Z(j,c,i);
        end;
    end;
end;

