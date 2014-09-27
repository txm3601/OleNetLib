function CopyFileAccordingXls(xlsfilename, dst_dir)

[scalar src_dir] = xlsread(xlsfilename , 'sheet1' );
for i = 1 : length(src_dir)
    copyfile(src_dir{i}, dst_dir);
end

end