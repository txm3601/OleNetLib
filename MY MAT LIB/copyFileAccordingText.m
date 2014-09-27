fid=fopen('D:\STUDY\[1] 图像处理\模糊度检测\工作日志\20140618\算法检测模糊\diransi.txt');
C = textscan(fid, '%s %s %s');
A= [C{1,1}(:) C{1,2}(:) C{1,3}(:)];
l = length(A);
i=1
while i <= l
    dir = [A{i,1},' ',A{i,2}, ' ', A{i,3}]
    try 
        copyfile(dir,'D:\STUDY\[1] 图像处理\模糊度检测\工作日志\20140618\算法检测模糊\');
    catch err
        
    end
    i = i + 1;
end
fclose(fid);