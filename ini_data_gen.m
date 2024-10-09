function q = ini_data_gen(cri,alter,dm)
q = cell(1,dm);
for i = 1 : dm
    q{i} = randi(6,[alter,alter]);
%     for j = 1 : cri
    A = q{i}(:,:);
    A(tril(true(size(A)))) = 0;
    q{i} = A;
%     end
end  