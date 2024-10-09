function CL = cl_compute(vk,va,v)
    if (sum(sum(va == vk)) == size(vk,1)*size(vk,2))
        CL = 1;
    else
        CL = Dis(vk,v)/Dis(v,va);
    end
    if CL>1
        b=0;
    end
end