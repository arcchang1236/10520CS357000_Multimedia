function [outputSignal, outputFilter] = my_filter(inputSignal, fsample, N, windowName, filterName, fcutoff)
%%% Input 
% inputSignal: input signal
% fsample: sampling frequency
% N : size of FIR filter(odd)
% windowName: 'Blackmann'
% filterName: 'low-pass', 'high-pass', 'bandpass', 'bandstop' 
% fcutoff: cut-off frequency or band frequencies
%       if type is 'low-pass' or 'high-pass', para has only one element         
%       if type is 'bandpass' or 'bandstop', para is a vector of 2 elements

%%% Ouput
% outputSignal: output (filtered) signal
% outputFilter: output filter 

%% 1. Normalization
fcutoff(1) = fcutoff(1) / fsample;
fcutoff(2) = fcutoff(2) / fsample;
wcutoff = 2 * pi * fcutoff(1);
wcutoff2 = 2 * pi * fcutoff(2);
middle = floor(N / 2);


%% 2. Create the filter according the ideal equations (slide #76)

if strcmp(filterName,'low-pass') == 1
    for n = ceil(-N/2) : floor(N/2);
        if n == 0
            h(middle + 1) = 1;
        else
            h(n + middle + 1) = sin(wcutoff*n) / (pi*n);
        end
    end
    h(middle + 1) = 2 * fcutoff(1);
end

if strcmp(filterName,'high-pass') == 1
    for n = ceil(-N/2) : floor(N/2);
        if n == 0
            h(middle + 1) = 1;
        else
            h(n + middle + 1) = (-1) * sin(wcutoff*n) / (pi*n);
        end
    end
    h(middle + 1) = 1 - 2 * fcutoff(1);
end

if strcmp(filterName,'bandpass') == 1
    for n = ceil(-N/2) : floor(N/2);
        if n == 0
            h(middle + 1) = 1;
        else
            h(n + middle + 1) = (sin(wcutoff2*n) / (pi*n)) - (sin(wcutoff*n) / (pi*n));
        end
    end
    h(middle + 1) = 2 * (fcutoff(2) - fcutoff(1));
end

if strcmp(filterName,'bandstop') == 1
    for n = ceil(-N/2) : floor(N/2);
        if n == 0
            h(middle + 1) = 1;
        else
            h(n + middle + 1) = (sin(wcutoff*n) / (pi*n)) - (sin(wcutoff2*n) / (pi*n));
        end
    end
    h(middle + 1) = 1 - 2 * (fcutoff(2) - fcutoff(1));
end


%% 3. Create the windowing function (slide #80) and Get the realistic filter

if strcmp(windowName, 'Blackman') == 1
    for n = 1 : N;
        h(n) = h(n) * (0.42 - 0.5 * cos(2*pi*(n-1)/N) + 0.08 * cos(4*pi*(n-1)/N));
    end
end

outputFilter = h;

%% 4. Filter the input signal in time domain. Do not use matlab function 'conv'
outputSignal = zeros(length(inputSignal), 1);

for n = 1 : length(inputSignal);
    for k = 1 : N;
        if n - k <= 0
            outputSignal(n) = outputSignal(n) + 0;
        else
            outputSignal(n) = outputSignal(n) + h(k) * inputSignal(n-k);
        end
    end
end


