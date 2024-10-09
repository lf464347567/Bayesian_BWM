function [vk,ib,x_va,TL,CL] = data_gen(x,cri,dm,alter,data,deta,gamma)
x.ib = rand(1,3)*0.25; 
x_agg = aggregate(x,data);
for i = 1 : dm 
    q{i} = zeros(alter,alter);
    for j = 1 : alter-1
        for k = j+1 : alter
            q{i}(j,k) = randi([min(data{i}(j,k),x_agg(j,k)),max(data{i}(j,k),x_agg(j,k))]);
        end
    end
    x.vk{i} = q{i};
end
[q,x_va,TL,CL] = feasible(x,data,deta,gamma);
ib = q.ib;
vk = q.vk;
end