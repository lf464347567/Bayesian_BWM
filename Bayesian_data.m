% load comparative_data
record = zeros(1000,6);
rank = zeros(6,6);
for i = 1 : 1000
    for j = 1 : 6
        record(i,j) = BayesianBWM(i,:)*scale(:,j);
    end
    [~,index]=sort(record(i,:),'descend');
    for j = 1 : 6
        rank(j,index(j)) = rank(j,index(j))+1;
    end
end
rank=rank/1000;

value = zeros(1,6); % 均值
for i = 1 : 6
    value(i) = sum(BWM)/1000*scale(:,i);
end
