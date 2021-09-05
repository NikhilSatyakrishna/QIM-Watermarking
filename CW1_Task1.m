
%Task1

% Load base image of size 800x800

image1=imread('img1.jpg');

% Load watermarking image of size 100x100 (Manually resized to 1/8th of
% cover image)

image2=imread('img2.jpg');

% convert image to binary

b_img=imbinarize(image2);

%Define variables

Q=9;
k='pass123';
wm_string='thiscwishard';
string_size=12;
w_size=[100,100];
C=[32,33];

%Embed Functions

wm_embed=watermark_embed(image1,wm_string,k,C,Q);
wm_embed2=watermark_embed(image1,b_img,k,C,Q);

%Extract functions

wm_extract=watermark_extract(wm_embed,string_size,k,C,Q);
wm_extract2=watermark_extract(wm_embed2,w_size,k,C,Q);

%Display extracted watermark string

fprintf('\n %s is the extracted textual string.\n',wm_extract);

%Compare extracted watermarks with watermark image/string 

if isequal(wm_extract,wm_string)&&isequal(wm_extract2,b_img)==true
    fprintf(' \n The embeded and extracted watermarks are identical.\n');
end

%Display Images

figure;
imshow(b_img)
title('Binary Watermark');
figure;
imshow(wm_embed2)
title('Cover Image With Watermark');
figure;
imshow(wm_extract2)
title('Extracted Watermark');
