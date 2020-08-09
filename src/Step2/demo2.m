%%
%kwdikopoihsh
%Orismata
bName = 'coastguard';
fExtension = 'tiff';
startFrame = 0;
GoP = 'IBBP';
numOfGoPs = 1; 
qScale = 8;

fprintf('Kdikwpoihsh gia %d frames\n',length(GoP)*numOfGoPs);
encodeMPEG(bName, fExtension, startFrame, GoP, numOfGoPs, qScale);
fprintf('Telos kwdikopoihshs eikonwn\n')
load('Stream.mat')
Bytes = getSeqEntityBits(SeqEntity)/8;
fprintf('Mege8os sumpiesmenou arxeiou %d bytes\n',Bytes);
%%
%Apokwdikopoihsh
cd decode %Metabash sto fakelo 'decode' gia thn apokwdikoihsh 
decodeMPEG('Stream.mat','decodePicture');

cd saveImages %Metabash sto fakelo 'saveImages' gia upologismo sfalmatwn
for i=startFrame:startFrame+length(GoP)*numOfGoPs-1
RGB1 = imread(strcat('decodePicture',num2str(i),'.tiff'));
cd ../../../images/    
RGB2 = imread(strcat('coastguard',num2str(i),'.tiff'));
cd ../Step2/decode/saveImages/

Mean_absolute_error = sum(sum(sum(abs(RGB1-RGB2))))/(size(RGB1,1)*size(RGB1,2)*3);
fprintf('Mean_absolute_error of frame%d = %f\n',i,Mean_absolute_error);
end

coastguard2tiff=imread('decodePicture2.tiff');
cd ../../../Step1
Y = ccir2ycrcb(coastguard2tiff);
image(Y);
title('Y kanali ths coastguard002.tiff')
cd ../Step2/decode/saveImages
