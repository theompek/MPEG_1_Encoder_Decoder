function decodeSeq3(outFName)

global pos;
[group_start_code,pos ] =readstreamBits(32,pos);

while( strcmp(group_start_code,hex2bin32bits('000001B8')) )
decodeGoP3(outFName);
[group_start_code,pos ] =readstreamBits(32,pos);
end
%Gia to teleutaio diabasma tou group_start_code
pos =pos-32;
end