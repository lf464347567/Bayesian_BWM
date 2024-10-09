function v_a = aggregate(x,data)
if nargin == 1
    v_k = x.vk;
else
    v_k = data;
end
% 共识矩阵聚合
    w = x.ib/sum(x.ib);
    v_a = zeros(size(v_k{1},1),size(v_k{1},2));
    for i = 1 : size(w,2)
        v_a = v_a + w(i).*v_k{i};
    end
    v_a = round(v_a);

end