%AIM-> MATLAB code to design a digital low-passButterworth filter
%using impulse invariance
%NAME-PARV NARULA
%ROLL_NO-102206221
%GRP_NO-3F23
%CODE FOR EXP-9
Fs=input("Enter the sampling frequency in Hz");
fp=input("Enter the passband edge frequency in Hz");
fs=input("Enter the stopband edge frequency in Hz");
Rp=input("Enter the passband ripple in dB");
As=input("Enter the stopband attenuation in dB");

Wp=2*Fs*tan(pi*fp/Fs);
Ws=2*Fs*tan(pi*fs/Fs);

N=ceil(log10((10^(As/10)-1)/(10^(Rp/10)-1))/(2*log10(Ws/Wp)));

Wc=Wp/((10^(Rp/10)-1)^(1/(2*N)));

[analog_b,analog_a]=butter(N,Wc,'s');

[b,a]=impinvar(analog_b,analog_a,Fs);

fprintf("digital Filter coefficients(b):/n");
disp(b);
fprintf("digital Filter coefficients(a):/n");
disp(a);

fvtool(b,a,"Fs",Fs);
title('Frequency Response of Digital low-pass Butterworth filter');
xlabel('Frequency(Hz)');
ylabel("Magnitude(dB)");
legend('102206221')

figure;
zplane(b,a);
legend('102206221')
title("Pole-Zero Plot of the Digital Filter");







