folder = './';
fullMatFileName = fullfile(folder,  'HUM3HB.mat');
if ~exist(fullMatFileName, 'file')
  message = sprintf('%s does not exist', fullMatFileName);
  uiwait(warndlg(message));
else
  s = load(fullMatFileName);
end

size_of_data = size(s.hb,2);

tm = (size_of_data-1)*s.T;

lags = 0:s.T:2*tm;

data = s.hb(1:1:size_of_data);
x = data;
x = x';

n = size_of_data;
fx = fft([x; zeros(n,1)]);

x2 = ifft(fx.*conj(fx));
acr = [x2(n+2:end); x2(1:n)];

plot(lags,acr);
title('ACR vs Lags')
xlabel('Lags');
ylabel('ACR');