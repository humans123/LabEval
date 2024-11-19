%NAME-PARV NARULA
%ROLL_NO-102206221
%GRP_NO-3F23
%CODE FOR EXP-8
clc
clear all
fp1=input('Enter passband edge frequency 1: ');
fp2=input('Enter passband edge frequency 2: ');
df1=input('Enter transition width: ');
fs=input('Enter sampling frequency: ');
att=input('Enter Stopband attenuation: ');
rip=input('Enter Passband ripple: ');
L=input('Enter L: ');
fp=fp1/fs;
fpp=fp2/fs;
df=df1/fs;
dp=(10.^(rip/20))-1;
ds=(10.^(-att/20));
d=min(dp,ds);
A=-20*log10(d);
if A<=21
beta=0;
elseif A>=21 && A<=50
beta=0.584*((A-21)^0.4)+0.07886*(A-21);
else
beta=0.1102*(A-8.7);
end
X=(A-7.95)/(14.36*df);
N=ceil(X);
if mod(N,2) == 0 N=N+1;
else N=N;
end
for n=-(N-1)/2:(N-1)/2
x(n+((N-1)/2)+1)=beta*((1-(2*n/(N-1))^2))^0.5;
x1(n+((N-1)/2)+1)=beta;
for k=1:L
y(k)=((((x(n+((N-1)/2)+1)/2).^k)./factorial(k)).^2);
end
Y(n+((N-1)/2)+1)=sum(y);
for k=1:L
y1(k)=((((x1(n+((N-1)/2)+1)/2).^k)./factorial(k)).^2);
end
Y1(n+((N-1)/2)+1)=sum(y1);
I(n+((N-1)/2)+1)=1+Y(n+((N-1)/2)+1);
I1(n+((N-1)/2)+1)=1+Y1(n+((N-1)/2)+1);
end
w=I./I1;
f1=fp+df/2;
f2=fpp+df/2;
h1=2*(f2-f1);
for n=1:(N-1)/2
h2(n)=(((2*f2)*sin(2*n*pi*f2))/(2*n*pi*f2))-(((2*f1)*sin(2*n*pi*f1))/(2*n*pi*f1));
end
h3=fliplr(h2);
hd=[h3 h1 h2];
hh=hd.*w;
subplot(2,1,1);
[x2]=fft(w,1000);
a2=(20*log10(abs(x2)/max(x2))); y1=(0:1000-1).*(2*pi/fs);
plot(y1,a2)
title('Kaiser Window Response 102206221')
xlabel('Normalized Frequency')
ylabel('Magnitude in dB')
legend("102206221")
subplot(2,1,2);
[x3]=fft(hh,1000);
a3=(20*log10(abs(x3)/max(x3)));
plot(y1,a3)
title('Filter Response 102206221')
xlabel('Normalized Freuqency')
ylabel('Magnitude in dB')
legend("102206221")