function writePicSliceHeader3(Header)
global encodedStream;
global pos;

bitsSequence = Header.PicSliceHeader.picture_start_code;
bitsSequence = strcat(bitsSequence,Header.PicSliceHeader.temporal_reference);
bitsSequence = strcat(bitsSequence,Header.PicSliceHeader.picture_coding_type);
bitsSequence = strcat(bitsSequence,Header.PicSliceHeader.slice_start_code);
bitsSequence = strcat(bitsSequence,Header.PicSliceHeader.quantizer_scale);
 
[encodedStream,pos]=pushstream(bitsSequence,encodedStream,pos);
end