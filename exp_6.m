% User input specifications
fp = input('Enter passband edge frequency (Hz): ');
tw = input('Enter transition width (Hz): ');
fs = input('Enter sampling frequency (Hz): ');
A = input('Enter stopband attenuation (dB): ');

% Normalized frequencies
wp = 2 * pi * fp / fs;  % Passband edge frequency (normalized)
ws = wp + 2 * pi * tw / fs;  % Stopband edg`e frequency (normalized)

% Calculate filter order (using Kaiser formula as an approximation)
delta_w = 2 * pi * tw / fs;
M = ceil((A - 8) / (2.285 * delta_w));

% Ensure filter order is odd for symmetry
if mod(M, 2) == 0
    M = M + 1;
end

% Calculate the ideal impulse response of the low-pass filter
n = 0:M-1;
h_ideal = (sin(wp * (n - (M-1)/2)) ./ (pi * (n - (M-1)/2)));
h_ideal((M-1)/2 + 1) = wp / pi; % Handle the singularity at n = (M-1)/2

% Rectangular window
rect_window = ones(1, M);

% Triangular window (Bartlett window)
tri_window = 1 - abs((n - (M-1)/2) / (M/2));

% Apply the windows to the ideal impulse response
h_rect = h_ideal .* rect_window;
h_tri = h_ideal .* tri_window;

% Frequency response of the filters
[H_rect, f_rect] = freqz(h_rect, 1, 1024, fs);
[H_tri, f_tri] = freqz(h_tri, 1, 1024, fs);

% Plot the results
figure;

% Rectangular window filter response
subplot(2,2,1);
stem(n, h_rect);
title('Impulse Response - Rectangular Window');
xlabel('n');
ylabel('h[n]');
legend('102206221');

subplot(2,2,2);
plot(f_rect, 20*log10(abs(H_rect)));
title('Magnitude Response - Rectangular Window');
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');
legend('102206221');
grid on;

% Triangular window filter response
subplot(2,2,3);
stem(n, h_tri);
title('Impulse Response - Triangular Window');
xlabel('n');
ylabel('h[n]');
legend('102206221');

subplot(2,2,4);
plot(f_tri, 20*log10(abs(H_tri)));
title('Magnitude Response - Triangular Window');
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');
legend('102206221');
grid on;