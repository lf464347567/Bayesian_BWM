function x = crossover(x,bestx,crossoverRate,data,deta,gamma)
% 交叉
x_new = x;
for i = 1 : 2: size(x,2)
    if rand <= crossoverRate
        for k = 1 : 3 
            q = randi(5,1);
            j = randi([q,5],1);
            matrix = x_new(i).vk{k}(q:q+1,j:j+1);
            if rand<= 0.5 % 和最优的交叉  
                % 容忍值
                p = rand;
                x_new(i).ib(k) = (1-p)* bestx.ib(k)+ p*x_new(i).ib(k);
                bestx.ib(k) = p* bestx.ib(k)+ (1-p)*x_new(i).ib(k);
                % 共识矩阵
                x_new(i).vk{k}(q:q+1,j:j+1) = bestx.vk{k}(q:q+1,j:j+1);
                x_new(i+1).vk{k}(q:q+1,j:j+1) = matrix;
            else
                p = rand;
                x_new(i).ib(k) = (1-p)* x(i+1).ib(k)+ p*x_new(i).ib(k);
                bestx.ib(k) = p * x(i+1).ib(k)+ (1-p)*x_new(i).ib(k);
                x_new(i).vk{k}(q:q+1,j:j+1) = x_new(i+1).vk{k}(q:q+1,j:j+1);
                x_new(i+1).vk{k}(q:q+1,j:j+1) = matrix;
            end
        end
        [x_new(i),x_new(i).va,x_new(i).TL,x_new(i).CL] = feasible(x_new(i),data,deta,gamma);
        [x_new(i+1),x_new(i+1).va,x_new(i+1).TL,x_new(i+1).CL] = feasible(x_new(i+1),data,deta,gamma);
        x_new(i).fit = fun(x_new(i),data);
        x_new(i+1).fit = fun(x_new(i+1),data);
        if x_new(i).fit < x_new(i+1).fit
            x1 = x_new(i);
        else
            x1 = x_new(i+1);
        end 
        if x1.fit < x(i).fit
            x(i) = x1;
        end
    end
end
             
