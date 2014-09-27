function I1 = zero_center( I0, R )

[M,N] = size(I0);
CY = floor(M/2) + 1;
CX = floor(N/2) + 1;

I1 = I0;
I1( CY-R:CY+R, CX-R:CX+R) = 0;

end

