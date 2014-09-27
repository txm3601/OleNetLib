function [ angle ] = get_angle( I, PRESESION )

%%
T = intmax;
[M,N] = size(I);
CY = floor(M/2) + 1;
CX = floor(N/2) + 1;

%%
BF = I(CY, CX);
mask = I > BF * 0.2;
if sum(mask(:)) == 0
    angle=pi;
    return;
else
    [Y, X] = find(mask == 1);
end

%%
V(1,:) = Y(:) - CY;
V(2,:) = X(:) - CX;
for theta = - pi / 2 : PRESESION : pi / 2
    dis = abs((cos(theta) * V(1,:) - sin(theta) * V(2,:)));
    Dtot = sum(dis);
    if Dtot < T
        T = Dtot;
        angle = theta;
    end
end

end

