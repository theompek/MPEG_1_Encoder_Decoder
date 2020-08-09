function pic = decodePicSlice3()

global pos;

numOfMB = 396;
StepMBlock16 = 16;
StepMBlock8 = 8;
pic.decPic.frameY = uint8(zeros(288,352));
pic.decPic.frameCr = uint8(zeros(144,176));
pic.decPic.frameCb = uint8(zeros(144,176));
prevMV = zeros(2);

%Ekthpwsh ths proodou ths diadikasia,apla gia optiko elegxo
fprintf('Frame decoding(');
for mBIndex=1:numOfMB
    
   
  [mBType,pos ] =readstreamBits(3,pos);
  [qScale,pos ] =readstreamBits(5,pos);
  
  mBType = bin2dec(mBType);
  qScale = bin2dec(qScale);

 [decMBY,decMBCr,decMBCb,prevMV] = decodeMB3(mBType, mBIndex,prevMV, qScale) ;
 
 %Suntetagmenes tou MBlock se pixels
 [xY ,yY ,x_CrCb, y_CrCb] = returnCord(pic.decPic.frameY,mBIndex);   
      
 pic.decPic.frameY(xY:xY+StepMBlock16-1,yY:yY+StepMBlock16-1) = decMBY;
 pic.decPic.frameCr(x_CrCb:x_CrCb+StepMBlock8-1,y_CrCb:y_CrCb+StepMBlock8-1) = decMBCr;
 pic.decPic.frameCb(x_CrCb:x_CrCb+StepMBlock8-1,y_CrCb:y_CrCb+StepMBlock8-1) = decMBCb;                                 
 
 
 %Ekthpwsh proodou
    if(mod(mBIndex,10)==0)
    fprintf('.');
    end
end
fprintf(')\n');
end