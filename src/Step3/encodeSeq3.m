function encodeSeq3(bName, fExtension, startFrame, GoP, numOfGoPs, qScale)

GoPsNum=0;
%Number of frames per GoP
pics_Per_GoP=length(GoP');
while true
frameNumber = pics_Per_GoP*GoPsNum;
GoPsNum=GoPsNum+1;

%Dhmiourgia twn GoPEntity
Header = genGoPHeader3();
writeGoPHeader3(Header);

t = encodeGoP3(frameNumber, bName, fExtension,startFrame, GoP, qScale);

%An teleiwsoun oi eikones h an paroume ton
%ka8orismeno ari8mo apo GoPs tote telos
if (t==0)||(numOfGoPs==GoPsNum)
 break;
end

end

end