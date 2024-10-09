function [x,x_va,TL,CL] = feasible(x,data,deta,gamma)
% 可行解检测
TL = zeros(1,size(data,2));
CL = zeros(1,size(data,2));
para = ones(1,size(data,2));
for i = 1 : size(x.ib,2)
    while para(i) == 1
        x_va = aggregate(x);
        TL(i) = tl_compute(data{i},x_va,x.ib(i));
        CL(i) = cl_compute(x.vk{i},x_va,data{i}); 
        if Dis(x_va,x.vk{i})<=x.ib(i) && TL(i) >=deta && CL(i)>= gamma
            A = 0;
            for j = 1 : size(data{i},1)-1
                for k = j+1 : size(data{i},1)
                    if x.vk{i}(j,k) > max(x_va(j,k),data{i}(j,k)) || x.vk{i}(j,k)< min(x_va(j,k),data{i}(j,k))
                        x.vk{i}(j,k) = randi([min(x_va(j,k),data{i}(j,k)),max(x_va(j,k),data{i}(j,k))]);
                        x.ib(i) = rand*0.25;
                        A = 1;
                        break
                    end
                end
            end
            if A == 0
                para(i)=0;
            end
        else
            for j = 1 : size(data{i},1)-1
                for k = j+1 : size(data{i},1)
                    x.vk{i}(j,k) = randi([min(x_va(j,k),data{i}(j,k)),max(x_va(j,k),data{i}(j,k))]);
                end
            end
            x.ib(i) = rand*0.25;
        end
    end
end
    
        
    