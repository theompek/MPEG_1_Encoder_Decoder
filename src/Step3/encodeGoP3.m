function t = encodeGoP3(frameNumber, bName, fExtension,...
                                             startFrame, GoP, qScale)
%dhmiourgia buffer
createBuffer();
%Arxikopoihsh metablhtwn
t=1;

%Number of frames per GoP
pics_Per_GoP=length(GoP');

for i=1:pics_Per_GoP

 [pic, picType, tempRef] = getNextPicture(bName, fExtension, frameNumber+i-1, ...
                                                  startFrame, GoP);                                                                                            
 %Apotyxia anagnwshs eikonas
 if (tempRef==-1)                           
  t=0;
 break;
 end
 Header = genPicSliceHeader3(tempRef,picType,qScale);
 writePicSliceHeader3(Header);
 encodePicSlice3(pic, picType, qScale); 

 if (picType==1 || picType==2)
 pushPic(pic);
 end

end

end