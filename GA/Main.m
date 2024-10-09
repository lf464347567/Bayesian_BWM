%% 共识模型代码

%% 数据生成

cri = 5; % 准则数量
dm = 3; % 专家数量
alter = 6; % 方案数量
load data
% data_vo = ini_data_gen(cri,alter,dm); %未考虑属性个数
data_vo = data{5};
%% 参数与初始解生成 
% y = Dis(vc,vk);
pop = 30; % 种群数量
mutationRate = 0.8;   % 变异率
crossoverRate = 0.8;   % 交叉率
itermax = 500;     % 迭代次数
deta = 0.8; % 容忍度阈值
gamma = 0.8; % 共识阈值
x_c = struct();
for k = 1 : 20
    x = repmat(x_c,1,pop);
    % 初始可行解生成
    for i = 1 : pop
        [x(i).vk,x(i).ib,x(i).va,x(i).TL,x(i).CL] = data_gen(x(i),cri,dm,alter,data_vo,deta,gamma);
        x(i).fit = fun(x(i),data_vo);
    end
    [bestvalue,index] = min([x.fit]);
    bestx = x(index);
    bestx.vo = data_vo;
    %% 主循环

    for i = 1 : itermax 
        x_cross = crossover(x,bestx,crossoverRate,data_vo,deta,gamma); % 交叉
        x_mua = mutation(x,mutationRate,data_vo,deta,gamma); % 变异
        x = select_x([x,x_mua,x_cross],pop,cri,dm,alter,data_vo,deta,gamma); % 选择和种群更新

        [bestvalue,index] = min([x.fit]); % 更新最优解
        if bestvalue < bestx.fit
            bestx = x(index);
            bestx.vo = data_vo;
        end
    end
    if k == 1
        bbestx = bestx;
    else
        if bestx.fit<bbestx.fit
            bbestx = bestx;
        end
    end
    
end