function MotionVectors = encodeMB3(pic, picType, qScale, mBIndex,prevMV)

StepMBlock16 = 16;
StepMBlock8 = 8;

switch picType
  case 2 %<---P type
  refFrame = readBuffer(1);
  [eMBY, eMBCr, eMBCb, mV] = motEstP(pic.decPic.frameY,pic.decPic.frameCr, pic.decPic.frameCb, mBIndex, ...
                refFrame.decPic.frameY,refFrame.decPic.frameCr, refFrame.decPic.frameCb);
   %encodeMV()
  case 3 %<---B type
   backWFrame = readBuffer(2);
   forWFrame = readBuffer(1);
  [eMBY, eMBCr, eMBCb, mV] = motEstB(pic.decPic.frameY,pic.decPic.frameCr, pic.decPic.frameCb, mBIndex, ...
                backWFrame.decPic.frameY,backWFrame.decPic.frameCr, backWFrame.decPic.frameCb, ...
                forWFrame.decPic.frameY,forWFrame.decPic.frameCr, forWFrame.decPic.frameCb);    
   %encodeMV()
   otherwise %<---I type
   %Suntetagmenes tou MBlock se pixels
   [xY ,yY ,x_CrCb, y_CrCb] = returnCord(pic.decPic.frameY,mBIndex);   
   
   %Pernoume to I block auto ka8auto     
   eMBY = pic.decPic.frameY(xY:xY+StepMBlock16-1,yY:yY+StepMBlock16-1);
   eMBCr = pic.decPic.frameCr(x_CrCb:x_CrCb+StepMBlock8-1,y_CrCb:y_CrCb+StepMBlock8-1);
   eMBCb = pic.decPic.frameCb(x_CrCb:x_CrCb+StepMBlock8-1,y_CrCb:y_CrCb+StepMBlock8-1);   

   mV = [NaN NaN;NaN NaN];
end

MotionVectors = mV;

%Kwdikopoihsh toy Motion vector gia P kai B frame
if picType~=1
dpcmMV = mvDPCM(MotionVectors,prevMV,picType);
currVLC = mvVLC(dpcmMV); 
writeMV(currVLC); 
end

%4 Y block and 1 Cr and 1 Cb
encodeBlock3(eMBY(1:8,1:8),picType,qScale);
encodeBlock3(eMBY(1:8,9:16),picType,qScale);
encodeBlock3(eMBY(9:16,1:8),picType,qScale);
encodeBlock3(eMBY(9:16,9:16),picType,qScale);
encodeBlock3(eMBCr,picType,qScale);
encodeBlock3(eMBCb,picType,qScale);
end