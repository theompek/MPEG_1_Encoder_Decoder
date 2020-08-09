
addpath(genpath('../images'));
%%
%Parousiash sunarthsewn ccir2ycrcb() kai ycrcb2ccir()
figure(1)
subplot(1,2,1)
RGB = imread('coastguard3.tiff');
image(RGB);
title('Prwtiph eikona prin thn epe3ergasia');

[Y, Cr, Cb]=ccir2ycrcb(imread('coastguard3.tiff'));
prIm = ycrcb2ccir(Y,Cr,Cb);
subplot(1,2,2)
image(prIm);
title('Meta apo RGB->YCrCb & YCrCb->RGB');

%%
%Parousiash ths sunarthshs mostEstP
macroblock0=1; %H ari8mhsh 3ekinaei apo to 1
[Y, Cr, Cb]=ccir2ycrcb(imread('coastguard3.tiff'));
[refFrameY, refFrameCr, refFrameCb]=ccir2ycrcb(imread('coastguard1.tiff'));
[eMBY, eMBCr, eMBCb, mV] = motEstP(Y, Cr, Cb, macroblock0,refFrameY, refFrameCr, refFrameCb);

display('MotionVector');
mV

figure(2)
subplot(2,2,1)
image(Y(1:16,1:16));
title('MacroBlock0-coastguard3');

subplot(2,2,2)
image(refFrameY(mV(1,1)+1:mV(1,1)+16,mV(2,1)+1:mV(2,1)+16));
title('MacroBlock0-coastguard1');

subplot(2,2,3)
image(eMBY)
title('Sfalma-eMBY');

subplot(2,2,4)
image(refFrameY(1:7+16,1:7+16));
title('Sunolikh perioxh anazhthseis');

rmpath(genpath('../images'));