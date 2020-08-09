function encodePicSlice3(pic, picType, qScale)
%Ari8mos twn Mblocks diastasewn 16x16
numOfMB = size(pic.decPic.frameY,1)*size(pic.decPic.frameY,2)/256; 
%Ekthpwsh ths proodou ths diadikasia,apla gia optiko elegxo
fprintf('Frame encoding(');
prevMV = zeros(2);

for mBIndex=1:numOfMB %=396
Header = genMBHeader3(picType,qScale);    
writeMBHeader3(Header);

prevMV = encodeMB3(pic, picType, qScale, mBIndex,prevMV);

 %Ekthpwsh proodou
    if(mod(mBIndex,10)==0)
    fprintf('.');
    end
end
fprintf(')\n');

end