function y = fun(x,v)
% w = x.ib/sum(x.ib);
% v_a = zeros(size(x.vk{1},1),size(x.vk{1},2));
% for i = 1 : size(w,2)
%     v_a = v_a + w(i).*x.vk{i};
% end
% v_a = round(v_a);
y = 0;
for i = 1 : size(x.vk,2)
    y = y + Dis(v{i},x.vk{i});
end