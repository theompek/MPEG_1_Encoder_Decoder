function writeSeqEnd3(Headers)
global encodedStream;
global pos;

[encodedStream,pos]=pushstream(Headers.SecEnd.sequence_end_code,encodedStream,pos);
end