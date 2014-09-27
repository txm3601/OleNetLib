set_startup;

%%
DEBUG = 0;
FILEDIR = '..\image\小样本测试集\';
% FILEDIR = 'G:\噪声测试视频样本20140423\大样本测试集\';

FILEAVIS = dir(fullfile(FILEDIR,'*.avi'));
FILENUM = size(FILEAVIS,1);

START = 1;
Mrow = 288;
Mcol = 352;
ANT_WIN = 20;
ANTS_NUM = 100;
ITER_NUM = 1;
DISP_FLAG = 1;

if (DEBUG==1)
    FILENUM = 2;
    DISP_FLAG = 1;
end

%%
ANTS_row = ANT_WIN + randperm(Mrow-2*ANT_WIN);ANTS_row = ANTS_row(1:ANTS_NUM);
ANTS_col = ANT_WIN + randperm(Mcol-2*ANT_WIN);ANTS_col = ANTS_col(1:ANTS_NUM);
AFeat_ALL = zeros(4, FILENUM);
PFeat_ALL = zeros(ANTS_NUM, FILENUM);
APath_ALL = cell(FILENUM);
time_spend = 0;
time_wait = 1;
for videoNo = START:START + FILENUM - 1
    tic;
    filename = [FILEDIR, FILEAVIS(videoNo,1).name];
    str = sprintf('Now Processing : %s... %.0f%%, waiting %.2f sec', filename,100*(videoNo-START)/FILENUM,time_wait); disp(str);

    img = getImageFromAvi(filename, Mrow, Mcol);
    [Feat1 Feat2 Path]  = antPath_main(img, ANTS_row, ANTS_col, ANTS_NUM, ANT_WIN, ITER_NUM, DISP_FLAG);
    AFeat_ALL(:,videoNo) = Feat1;
    PFeat_ALL(:,videoNo) = Feat2(:,:,2);
    APath_ALL{videoNo} = Path;

    time = toc; time_spend = time_spend + time; time_wait = time_spend/(videoNo-START+1)*FILENUM-time_spend;
end

%%
featDrawvideo(AFeat_ALL);
figure(3)
feat = AFeat_ALL(3,:); len = numel(feat); feat1 = feat(1:len/2); feat2 = feat(len/2+1:end);
Thresh = estimateThresh(feat1, feat2);
len1 = numel(feat1); num1 = sum(feat1< Thresh); rate1 = 100*num1/len1;
len2 = numel(feat2); num2 = sum(feat2>=Thresh); rate2 = 100*num2/len2;
str = sprintf('Thresh = %d...漏检率：%d/%d = %.2f%% VS 误报率：%d/%d = %.2f%%', Thresh, num1, len1, rate1, num2, len2, rate2);

plot(feat, 'b:+');grid on;hold on;
line(1:len, Thresh*ones([1 len]),'Color',[.9 .0 .0],'LineWidth',2);
xlabel('VideoNo');ylabel('num of the curved ants');title(str);
