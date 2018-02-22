%Recording of audio samples
%Rijk van Wijk & Nicolaas du Plessis

ID=findInDevID('Microphone (Realtek High Definition Audio) (Windows DirectSound)');

Fs_TX=22050;
x=zeros(1,Fs_TX);
for ii = 1:Fs_TX/10:Fs_TX
    x(ii)=1;
end
xObj=audioplayer(x,Fs_TX);

%Play and record signal
Fs_RX=22050;
recObj=audiorecorder(Fs_RX,16,2,ID);
play(xObj)
recordblocking(recObj,1);
y1=getaudiodata(recObj);

pause;

%Play and record signal
Fs_RX=22050;
recObj=audiorecorder(Fs_RX,16,2,ID);
play(xObj)
recordblocking(recObj,1);
y2=getaudiodata(recObj);

pause;

%Play and record signal
Fs_RX=22050;
recObj=audiorecorder(Fs_RX,16,2,ID);
play(xObj)
recordblocking(recObj,1);
y3=getaudiodata(recObj);