function f = darkChannel(I)
%%  I should have 3 channels

%%
[height,width,c] = size(I);
rect_size = 7;

J = double(I)/255;
Jc = ones(height+2*rect_size,width+2*rect_size);
Jdark = zeros(height,width);


    for j=1:width
        for i=1:height
            m_pos_min = min(J(i,j,:));
            Jc(i+rect_size,j+rect_size) = m_pos_min;
        end
    end


for j=1:width
    for i=1:height
        mask = Jc(i:i+2*rect_size,j:j+2*rect_size);
        vertex = Matrix2Vertex(mask);
        vertex = sort(vertex);
        Jdark(i,j) = vertex(1);
    end
end
f = Jdark;
end