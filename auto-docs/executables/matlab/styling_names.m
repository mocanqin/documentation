% Learn about API authentication here: {{BASE_URL}}/matlab/getting-started
% Find your api_key here: {{BASE_URL}}/settings/api

signin('TestBot', 'r1neazxo9w')
trace1 = struct(...
  'x', [0, 1, 2, 3, 4, 5, 6, 7, 8], ...
  'y', [0, 1, 2, 3, 4, 5, 6, 7, 8], ...
  'name', 'Name of Trace 1', ...
  'type', 'scatter');
trace2 = struct(...
  'x', [0, 1, 2, 3, 4, 5, 6, 7, 8], ...
  'y', [1, 0, 3, 2, 5, 4, 7, 6, 8], ...
  'name', 'Name of Trace 2', ...
  'type', 'scatter');
data = {trace1, trace2};
layout = struct(...
    'title', 'Plot Title', ...
    'xaxis', struct(...
      'title', 'x Axis', ...
      'titlefont', struct(...
        'family', 'Courier New, monospace', ...
        'size', 18, ...
        'color', '#7f7f7f')), ...
    'yaxis', struct(...
      'title', 'y Axis', ...
      'titlefont', struct(...
        'family', 'Courier New, monospace', ...
        'size', 18, ...
        'color', '#7f7f7f')));
response = plotly(data, struct('layout', layout, 'filename', 'styling-names', 'fileopt', 'overwrite'));
plot_url = response.url
