clc
clear all
x = [1,2,3,4,5];
n = length(x);
X = zeros(1,n);

for k = 0:n-1;
    for m = 0:n-1;
        X(k+1) = X(k+1)+ x(m+1)*exp((-j*2*pi*k*m)/n);
    end
end
disp(X);
fft(x,n);
subplot(2,2,1);  
stem(0:n-1,abs(X));
title('magnitude spectrum 102206221');
xlabel('frequency');
ylabel('|X(k)|');

subplot(2,2,2);
stem(0:n-1,x,'filled');
title('input sequence 102206221');
xlabel('frequency');
ylabel('X(n)');

subplot(2,2,3);
stem(0:n-1,angle(X));
title('Phase spectrum 102206221');
xlabel('frequency');
ylabel('Phase(X(k))');

x_reconstruct = zeros(1:n);

for p = 0:n-1;
   for q = 0:n-1;
       x_reconstruct(p+1) = x_reconstruct(p+1)+ X(q+1)*exp((j*2*pi*q*p)/n);
   end
end
x_reconstruct = x_reconstruct/n;
disp(x_reconstruct);
ifft(X,n)

subplot(2,2,4);
stem(0:n-1,abs(ifft(X,n)),'filled');
title('IDFT Formula 102206221');
xlabel('frequency');
ylabel('|X(k)|');