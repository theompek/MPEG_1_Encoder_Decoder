function vlcMV = mvVLC(dpcmMV)

P_or_B = size(dpcmMV,2);
vlcMV = cell(P_or_B , 1);

for j=1:P_or_B
 for i=1:2
   switch dpcmMV(i,j)
    case -16   
    p = '00000011001';
    case -15 
    p = '00000011011';
    case -14
    p = '00000011101' ;
    case -13
    p = '00000011111' ;
    case -12
    p = '00000100001' ;
    case -11
    p = '00000100011' ;
    case -10
    p = '0000010011' ;
    case -9
    p = '0000010101' ;
    case -8
    p = '0000010111' ;
    case -7
    p = '00000111' ;
    case -6
    p = '00001001' ;
    case -5
    p = '00001011' ;
    case -4
    p = '0000111' ;
    case -3
    p = '00011' ;
    case -2
    p = '0011' ;
    case -1
    p = '011' ;
    case 0
    p = '1' ;
    case 1
    p = '010'; 
    case 2
    p = '0010'; 
    case 3
    p = '00010'; 
    case 4
    p = '0000110' ;
    case 5
    p = '00001010' ;
    case 6
    p = '00001000';
    case 7
    p = '00000110' ;
    case 8
    p = '0000010110' ;
    case 9
    p = '0000010100' ;
    case 10
    p = '0000010010' ;
    case 11
    p = '00000100010' ;
    case 12
    p = '00000100000' ;
    case 13
    p = '00000011110' ;
    case 14
    p = '00000011100' ;
    case 15
    p = '00000011010' ;
    case 16
    p = '00000011000'; 
    otherwise
    p = 'NaN';   
   end
 vlcMV{i+(j-1)*2} = p;          
 end   
end

end