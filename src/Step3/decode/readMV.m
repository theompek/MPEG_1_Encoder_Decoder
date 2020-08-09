function mvVLC = readMV(mBType)
%H sunarthsh diavazei apo to stream ta motion vector.Gnwrizontas oti 8a diavastei ena
%motion vector 3eroume oti sthn trexon 8esh toy stream 8a uparxei mia apo
%tis parakatw akolou8eies.Analoga me ton typo toy block 8a diavastei kai o
%antistoixos ari8mos akoloyueiwn apo to stream.

global pos;
mvVLC=cell((mBType-1)*2 , 1);

for i=1:(mBType-1)*2
[sequence, ~ ] =readstreamBits(11,pos);
step=11;
while true    
bits = sequence(1:step);

   switch bits
    case '00000011001'   
    p = -16;
    case '00000011011' 
    p = -15;
    case '00000011101'
    p =  -14;
    case '00000011111'
    p =  -13;
    case '00000100001'
    p =  -12;
    case '00000100011'
    p =  -11;
    case '0000010011'
    p =  -10;
    case '0000010101'
    p =  -9;
    case '0000010111'
    p =  -8;
    case '00000111'
    p =  -7;
    case '00001001'
    p =  -6;
    case '00001011'
    p =  -5;
    case '0000111'
    p =  -4;
    case '00011'
    p =  -3;
    case '0011'
    p =  -2;
    case '011'
    p =  -1;
    case '1'
    p =  0;
    case '010'
    p = 1; 
    case '0010'
    p = 2; 
    case '00010'
    p = 3; 
    case '0000110'
    p = 4;
    case '00001010'
    p = 5;
    case '00001000'
    p = 6;
    case '00000110'
    p = 7;
    case '0000010110'
    p = 8;
    case '0000010100'
    p = 9;
    case '0000010010'
    p = 10;
    case '00000100010'
    p = 11;
    case '00000100000'
    p = 12;
    case '00000011110'
    p = 13;
    case '00000011100'
    p = 14;
    case '00000011010'
    p = 15;
    case '00000011000'
    p = 16;
    otherwise
    p = 100;    
  end

if p~=100 
  mvVLC{i} = bits;  
  pos =pos+step;
  break;
end
step = step-1;   
end
end





end