function writeMBHeader3(Header)
global encodedStream;
global pos;

bits = Header.MBHeader.macroblock_type;
bits = strcat(bits,Header.MBHeader.quantizer_scale); 
[encodedStream,pos]=pushstream(bits,encodedStream,pos);
end