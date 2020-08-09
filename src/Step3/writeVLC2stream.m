function writeVLC2stream(VLCodes)
%Egrafh twn VLCcode sto stream

global encodedStream;
global pos;

[encodedStream,pos]=pushstream(VLCodes,encodedStream,pos);

end