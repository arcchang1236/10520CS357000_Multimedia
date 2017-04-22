function [S, F, T] = my_stft(x, segment_duration, segment_overlap, samplerate)
% my_stft:
% input
% x: The target signal.
% segment_duration: The number of samples of each segment.
% segment_overlap: The number of samples overlapping on two adjacent segments.
%
% output
% S: Short-time Fourier transform, returned as a matrix. Time increases across the columns of S and frequency increases down the rows, starting from zero.
% F: Cyclical frequencies, returned as a vector. F has a length equal to the number of rows of S.
% T: Time instants, returned as a vector. The time values in T correspond to the midpoint of each segment.

%% Your implementation

now = 1;
N = size(x);
for i = 1 : (segment_duration - segment_overlap - 1) : (N - segment_duration);
    % Step 1. Slicing the signal
    tmp = x(i : i+segment_duration-1);
    % Step 2. Hanning window function
    tmp = tmp .* hann(segment_duration);
    % Step 3. Do FFT for each segment
    FFT = fft(tmp);
    % Step 4. Aggregate FFT result of each segment into a matrix S
    T(now) = floor(i + segment_duration/2);
    S(:, now) = FFT(:);
    now = now + 1;
end

T = T / samplerate;
F = (0:now-1)*samplerate/segment_duration;

end