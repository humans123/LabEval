% MATLAB Code for Convolutions with Plotting
clc
clear all
% Define the input sequences
x = [1, 2, 3, 4];
h = [1, 2, 1, 2];

% Length of sequences
N_x = length(x);
N_h = length(h);
N_circ = max(N_x, N_h); % Length for circular convolution

% (a) Compute Circular Convolution manually
% Zero-pad sequences to length N_circ
x_padded = [x, zeros(1, N_circ - N_x)];
h_padded = [h, zeros(1, N_circ - N_h)];

% Circular Convolution
y_circ = zeros(1, N_circ);
for n = 0:N_circ-1;
    for m = 0:N_circ-1;
        y_circ(n+1) = y_circ(n+1) + x_padded(m+1) * h_padded(mod(n-m, N_circ) + 1);
    end
end

% (b) Compute Linear Convolution using Circular Convolution
% Pad sequences for linear convolution
N_lin = N_x + N_h - 1; % Length for linear convolution
x_padded_lin = [x, zeros(1, N_lin - N_x)];
h_padded_lin = [h, zeros(1, N_lin - N_h)];

% Circular Convolution on padded sequences
y_circ_lin = zeros(1, N_lin);
for n = 0:N_lin-1;
    for m = 0:N_lin-1;
        y_circ_lin(n+1) = y_circ_lin(n+1) + x_padded_lin(m+1) * h_padded_lin(mod(n-m, N_lin) + 1);
    end
end

% (c) Verify Circular Convolution using Linear Convolution
% Compute Linear Convolution directly
y_lin = conv(x, h);

% Wrap-around the result to match circular convolution length
y_lin_circ = [y_lin, zeros(1, N_circ - length(y_lin))]; % Padding to length N_circ

% (d) Compute Circular Convolution using DFT-IDFT method
% Compute DFTs
X = fft(x_padded);
H = fft(h_padded);

% Element-wise multiplication in frequency domain
Y = X .* H;

% Compute Inverse DFT
y_dft_idft = ifft(Y);

% Plotting
figure;

% Plot Circular Convolution
subplot(5,1,3);
stem(0:N_circ-1, y_circ, 'filled');
title('Circular Convolution (manual) 102206221');
xlabel('Index');
ylabel('Amplitude');
grid on;

% Plot Linear Convolution
subplot(5,1,4);
stem(0:N_lin-1, y_circ_lin, 'filled');
title('Linear Convolution using Circular Convolution 102206221');
xlabel('Index');
ylabel('Amplitude');
grid on;

% Plot DFT-IDFT Convolution
subplot(5,1,5);
stem(0:N_circ-1, real(y_dft_idft), 'filled');
title('Circular Convolution (DFT-IDFT method) 102206221');
xlabel('Index');
ylabel('Amplitude');
grid on;

subplot(5,1,1);
stem(x, 'filled');
title('x[n] 102206221');
xlabel('Index');
ylabel('Amplitude');
grid on;


subplot(5,1,2);
stem(h, 'filled');
title('h[n] 102206221');
xlabel('Index');
xlabel('Index');
ylabel('Amplitude');
grid on;