function dpcmMV = mvDPCM(currMV,prevMV,picType)

if picType==2 %<--P Mblock
 dpcmMV = currMV(:,1)-prevMV(:,1);  
else %<--B Mblock
 dpcmMV = currMV-prevMV;    
end
end

