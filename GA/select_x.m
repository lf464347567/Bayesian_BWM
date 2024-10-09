function x_new = select_x(x,pop,cri,dm,alter,data_vo,deta,gamma)

[~, sortedIndices] = sort([x.fit], 'ascend');
fit = [x.fit];
x_new(1) = x(sortedIndices(1));
for i = 2 : pop
    if fit(sortedIndices(i)) == x_new(end).fit
        if sum(sum((x(sortedIndices(i)).va == x(sortedIndices(i+1)).va))) == size(x(1).va,1)* size(x(1).va,1)    
            x_new(i) = x(sortedIndices(i));
        else
            [x_new(i).vk,x_new(i).ib,x_new(i).va,x_new(i).TL,x_new(i).CL] = data_gen(x(1),cri,dm,alter,data_vo,deta,gamma);
            x_new(i).fit = fun(x_new(i),data_vo);
        end
    else
        x_new(i) = x(sortedIndices(i));
    end

end
end