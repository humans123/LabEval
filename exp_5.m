clc
clear all
M=64;
n=0:M-1;
% rectangular window
rectangular=ones(1,M);

% barlett window
barlett=[2*n(1:M/2)/(M-1),2*(M-1-n(M/2+1:end))/(M-1)];

     %hanning
hanning = 0.5 - 0.5*cos(2*pi*n/(M-1));

%hamming
hamming = 0.54-0.46*cos(2*pi*n/(M-1));

%blackman
blackman = 0.42-0.5*cos(2*pi*n/(M-1))+0.08*cos(4*pi*n/(M-1));

% calculate frq responses
rect_spectrum = fftshift(abs(fft(rectangular,1024)));
bart_spectrum = fftshift(abs(fft(barlett,1024)));
hann_spectrum = fftshift(abs(fft(hanning,1024)));
hamm_spectrum = fftshift(abs(fft(hamming,1024)));
black_spectrum = fftshift(abs(fft(blackman,1024)));
f_pos=linspace(0.5,0,length(rect_spectrum)/2);

rect_spectrum = rect_spectrum/max(abs(rect_spectrum));
bart_spectrum = bart_spectrum/max(abs(bart_spectrum));
hann_spectrum = hann_spectrum/max(abs(hann_spectrum));
hamm_spectrum = hamm_spectrum/max(abs(hamm_spectrum));
black_spectrum = black_spectrum/max(abs(black_spectrum));

%plot time domain 
subplot(5,2,1);
plot(n,rectangular);
title('rectangular window');
xlabel('n');
ylabel('Magnitude');
legend('102206221')
subplot(5,2,3);
plot(n,barlett);
title('barlett window');
xlabel('n');
ylabel('Magnitude');
subplot(5,2,5);
plot(n,hanning);
title('hanning window');
xlabel('n');
ylabel('Magnitude');
subplot(5,2,7);
plot(n,hamming);
title('hamming window');
xlabel('n');
ylabel('Magnitude');
subplot(5,2,9);
plot(n,blackman);
title('blackman window');
xlabel('n');
ylabel('Magnitude');



%plot freq domain 
subplot(5,2,2);
plot(f_pos,20*log10(abs(rect_spectrum(1:length(f_pos)))));
title('rectangular window');
legend('102206221')
xlabel('n');
ylabel('Frequency(dB)');
subplot(5,2,4);
plot(f_pos,20*log10(abs(bart_spectrum(1:length(f_pos)))));
title('barlett window');
xlabel('n');
ylabel('Frequency(dB)');
subplot(5,2,6);
plot(f_pos,20*log10(abs(hann_spectrum(1:length(f_pos)))));
title('hanning window');
xlabel('n');
ylabel('Frequency(dB)');
subplot(5,2,8);
plot(f_pos,20*log10(abs(hamm_spectrum(1:length(f_pos)))));
title('hamming window');
xlabel('n');
ylabel('Frequency(dB)');
subplot(5,2,10);
plot(f_pos,20*log10(abs(black_spectrum(1:length(f_pos)))));
title('blackman window');
xlabel('n');
ylabel('Frequency(dB)');