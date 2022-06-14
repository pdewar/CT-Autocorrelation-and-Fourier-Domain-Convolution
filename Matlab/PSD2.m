folder = './';
fullMatFileName = fullfile(folder,  'HUM3HB.mat');
if ~exist(fullMatFileName, 'file')
  message = sprintf('%s does not exist', fullMatFileName);
  uiwait(warndlg(message));
else
  s = load(fullMatFileName);
end

size_of_data = size(s.hb,2);

Fs = 1/s.T;

data = s.hb(1:1:size_of_data);
x = data;
x = x';

n = size_of_data;
fx = fft([x; zeros(n,1)]);
fx = [fx(n+1:end); fx(1:n)];
power = abs(fx.^2);

power_size = length(power);
frequency = -Fs/2 : Fs/power_size : (Fs/2)-(Fs/power_size);

plot(frequency,power);
title('Power vs Frequency')
xlabel('Frequency');
ylabel('Power');
