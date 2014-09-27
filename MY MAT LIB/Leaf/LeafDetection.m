function [ ratio ] = LeafDetection( rgb, filename )
%%
SHOWFLAG = 1;
WRITE_DATA_FLAG = 0;
ISLEAF = 0;
RESULT = 0;
T_HUEMX = 0.23;
T_HUEMN = 0.18;
T_SATMN = 0.04;
T_GRAY = 153;
T_RATIO = 0.3;
T_LIGHT = 0.2;
[ht wd] = size(rgb(:,:,1));

%%
gray = rgb2gray(rgb);
hsv = rgb2hsv(rgb);
r = rgb(:,:,1);
g = rgb(:,:,2);
b = rgb(:,:,3);
h = hsv(:,:,1);
s = hsv(:,:,2);
v = hsv(:,:,3);

light = mean(v(:));
h(g(:,:)<r(:,:) | g(:,:)<b(:,:) | s(:,:)<T_SATMN | gray(:,:)>T_GRAY)=0;
greenDots = length( (h(T_HUEMX>h(:) & h(:)>T_HUEMN))==1 );
totalDots = length( h(:) );
ratio = greenDots/totalDots;

leaf_area_mask(1:ht, 1:wd) = 0;
leaf_area_mask(T_HUEMX>h(:,:) & h(:,:)>T_HUEMN) = 1;
leaf_area_gray = uint8(leaf_area_mask).*gray;

if (ratio>T_RATIO && light>T_LIGHT)
    RESULT = ISLEAF;
else
    RESULT = ~ISLEAF;
end

if (SHOWFLAG)
    handle = figure(100);
    
    subplot(331);imshow(rgb);title(['origin:',filename]);
    
    %subplot(332);imshow(h);title('hue');
   
    subplot(333);imshow(leaf_area_mask);title('leaf area mask');
    
    subplot(334);imshow(leaf_area_gray);title('leaf_area_gray');
    
%     subplot(335);imshow(u_intersection);title('intersection');
%     
%     subplot(336);imshow(gbvs_out.master_map_resized);title(' GBVS map');
    
    subplot(337);plot(1.5, light, '--rs','linewidth', 2, 'markeredgecolor', ...
        'k', 'markerfacecolor', 'r','markersize', 10); ...
        hold on;grid on; axis([1 2 0 1]);title('light');hold off;
    
    % subplot(338);
    if (RESULT == ISLEAF)
        subplot(338);plot(1.5, ratio, '--rs','linewidth', 2, 'markeredgecolor', ...
            'k', 'markerfacecolor', 'r','markersize', 10); ...
            hold on;grid on; axis([1 2 0 1]);title('green ratio');hold off;
        
        if(WRITE_DATA_FLAG)
            write_data(filename,ratio);
        end;        
    else
        subplot(338);plot(1.5, ratio, '--rs','linewidth', 2, 'markeredgecolor', ...
            'k', 'markerfacecolor', 'g','markersize', 10); hold on;grid on;...
            axis([1 2 0 1]);title('ratio');hold off;
    end;
    
    if (RESULT == ISLEAF)
        text(2.5, .5, 'HAS Leaf !','FontSize', 20, 'Color', 'r');
    else
        text(2.5,.5,'No Leaf.', 'FontSize', 20, 'Color', 'g');
    end
    
    hold off;
    
    set(handle, 'name','imvl debug window','numbertitle','off','position', get(0,'screensize'));
end;

if(WRITE_DATA_FLAG)
    if (ratio>T_RATIO)
        if(WRITE_DATA_FLAG)
            write_data(filename,ratio);
        end;
    end;
end;

end


