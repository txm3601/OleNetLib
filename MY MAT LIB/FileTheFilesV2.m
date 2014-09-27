clear all;
clc;
%%
src = 'D:\6月18日武汉市局海康截图 原版\2\';
dst = 'D:\Haikon2相似度分类\';
ext = 'bmp';
T = 0.8;
start = 11;

%%
flagImg = imread( [src, num2str(start),'.bmp' ]);
folderCount = 0;
newFolder1 = '0001';
mkdir([dst, newFolder1]);
files = dir(fullfile(src, ['*.', ext]));

for i = start : length(files)
    nowFile = [src, num2str(i),'.bmp']
    nowImg = imread( nowFile ); 
    
    if ( calcSimilarity( flagImg,  nowImg) < T )        
        flagImg = nowImg;
        folderCount = folderCount + 1;
        
        n = floor(log10(folderCount))+1;
        switch n
            case 1
                newFolder1 = ['000', num2str(folderCount)];
            case 2
                newFolder1 = [ '00', num2str(folderCount)];
            case 3
                newFolder1 = [  '0', num2str(folderCount)];
            case 4
                newFolder1 = [       num2str(folderCount)];
            otherwise
                disp('Unknown name.')
        end
        
        mkdir([dst, newFolder1]);
        
    end
    
    newName = makeName([num2str(i),'.bmp']);
    copyfile(nowFile, [dst, num2str(newFolder1)]);   
    if ~strcmp([num2str(i),'.bmp'] , newName)
        movefile([dst, num2str(newFolder1), '\', [num2str(i),'.bmp']], [dst,num2str(newFolder1), '\', newName]);
    end
    
end
