%NAME-PARV NARULA
%ROLL_NO-102206221
%GRP_NO-3F23
%CODE FOR EXP-7
clc;
clear all;
rp=input('enter the passband ripple:');%0.02
rs=input('enter the stopband attenuation:');%0.01
fp=input('enter the passband freq:'); %1500
fs=input('enter the stopband freq:');%2000
f=input('enter the sampling freq:');%6000
wp=2*fp/f;
ws=2*fs/f;
num=-20*log10(sqrt(rp*rs))-13;
dem=14.6*(fs-fp)/f;
n=ceil(num/dem);
n1=n+1;
if (rem(n,2)~=0)
n1=n;
n=n-1;
end
y1=hamming(n1);
y2=hann(n1);
% high-pass filter
%hamming
b=fir1(n,wp,'high',y1);
[h,o]=freqz(b,1,256);
m=20*log10(abs(h));
figure;plot(o/pi,m);
title('FIR Filter Response using hamming window 102206221');
ylabel('Gain in dB');
xlabel('Normalised frequency');
legend("102206221");
%hanning
b=fir1(n,wp,'high',y2);
[h,o]=freqz(b,1,256);
m=20*log10(abs(h));
figure;plot(o/pi,m);
title('FIR Filter Response using Hanning window 102206221');
ylabel('Gain in dB');
xlabel('Normalised frequency')
legend("102206221");