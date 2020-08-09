function encodeMPEG3(bName, fExtension,startFrame,GoP, numOfGoPs, qScale)

if qScale<1||qScale>31
   warning('"qScale" have any value between 1 and 31 inclusive\n');
   return;
end

%Add the 'Step1' and 'images' folders to the top of the search path
%so that we can use the previous functions from folder Step1 and images
%from the folder 'images'
addpath(genpath('../Step1'));
addpath(genpath('../images'));

global encodedStream;
global pos;
encodedStream=[];
pos=1;
%Paragwgh headers
Headers = genSeqHeader3();
%Ergrafh tou SeqHeader sto strem
writeSeqHeader3(Headers);
encodeSeq3(bName, fExtension, startFrame, GoP, numOfGoPs, qScale);
%Egrafh tou SeqEnd sto stream
writeSeqEnd3(Headers);

save('Stream','encodedStream');

%Remove the paths
rmpath(genpath('../images'));
rmpath(genpath('../Step1'));

end

