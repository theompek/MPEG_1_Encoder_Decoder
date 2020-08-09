function [c, newpos] = readstreamBits(len,pos)

global encodedStream;
sizeOfBitsOfStream = size(encodedStream,2);
if(pos<=sizeOfBitsOfStream)    
if(len+pos)>sizeOfBitsOfStream %An ftasei sto telos ektupwse oti apemeine
len = sizeOfBitsOfStream - pos+1;
end
newpos = pos +len;
c = encodedStream(pos:newpos-1);
else
c ='Empty';    
newpos = pos;  
end


end