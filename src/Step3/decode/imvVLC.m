function dpcmMV = imvVLC(vlcMV, picType)

if picType==2
dpcmMV = [0;0];
else
dpcmMV = [0 0;0 0];
end

for j=1:picType-1
 for i=1:2
  switch vlcMV{i+(j-1)*2}
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
    p = NaN;    
   end
 dpcmMV(i,j) = p;
 end
end

end