function [ R ] = stripe_match( img, H )

%%
L = 255;

%%
[M N] = size(img);
W=N;
model(1:H, 1:W) = uint8(L);

Y1 = M - H;
Y2 = H;
for i=1:Y1	
    match(i,:) = sum(model(:, :) - img(i:i+Y2-1, :));
end
match = abs(sum(match, 2));
n = min(match);
[R, C]=find(match==n);

end