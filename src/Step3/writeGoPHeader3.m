function writeGoPHeader3(Header)
global encodedStream;
global pos;

[encodedStream,pos]=pushstream(Header.GoPHeader.group_start_code,encodedStream,pos);
end