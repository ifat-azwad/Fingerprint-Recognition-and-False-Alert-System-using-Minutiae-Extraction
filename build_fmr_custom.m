% GENERATING FMR AND FNMR DATA FOR CUSTOM 4-SUBJECT DATABASE
%
% Database structure:
%   12 fingerprints total
%   Subjects: 2006083, 2006084, 2006085, 2006086
%   3 fingerprints per subject
%   Index mapping:
%     Subject 2006083 → fingers 1, 2, 3
%     Subject 2006084 → fingers 4, 5, 6
%     Subject 2006085 → fingers 7, 8, 9
%     Subject 2006086 → fingers 10, 11, 12
%
% Usage: build_fmr_custom;

function build_fmr_custom()
    load('db2.mat');
    P   = 12;
    N   = 12;
    FPC = 3;

    fmr  = zeros(100, P);
    fnmr = zeros(100, P);

    for p = 1:P
        ffnew = ff{p};
        S = zeros(N, 1);
        for i = 1:N
            S(i) = match(ffnew, ff{i});
        end

        subject_idx  = fix((p - 1) / FPC);
        gt           = (subject_idx * FPC + 1) : (subject_idx * FPC + FPC);
        num_genuine  = FPC;
        num_impostor = N - FPC;

        k = 0;
        for a = 0.01 : 0.01 : 1
            k = k + 1;
            accepted        = find(S > a);
            genuine_accepts = 0;
            for i = 1:length(gt)
                genuine_accepts = genuine_accepts + sum(accepted == gt(i));
            end
            impostor_accepts = length(accepted) - genuine_accepts;
            fmr(k, p)  = impostor_accepts / num_impostor;
            fnmr(k, p) = 1 - genuine_accepts / num_genuine;
        end
        fprintf('Probe %d/%d done\n', p, P);
    end

    % Average across all probes
    mean_fmr_custom  = mean(fmr,  2);   % <-- consistent name
    mean_fnmr_custom = mean(fnmr, 2);   % <-- consistent name

    save('fmr_custom.mat',       'fmr');
    save('fnmr_custom.mat',      'fnmr');
    save('mean_fmr_custom.mat',  'mean_fmr_custom');
    save('mean_fnmr_custom.mat', 'mean_fnmr_custom');

    % Plot DET curve
    thresholds = 0.01 : 0.01 : 1;
    figure;
    plot(mean_fmr_custom, mean_fnmr_custom, 'b-o', 'LineWidth', 1.5);
    xlabel('FMR_custom (False Match Rate)');
    ylabel('FNMR_custom (False Non-Match Rate)');
    title('DET Curve — Custom Fingerprint Database');
    grid on;

    % EER
    [~, eer_idx] = min(abs(mean_fmr_custom - mean_fnmr_custom));
    eer_custom   = (mean_fmr_custom(eer_idx) + mean_fnmr_custom(eer_idx)) / 2;
    fprintf('EER_custom ≈ %.4f (threshold = %.2f)\n', eer_custom, thresholds(eer_idx));
end