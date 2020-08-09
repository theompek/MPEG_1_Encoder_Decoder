function [frameY, frameCr, frameCb ] = ccir2ycrcb( frameRGB )

%Arxika allazoume to systhma xrwmatwn RGB -> YCrCb
frameRGB=double(frameRGB);

T = [0.299   0.587   0.114
     0.5000 -0.4187 -0.0813
    -0.1687 -0.3313  0.5000];

R = frameRGB(:,:,1);
G = frameRGB(:,:,2);
B = frameRGB(:,:,3);
frameY =  T(1,1)*R + T(1,2)*G + T(1,3)*B;
frameCr = 128+ T(2,1)*R + T(2,2)*G + T(2,3)*B;
frameCb = 128+ T(3,1)*R + T(3,2)*G + T(3,3)*B;


%Sampling pattern format 4:2:0
%%
frameCr=frameCr(1:2:end,1:2:end);
frameCb=frameCb(1:2:end,1:2:end);

%Ypodeigmatolhpsia aporiptontas tis arties grammes(even lines)
frameY=frameY(1:2:end,:);
frameCr=frameCr(1:2:end,:);
frameCb=frameCb(1:2:end,:);

%Low pass filters
Low_Y_filter=[-29 0 88 138 88 0 -29]';
Low_CbCr_filter=[1 3 3 1]';

%Efarmogh filtrwn kai upodeigmatoleipsia ston orizontio a3ona
d=length(Low_Y_filter);
for i=1:2:length(frameY(1,:))-d
   frameY(:,i)=(frameY(:,i:(i+d-1))*Low_Y_filter)/256;
end

d=length(Low_CbCr_filter);
for i=1:2:length(frameCb(1,:))-d
   frameCr(:,i)=(frameCr(:,i:(i+d-1))*Low_CbCr_filter)/8;
   frameCb(:,i)=(frameCb(:,i:(i+d-1))*Low_CbCr_filter)/8;
end

frameY=uint8(frameY(:,1:2:end));
frameCr=uint8(frameCr(:,1:2:end));
frameCb=uint8(frameCb(:,1:2:end));

%Aporiptoume tis akrianes steiles gia na exoume dieresh me to 16
frameY=frameY(:,5:end-4);
frameCr=frameCr(:,3:end-2);
frameCb=frameCb(:,3:end-2);

end