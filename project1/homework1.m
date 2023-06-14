% Frequencies of notes:

% E = 329.63
% D# = 311.13
% B = 246.94
% D = 293.66
% C = 261.63
% A = 220.00
 
my_arr = rand(1,6);

% First four notes will be played for 0.2 seconds
% Last five notes will be played for 0.4 seconds
% there are 9 notes in total, which means in total, our wave will be 1.8
% seconds
srate = 44000;
note_sample1 = 0:1/srate:0.2;
note_sample2 = 0:1/srate:0.4;
amplitude = 0.25;
e_note = amplitude*sin(note_sample1 * 2 * pi * my_arr(1,6)*5000);
dsharp_note =  amplitude*sin(note_sample1 * 2 * pi * my_arr(1,5)*5000);

e_note_long = amplitude*sin(note_sample2 * 2 * pi * my_arr(1,6)*5000);
b_note_long = amplitude*sin(note_sample2 * 2 * pi * my_arr(1,4)*5000);
d_note_long = amplitude*sin(note_sample2 * 2 * pi * my_arr(1,3)*5000);
c_note_long = amplitude*sin(note_sample2 * 2 * pi * my_arr(1,2)*5000);
a_note_long = amplitude*sin(note_sample2 * 2 * pi * my_arr(1,1)*5000);

% this is just concatenation
melody = [e_note dsharp_note e_note dsharp_note e_note_long b_note_long d_note_long c_note_long a_note_long];

plot(melody);

sound(melody, srate)

audiowrite("zey.wav", melody, srate);