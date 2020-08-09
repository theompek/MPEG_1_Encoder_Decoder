function Header = genPicSliceHeader3(temp_ref,pic_type,qScale)

%As a part of ISO/IEC 13818-2 specification and also
%according to pages 31-32 of the given mpg-video.pdf file,we have
Header.PicSliceHeader.picture_start_code = hex2bin32bits('00000100');
Header.PicSliceHeader.temporal_reference = uimsbf2bin(temp_ref,10);
Header.PicSliceHeader.picture_coding_type = uimsbf2bin(pic_type,3);
%slice_start_code from 00000101 to 000001AF,slice_vertical_position is given by the last eight bits
Header.PicSliceHeader.slice_start_code = hex2bin32bits('00000101') ;
Header.PicSliceHeader.quantizer_scale =  uimsbf2bin(qScale,5);

end
%{
-picture_start_code 32 bslbf
-temporal_reference 10 uimsbf :For the earliest picture (in display order) in each group of
pictures, the temporal_reference is reset to zero.
The temporal_reference is assigned (in sequence) to the pictures in display order, 
no temporal_reference shall be ommited from the sequence.
-picture_coding_type 3 uimsbf (1, 2, 3 ��� I, P, B frames ����������)
-slice_start_code 32 bslbf
-quantizer_scale 5 uimsbf
%}