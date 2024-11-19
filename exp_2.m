clc
clear all
x = [1, 2, 3,4,5];   
h = [-2,-1,1,2];      

M = length(x);
N = length(h);
L = M + N - 1;
y = zeros(1, L);
z=conv(x,h);
subplot(4,1,1);
stem(x);
title('x(n), 102206221');
subplot(4,1,2);
stem(h);
title('h(n), 102206221');
for n = 1:L;
    sum = 0;
    for k = 1:M;
        j = n - k + 1;    
        if j > 0 && j <= N;
            sum = sum + x(k) * h(j);
        end
    end
    y(n) = sum;
end
disp('The linear convolution of the sequences is:');
disp(y);                                                                                     
subplot(4,1,3);
stem(y);
title('y(n), 102206221');
subplot(4,1,4);
stem(z);
title('y(n), 102206221');