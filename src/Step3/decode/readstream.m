function [c, newpos] = readstream(x,len,pos)
%The function modified in order not to exceed matrix dimensions
%Also the function didn't work for numbers that was multiplied by eight
%Also if the combination 'len+pos' exceeds the matrix dimensions but 
%the index 'pos' is inside the mergin of the matrix then the 
%function returns the last bits of the matrix.
if(pos<=size(x,1)*8)
if(len+pos)>size(x,1)*8
len = size(x,1)*8 - pos;
end
WORDLENGTH = 8;
pastWholeWords = floor(pos/(WORDLENGTH+1));
partWordBits = pos-pastWholeWords*WORDLENGTH-1;
cSpan = ceil((partWordBits+len+1)/WORDLENGTH);
wordBuff = x(pastWholeWords+1:pastWholeWords+cSpan);
cBuff = dec2bin(double(wordBuff),WORDLENGTH);
cBuff = cBuff';
cBuff = cBuff(:);
c = cBuff(partWordBits+1:partWordBits+len)';
newpos = pos+len;
else
c ='Empty';    
newpos = pos;  
end
end