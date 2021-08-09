function [pgain] = p_gain( train, class, index )

hc = p_entropy( class );
pgain = zeros(length(index),1);

for k=1:size(index,1)
    pgain(k) = hc - p_entropy( [train(:,index(1:k)) class] ) + p_entropy( train(:,index(1:k)) );
end
