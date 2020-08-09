function decodeGoP3(outFName)

%dhmiourgia buffer
createBuffer();
global pos;

[picture_start_code,pos ] =readstreamBits(32,pos);

while( strcmp(picture_start_code,hex2bin32bits('00000100')) )
    
 [tempRef,pos ] =readstreamBits(10,pos);
 [picType,pos ] =readstreamBits(3,pos);
 pos = pos +37;
 tempRef = bin2dec(tempRef);
 picType = bin2dec(picType);
 
 pic = decodePicSlice3(); 
 
 %Apo8hkeysh eikonas
 pushFlushPic(pic, tempRef, outFName)
 
 if (picType==1 || picType==2)
 pushPic(pic);
 end
 
 [picture_start_code,pos ] =readstreamBits(32,pos);
end

%To teleutaio diabasma den antistoixei sto picture_start_code ara
pos=pos-32;

end