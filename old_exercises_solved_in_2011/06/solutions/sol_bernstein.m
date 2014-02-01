function B = sol_bernstein(n,t)
% Code aus Muserlösung kopiert. Wurde zum Testen verwendet!

B = [ones(1,length(t));zeros(n,length(t))];

for j=1:n
    for k=j+1:-1:2
        B(k,:)=t.*B(k-1,:)+(1-t).*B(k,:);
    end
        B(1,:)=(1-t).*B(1,:);
end
