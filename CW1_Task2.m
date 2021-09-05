
%Task2

% Load base image of size 800x800

image1=imread('img1.jpg');

% Load watermarking image of size 100x100 (Manually resized to 1/8th of
% cover image)

image2=imread('img2.jpg');

% convert image to binary

b_img=imbinarize(image2);

%Define variables

Q=(8:40);
k='';
C=[32,33]; 
Q_array=zeros(33,1);

%run function in for loop

for i=1:33
    embed_wm=watermark_embed(image1,b_img,k,C,Q(i));
    %disp(Q(i))
    Q_array(i)=PSNR(embed_wm,image1);
    %disp(Q_array(i))
end

%Plot the graph

plot(Q,Q_array)
xlabel('Q');
ylabel('PSNR Values');
