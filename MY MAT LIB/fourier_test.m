function [ output_args ] = fourier_test( aviObj, filename, SHOWFLAG, WRITEFLAG )

%%
STEP = 50;
BORDER = 50;
DATA_DIR = './data/RET.dat';
NUM = 10;
LOOP=2;

%%
totleFrames = aviObj.NumberOfFrames;
M0 = aviObj.Height;
N0 = aviObj.Width;
nFrames = min(NUM, totleFrames);

for k = 1 : nFrames
    kOld = k;
    kNew = min(k+STEP, totleFrames);
    imgOld = read(aviObj, kOld);  imgOld=imgOld(BORDER:M0-BORDER,BORDER:N0-BORDER,:);
    imgNew = read(aviObj, kNew);  imgNew=imgNew(BORDER:M0-BORDER,BORDER:N0-BORDER,:);
    imgDiff = abs(imgNew - imgOld);  imgDiff = rgb2gray(imgDiff); 
    imgsym = symmetry_img(double(imgDiff), LOOP);
    [M N]=size(imgsym);
    F = fftshift(abs(fft2(imgsym)));
    F=zero_center(F,2);
    VR = var(F,0,1);
    ME = mean(F,1);
    [y,x]=find(ME>2500);
    if isempty(y);
        
    else
            write_data(DATA_DIR, 1, filename, 0, 3, WRITEFLAG);
    end
    
    if (SHOWFLAG)
        handle=figure(101);
        subplot(231); plot(1:N, VR , 'r');title('Using Still Image:Varience');grid on;hold on;axis([1 N 0 1]);hold off;
        subplot(232);imagesc(F);colormap(hot);
        subplot(233);
        plot(1:N, ME, 'r');title('Using Still Image:Mean');grid on;hold on;axis([ 1 N 0 2550]);hold off;
        subplot(235);imshow(imgsym);title(['Original Image:',filename]);grid on;hold on; hold off;
        set(handle, 'Name','IMVL Debug Window','NumberTitle','off','position', get(0,'ScreenSize'));
        pause();
    end
    
end

end

