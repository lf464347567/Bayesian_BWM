function x = mutation(x,mutationRate,data,deta,gamma)
x_new = x;
for i = 1:size(x,2)  
    if rand < mutationRate
        for k = 1 : 3
            % 共识矩阵变异
            q = randi(5,1);
            j = randi([q+1,6],1);
            value = randi(6,1);
            x_new(i).vk{k}(q,j) = value; 
            % 容忍值变异   
            x_new(i).ib(k) = rand;
        end
    end
    [x_new(i),x_new(i).va,x_new(i).TL,x_new(i).CL] = feasible(x_new(i),data,deta,gamma);
    x_new(i).fit = fun(x_new(i),data);
    if x_new(i).fit < x(i).fit
        x(i) = x_new(i);
    end
end
end
