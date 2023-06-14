[x, Fs] = audioread('audio.wav');
n = 100;

% Design the of the drum filter
wn_drum = 500/(Fs/2); 
drum_fir = fir1(n, wn_drum); 

% Design of the piano filter
wn_piano = [500 4000]/(Fs/2);
piano_fir = fir1(n, wn_piano);

% Design of the cymbal filter
wn_cymbal = 4000/(Fs/2); 
cymbal_fir = fir1(n, wn_cymbal, 'high'); 

% Applying the filters
drum_filter = filter(drum_fir, 1, x);
piano_filter = filter(piano_fir, 1, x); 
cymbal_filter = filter(cymbal_fir, 1, x);

audiowrite('kick.wav', drum_filter, Fs);
audiowrite('piano.wav', piano_filter, Fs);
audiowrite('cymbal.wav', cymbal_filter, Fs);

% Magnitude frequencies
freqz(drum_fir, 1, 1024, fs);
title('Magnitude Frequency Response - Drum Filter');

freqz(piano_fir, 1, 1024, fs);
title('Magnitude Frequency Response - Piano Filter');

freqz(cymbal_fir, 1, 1024, fs);
title('Magnitude Frequency Response - Cymbal Filter');

t = (0:length(x)-1)/Fs; 

% Original 
subplot(2,2,1);
plot(t, x);
title('Original');
xlabel('Time (s)');
ylabel('Amplitude');

% Drum
subplot(2,2,2);
plot(t, y1);
title('Drum');
xlabel('Time (s)');
ylabel('Amplitude');

% Piano
subplot(2,2,3);
plot(t, y2);
title('Piano');
xlabel('Time (s)');
ylabel('Amplitude');

% Cymbal
subplot(2,2,4);
plot(t, y3);
title('Cymbal');
xlabel('Time (s)');
ylabel('Amplitude');


