function delEmptyFolder()
pth = 'D:\Haikon2\ljx\';
fs = dir(pth) ;

for i = 3 : length(fs) % skip . and ..
    subf = [pth, fs(i).name];
    files = dir ( fullfile(subf, ['*.', 'bmp']) );
    if( isempty(files ) );
        display(['remove dir ', subf]);
        rmdir(subf);
    end
end

end