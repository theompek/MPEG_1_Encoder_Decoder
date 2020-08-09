function bits = uimsbf2bin(uimsbf,N)
%Metatroph enos uimsbf ari8mou se binary-string ari8mo mege8ous N
%i.e uimsbf2bin(3,5) -> bin = 00011,epishs uimsbf2bin(3,8) -> bin = 00000011

%Xrhsimopoieitai gia thn metatroph twn headers se bits

bits = dec2bin(uimsbf);
K = size(bits,2);

for i=1:N-K 
bits = strcat('0',bits);
end
end