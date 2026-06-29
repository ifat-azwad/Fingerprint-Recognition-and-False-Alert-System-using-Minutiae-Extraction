clear all; clc; addpath(genpath(pwd));

%% PLOT FMR & FNMR — Custom Database
load('fmr_custom.mat');
load('fnmr_custom.mat');

figure, hold on;

afmr_custom  = mean(fmr,  2);
afnmr_custom = mean(fnmr, 2);

plot(0.01:.01:1, afmr_custom,  'b', 'LineWidth', 2);
plot(0.01:.01:1, afnmr_custom, 'r', 'LineWidth', 2);

% Find EER (crossing point)
[~, eer_idx]   = min(abs(afmr_custom - afnmr_custom));
eer_threshold  = eer_idx * 0.01;
eer_value      = (afmr_custom(eer_idx) + afnmr_custom(eer_idx)) / 2;

% Find Zero FMR threshold (first point where FMR == 0)
zero_fmr_idx   = find(afmr_custom == 0, 1, 'first');
zero_fmr_thresh = zero_fmr_idx * 0.01;

% Annotations
text(eer_threshold + 0.02, afnmr_custom(eer_idx) + 0.05, ...
     '\leftarrow FNMR', 'HorizontalAlignment', 'left');
text(eer_threshold - 0.02, afmr_custom(eer_idx) + 0.05, ...
     'FMR \rightarrow', 'HorizontalAlignment', 'right');

if ~isempty(zero_fmr_idx)
    plot([zero_fmr_thresh zero_fmr_thresh], [0.01 0.95], '-.m');
    text(zero_fmr_thresh - 0.01, 0.97, 'Zero FMR', 'HorizontalAlignment', 'right');
end

text(eer_threshold, eer_value - 0.06, 'EER', 'HorizontalAlignment', 'center');

fprintf('EER ≈ %.4f at threshold = %.2f\n', eer_value, eer_threshold);

xlabel('Similarity Score');
ylabel('Rate');
title('FMR & FNMR — Custom Fingerprint Database');
legend('FMR', 'FNMR', 'Location', 'east');
grid on;