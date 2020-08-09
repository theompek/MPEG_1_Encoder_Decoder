function decodeMPEG3(fName, outFName)

%Add the 'Step1' folders to the top of the search path
%so that we can use the previous functions from folder Step1
addpath(genpath('../../Step1'));
addpath(genpath('../'));
global encodedStream;
global pos;
encodedStream=[];
pos=1;
load(fName);
%Metatrepoume ton pinaka apo thn kwdikopoihsh se enan pinaka string
%pou periexei ton diadikou kwdika gia na kanoume pio grhgorh prospelash
[encodedStream, ~]= readstream(encodedStream,length(encodedStream)*8,1);

[sequence_header_code,pos ] =readstreamBits(32,pos);
if(strcmp(sequence_header_code,hex2bin32bits('000001B3')))
    
    decodeSeq3(outFName);
end

%Termatismos apokwdikopoihshs
[sequence_end_code,pos ] =readstreamBits(32,pos);
if(strcmp(sequence_end_code,hex2bin32bits('000001B7')))
    display('Anagnwsh kwdikou telous sequence')
    display('Termatismos apokwdikopoihshs me epityxeia')
    display('Fakelos apotelesmatwn eikonwn "saveImages"')
end


rmpath(genpath('../'));
rmpath(genpath('../../Step1'));

end