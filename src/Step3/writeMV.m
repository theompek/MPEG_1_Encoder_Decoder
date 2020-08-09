function writeMV(mV)
%Egrafh twn MV sto stream
global encodedStream;
global pos;
bits = mV{1};
for i=2:length(mV)
bits = strcat(bits,mV{i});
end
[encodedStream,pos]=pushstream(bits,encodedStream,pos);

end