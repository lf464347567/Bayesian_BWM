%% voting_aggregating
load data_new
c_matrix = cell(1,5);
for i = 1 : 5
    for k = 1 : 6
        for p = k+1 : 6
            acc = [];
            for j = 1 : 3
                acc = [acc,data{i}{j}(k,p)];
            end
            [unique_elements, ~, idx] = unique(acc);
            counts = accumarray(idx, 1);
            index = find(counts == max(counts));
            c_matrix{i}(k,p) = unique_elements(index(1));
        end
    end

end

%% weighted-average aggregating
c_matrix = cell(1,5);
for i = 1 : 5
    for k = 1 : 6
        for p = k+1 : 6
            acc = [];
            for j = 1 : 3
                acc = [acc,data{i}{j}(k,p)];
            end    
            c_matrix{i}(k,p) = round(sum(acc.*w_k(i,:)));
        end
    end

end
    