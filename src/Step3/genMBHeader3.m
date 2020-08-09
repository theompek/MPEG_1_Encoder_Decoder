function Header = genMBHeader3(mbType,qScale)

Header.MBHeader.macroblock_type = uimsbf2bin(mbType,3) ;
Header.MBHeader.quantizer_scale = uimsbf2bin(qScale,5) ;
end