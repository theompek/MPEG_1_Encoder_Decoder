function writeSeqHeader3(Headers)

global encodedStream;
global pos;

[encodedStream,pos]=pushstream(Headers.SeqHeader.sequence_header_code,encodedStream,pos);
end


