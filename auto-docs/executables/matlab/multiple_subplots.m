% Learn about API authentication here: {{BASE_URL}}/matlab/getting-started
% Find your api_key here: {{BASE_URL}}/settings/api

signin('TestBot', 'r1neazxo9w')
trace1 = struct(...
  'x', [1, 2, 3], ...
  'y', [4, 5, 6], ...
  'type', 'scatter');
trace2 = struct(...
  'x', [20, 30, 40], ...
  'y', [50, 60, 70], ...
  'xaxis', 'x2', ...
  'yaxis', 'y2', ...
  'type', 'scatter');
trace3 = struct(...
  'x', [300, 400, 500], ...
  'y', [600, 700, 800], ...
  'xaxis', 'x3', ...
  'yaxis', 'y3', ...
  'type', 'scatter');
trace4 = struct(...
  'x', [4000, 5000, 6000], ...
  'y', [7000, 8000, 9000], ...
  'xaxis', 'x4', ...
  'yaxis', 'y4', ...
  'type', 'scatter');
data = {trace1, trace2, trace3, trace4};
layout = struct(...
    'xaxis', struct('domain', [0, 0.45]), ...
    'yaxis', struct('domain', [0, 0.45]), ...
    'xaxis4', struct(...
      'domain', [0.55, 1], ...
      'anchor', 'y4'), ...
    'xaxis3', struct(...
      'domain', [0, 0.45], ...
      'anchor', 'y3'), ...
    'xaxis2', struct('domain', [0.55, 1]), ...
    'yaxis2', struct(...
      'domain', [0, 0.45], ...
      'anchor', 'x2'), ...
    'yaxis3', struct('domain', [0.55, 1]), ...
    'yaxis4', struct(...
      'domain', [0.55, 1], ...
      'anchor', 'x4'));
response = plotly(data, struct('layout', layout, 'filename', 'multiple-subplots', 'fileopt', 'overwrite'));
plot_url = response.url
