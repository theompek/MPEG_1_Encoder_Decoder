function [decMBY,decMBCr,decMBCb,MotionVectors] = decodeMB3(mBType, mBIndex, prevMV,qScale)
                                             
StepMBlock16 = 16;
MotionVectors = zeros(2);
eMBY = uint8(zeros(StepMBlock16,StepMBlock16));

if mBType~=1   
%Apokwdikopoihsh toy Motion vector
mvVLC=readMV(mBType);
dpcmMV = imvVLC(mvVLC, mBType);
MotionVectors = imvDPCM(dpcmMV,prevMV,mBType);
end

%4 Y block and 1 Cr and 1 Cb
eMBY(1:8,1:8) = decodeBlock3(mBType,qScale);
eMBY(1:8,9:16)= decodeBlock3(mBType,qScale);
eMBY(9:16,1:8)= decodeBlock3(mBType,qScale);
eMBY(9:16,9:16) = decodeBlock3(mBType,qScale);
eMBCr = decodeBlock3(mBType,qScale);
eMBCb = decodeBlock3(mBType,qScale);

switch mBType
  case 2 %<---P type
  refFrame = readBuffer(1);
  [decMBY, decMBCr, decMBCb] = iMotEstP(eMBY, eMBCr, eMBCb, mBIndex, MotionVectors, ...
                refFrame.decPic.frameY,refFrame.decPic.frameCr, refFrame.decPic.frameCb);
   
  case 3 %<---B type
   backWFrame = readBuffer(2);
   forWFrame = readBuffer(1);
   [decMBY, decMBCr, decMBCb] = iMotEstB(eMBY, eMBCr, eMBCb, mBIndex, MotionVectors, ...
                backWFrame.decPic.frameY,backWFrame.decPic.frameCr, backWFrame.decPic.frameCb, ...
                forWFrame.decPic.frameY,forWFrame.decPic.frameCr, forWFrame.decPic.frameCb);    
   
   otherwise %<---I type
   %Pernoume to I block auto ka8auto  
   decMBY = eMBY;
   decMBCr = eMBCr;
   decMBCb = eMBCb;
end

end