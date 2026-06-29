clear all; clc; addpath(genpath(pwd));
%% BUILD FINGERPRINT TEMPLATE DATABASE
%build_db2(4,3);        %THIS WILL TAKE ABOUT 30 MINUTES
load('db2.mat');

%% EXTRACT FEATURES FROM AN ARBITRARY FINGERPRINT
filename='ifat.jpg';
img = imread(filename);
figure; imshow(img); title("Original Image");
if ndims(img) == 3; img = rgb2gray(img); end 
figure; imshow(img); title("Grayscale Image");
% Color Images
disp(['Extracting features from ' filename ' ...']);
ffnew=ext_finger(img,1);

%% FOR EACH FINGERPRINT TEMPLATE, CALCULATE MATCHING SCORE IN COMPARISION WITH FIRST ONE
S=zeros(12,1);
for i=1:12
    second=['20060' num2str(fix((i-1)/3)+1+82) '_' num2str(mod(i-1,3)+1)];
    fprintf(['Computing similarity between ' filename ' and ' second ' from our fingerprints_jpg : ']);
    S(i)=match(ffnew,ff{i});
    fprintf([num2str(S(i)) '\n']);
    drawnow
end
%% OFFER MATCHED FINGERPRINTS
   Matched_FigerPrints=find(S>0.48)
if Matched_FigerPrints<=3 
    disp("The Person is 2006083-Rafatul Islam Tamim");
end
if Matched_FigerPrints>=4 & Matched_FigerPrints<=6  
    disp("The Person is 2006084-Iffat Islam Pinky");
end
if Matched_FigerPrints>=7 & Matched_FigerPrints<=9  
    disp("The Person is 2006085-Azwad Jahin Ifat");
end
if Matched_FigerPrints>=10 & Matched_FigerPrints<=12  
    disp("The Person is 2006086-Tabassum Shikder Promy");
end 