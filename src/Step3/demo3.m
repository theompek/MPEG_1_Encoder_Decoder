%%
%kwdikopoihsh
bName = 'coastguard';
fExtension = 'tiff';
startFrame = 0;
GoP = 'IBBP';
numOfGoPs = 1; 
qScale = 8;

fprintf('Kdikwpoihsh gia %d frames\n',length(GoP)*numOfGoPs);
encodeMPEG3(bName, fExtension, startFrame, GoP, numOfGoPs, qScale);
fprintf('Telos kwdikopoihshs eikonwn\n')
load('Stream.mat')
Bytes = length(encodedStream);
fprintf('Mege8os sumpiesmenou arxeiou %d bytes\n',Bytes);
%%
%Apokwdikopoihsh
cd decode %Metabash sto fakelo 'decode' gia thn apokwdikoihsh 
decodeMPEG3('Stream.mat','decodePicture');

cd saveImages %Metabash sto fakelo 'saveImages' gia upologismo sfalmatwn
