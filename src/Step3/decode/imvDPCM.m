function decMV = imvDPCM(currMV,prevMV,picType)

if picType==2 %<--P Mblock
 decMV = [0 NaN;0 NaN];   
 decMV(:,1) = currMV(:,1)+prevMV(:,1);  
else %<--B Mblock
 decMV = currMV+prevMV;    
end

end