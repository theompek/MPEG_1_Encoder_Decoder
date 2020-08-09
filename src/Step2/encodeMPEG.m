function encodeMPEG(bName, fExtension,startFrame,GoP, numOfGoPs, qScale)

if qScale<1||qScale>31
   warning('"qScale" have any value between 1 and 31 inclusive\n');
   return;
end

%Add the 'Step1' and 'images' folders to the top of the search path
%so that we can use the previous functions from folder 'Step1' and images
%from the folder 'images'
addpath(genpath('../Step1'));
addpath(genpath('../images'));

  %Paragwgh headers
Headers = genSeqHeader();
  %Ergrafh tou SeqHeader
SeqEntity.SeqHeader = writeSeqHeader(Headers);
SeqEntity.GoPEntityArray = encodeSeq(bName, fExtension, startFrame, GoP, numOfGoPs, qScale);
  %Egrafh tou SeqEnd
SeqEntity.SeqEnd = writeSeqEnd(Headers);

save('Stream','SeqEntity');

%Remove the paths
rmpath(genpath('../images'));
rmpath(genpath('../Step1'));

end

