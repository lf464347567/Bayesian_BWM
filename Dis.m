function [y,y1] = Dis(vc,vk)
%% 矩阵相似度计算
% c = cumsum(1: size(vc,1));
y = sqrt(sum(sum((vc-vk).^2)))/sum(1:size(vc,1));
y1 = sqrt(sum(sum((vc-vk).^2)))/size(vc,1)^2;

    