function y = tl_compute(vk,x_va,ib)
    if ib>= Dis(vk,x_va) || (sum(sum(x_va == vk)) == size(vk,1)*size(vk,2))
        y = 1;
    else
        y = ib/Dis(vk,x_va);
    end
end