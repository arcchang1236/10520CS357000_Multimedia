    %%% HW2_Q1.m - Complete the procedure of separating HW2_mix.wav into 3 songs

%% Clean variables and screen
close all;
clear;
clc;

%% Visualization parameters (Change it if you want)
% Some Tips:
% (Tip 1) You can change the axis range to make the plotted result more clearly 
% (Tip 2) You can use subplot function to show multiple spectrums / shapes in one figure
titlefont = 15;
fontsize = 13;
LineWidth = 1.5;

%% 1. Read in input audio file ( audioread )
% y_input: input signal, fs: sampling rate
[y_input, fs] = audioread('audio/HW2_Mix.wav');

%%% Plot example : plot the input audio
% The provided function "make_spectrum" generates frequency
% and magnitude. Use the following example to plot the spectrum.
[frequency, magnitude] = make_spectrum(y_input, fs);
plot(frequency, magnitude, 'LineSmoothing', 'on', 'LineWidth', LineWidth); 
title('Input', 'fontsize', titlefont);
set(gca, 'fontsize', fontsize)
xlim([0 2000])

%% 2. Filtering 
% (Hint) Implement my_filter here
% [...] = my_filter(...);
[song1Signal, song1Filter] = my_filter(y_input, fs, 600, 'Blackman', 'low-pass', [200, 0]);
[song2Signal, song2Filter] = my_filter(y_input, fs, 600, 'Blackman', 'bandpass', [500, 700]);
[song3Signal, song3Filter] = my_filter(y_input, fs, 600, 'Blackman', 'high-pass', [900, 0]);

%%% Plot the shape of filters in Time domain

figure
plot((1:601), song1Filter); 
title('Song1 Filter Time', 'fontsize', titlefont);
xlim([0 600])

figure
plot((1:601), song2Filter); 
title('Song2 Filter Time', 'fontsize', titlefont);
xlim([0 600])

figure
plot((1:601), song3Filter); 
title('Song3 Filter Time', 'fontsize', titlefont);
xlim([0 600])

%%% Plot the spectrum of filters (Frequency Analysis)

figure
[frequency1, magnitude1] = make_spectrum(song1Filter, fs);
plot(frequency1, magnitude1, 'LineSmoothing', 'on', 'LineWidth', LineWidth);
title('Song1 Filter Freq', 'fontsize', titlefont);
set(gca, 'fontsize', fontsize)
xlim([0 1500])

figure
[frequency2, magnitude2] = make_spectrum(song2Filter, fs);
plot(frequency2, magnitude2, 'LineSmoothing', 'on', 'LineWidth', LineWidth);
title('Song2 Filter Freq', 'fontsize', titlefont);
set(gca, 'fontsize', fontsize)
xlim([0 1500])

figure
[frequency3, magnitude3] = make_spectrum(song3Filter, fs);
plot(frequency3, magnitude3, 'LineSmoothing', 'on', 'LineWidth', LineWidth);
title('Song3 Filter Freq', 'fontsize', titlefont);
set(gca, 'fontsize', fontsize)
xlim([0 1500])

%% 3. Save the filtered audio (audiowrite)
% Name the file 'FilterName_para1_para2.wav'
% para means the cutoff frequency that you set for the filter

audiowrite('audio\low_pass_200.wav', song1Signal, fs);
audiowrite('audio\band_pass_500_700.wav', song2Signal, fs);
audiowrite('audio\high_pass_900.wav', song3Signal, fs);
%%% Plot the spectrum of filtered signals

figure
[frequency1, magnitude1] = make_spectrum(song1Signal, fs);
plot(frequency1, magnitude1, 'LineSmoothing', 'on', 'LineWidth', LineWidth); 
title('Song1 Signal', 'fontsize', titlefont);
set(gca, 'fontsize', fontsize)
xlim([0 1500])

figure
[frequency2, magnitude2] = make_spectrum(song2Signal, fs);
plot(frequency2, magnitude2, 'LineSmoothing', 'on', 'LineWidth', LineWidth); 
title('Song2 Signal', 'fontsize', titlefont);
set(gca, 'fontsize', fontsize)
xlim([0 1500])

figure
[frequency3, magnitude3] = make_spectrum(song3Signal, fs);
plot(frequency3, magnitude3, 'LineSmoothing', 'on', 'LineWidth', LineWidth); 
title('Song3 Signal', 'fontsize', titlefont);
set(gca, 'fontsize', fontsize)
xlim([0 1500])

%player1 = audioplayer(song1Signal, fs);
%play(player1);

