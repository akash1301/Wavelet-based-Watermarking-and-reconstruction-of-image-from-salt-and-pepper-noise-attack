close all;

cover_image=imread('E:\Thesis\Dataset\standard_test_images\standard_test_images\peppers_color.png');
watermark_image=imread('E:\Thesis\Dataset\standard_test_images\standard_test_images\mandril_color.png');
alpha=.3;beta=.3;

cover_image2=double(cover_image);

figure, imshow(watermark_image), title ('Water Mark image');
% figure, imhist(watermark_image), title('Histogram of water mark image');
figure, imshow(cover_image), title('Cover image');

watermarked_image=watermarkEmbedding(cover_image,watermark_image,alpha,beta);

figure, imshow(watermarked_image/255), title('Watermarked Image');
% figure, imshow(imabsdiff(cover_image2(:,:,1),watermarked_image(:,:,1))), title('Difference of cover after embedding Red plane');
% figure, imshow(imabsdiff(cover_image2(:,:,2),watermarked_image(:,:,2))), title('Difference of cover after embedding Green plane');
% figure, imshow(imabsdiff(cover_image2(:,:,3),watermarked_image(:,:,3))), title('Difference of cover after embedding Blue plane');  

watermarked_imagee = uint8(watermarked_image);

wi=imnoise(watermarked_imagee,'salt & pepper',.01);
figure, imshow(uint8(wi)), title('With noise');

watermark_image_again=uint8(watermarkExtraction(cover_image,wi,alpha,beta));

meanans=modifiedMedianFiltering(watermark_image_again,0,255);

[msee,psnrr]=msePsnrCalc(meanans,watermark_image);
disp("With Filter");
disp("MSE = "+msee);
disp("PSNR = "+psnrr);

[msee2,psnrr2]=msePsnrCalc(watermark_image_again,watermark_image);
disp("Without Filter");
disp("MSE = "+msee2);
disp("PSNR = "+psnrr2);
figure, imshow(watermark_image_again), title('Water mark image after extraction with noise');
figure, imhist(watermark_image_again), title('Histogram of watermark extraction image with noise');

figure, imshow(meanans), title('Water mark image after extraction');
figure, imhist(meanans), title('Histogram of water mark image after extraction');
% figure, imshow(imabsdiff(double(watermark_image(:,:,1)),watermark_image_again(:,:,1))), title('Difference of watermark after extraction Red plane');
% figure, imshow(imabsdiff(double(watermark_image(:,:,2)),watermark_image_again(:,:,2))), title('Difference of watermark after extraction Green plane');
% figure, imshow(imabsdiff(double(watermark_image(:,:,3)),watermark_image_again(:,:,3))), title('Difference of watermark after extraction Blue plane');

