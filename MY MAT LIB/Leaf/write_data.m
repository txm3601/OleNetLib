function [] = write_data( filename, ratio)
%%
DIR = 'D:\temp\result.dat';

%%
fid = fopen(DIR,'A');
fprintf(fid,'%s', filename);
fprintf(fid,'\t');
fprintf(fid,'%.5f', ratio);
fprintf(fid,'\n');
fclose(fid);

end

