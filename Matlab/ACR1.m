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

g = 1:1:size_of_data;

data = s.hb(g);

acr = xcorr(data,data);

plot(lags,acr);
title('ACR vs Lags')
xlabel('Lags');
ylabel('ACR');