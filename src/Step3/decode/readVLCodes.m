function runSymbols = readVLCodes()
global pos;
global d15a;
global d15b;
global d17a;
global d17b;
if(size(d15a,1)==0)
getTheGlobals;
end
escapeBin = '000001';
iCell=1;
runSymbols = [0 0];

while true
flage = strcmp(readstreamBits(6,pos),escapeBin);
 
%Des an uparxei o escape code kai phgene ston 17a,b 
if(flage)
 pos=pos+6;
 [runBin, pos] = readstreamBits(6,pos); 
 [levelBin, pos] = readstreamBits(8,pos);
 
 %An o ari8mos > 128 h ari8mos < -128 tote 16bitos ara pare alla 8 bit
 %pinakas Table 2-D.17. level code selida 95 
 if(strcmp(levelBin,'00000000')||strcmp(levelBin,'10000000'))
 [levelBin, pos] = readstreamBits(16,pos-8);
 end
  for j=1:size(d17b,1)
   if (strcmp(levelBin,d17b{j}))
       runSymbols(iCell,2) = d17a(j);
       break;
   end
  end

 %To run to briskoume ape8ueia me metatroph binary ->decimal
 %xwris tous pinakes d16
 runSymbols(iCell,1) = bin2dec(runBin);

%Den yparxei escape code tote d15b
else
   for step=2:16
       [CodeBin,~]=readstreamBits(step,pos);
      for j=1:size(d15b,1)
       if (strcmp(CodeBin,d15b{j}))
           runSymbols(iCell,:) = d15a(j,:);
           pos=pos+step;
           flage=true(1);
           break;
       end       
      end
     if flage;break;end; 
   end
   
   [s,pos]=readstreamBits(1,pos);
   if strcmp(s,'1')
    runSymbols(iCell,2)=-runSymbols(iCell,2);
   end 
end
 
[blockEnd, ~ ] =readstreamBits(2,pos);
if strcmp(blockEnd,'10') 
pos=pos+2;
break;
end
iCell=iCell+1;

end %telos while

end