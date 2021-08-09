function [sf time_table] = p_fs( train, class, limit )

% Initialize
hc = p_entropy( class );
col = size( train, 2 );
rel = zeros( col, 2 );
rel(:,2) = 1:col;
for k=1:col
    rel(k,1) = hc - p_entropy( [train(:,k) class] ) + p_entropy( train(:,k) );
end
rel = sortrows( rel, -1 );
sf = zeros(0,1);
sf(end+1,1) = rel(1,2);

% Start
pgain = zeros( col, 1 );
pgain(1,1) = rel(1,1)-hc;

time_table = zeros( limit, 1 );
start = tic;

for k=2:col-1
    % Prev state was calculated
    
    % Current
    pgain(k,1) = p_entropy( [train(:,rel(k,2)) train(:,sf)] ) - ...
        p_entropy( [train(:,rel(k,2)) train(:,sf) class] );
    
    % Next
    pgain(k+1,1) = p_entropy( [train(:,rel(k+1,2)) train(:,sf)] ) - ...
        p_entropy( [train(:,rel(k+1,2)) train(:,sf) class] );
    
    % Is it a peak?
    if (pgain(k-1,1) < pgain(k,1)) && (pgain(k+1,1) < pgain(k,1))
        sf(end+1,1) = rel(k,2);
        time_table(length(sf),1) = toc(start);
    end
    
    if length(sf) >= limit
        return;
    end
end

