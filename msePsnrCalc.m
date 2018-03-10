function [ avg_mse,avg_psnr ] = msePsnrCalc( imagee1,imagee2 )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

[row,col,band]=size(imagee1);

sz=row*col;
imdb1=double(imagee1);
imdb2=double(imagee2);

avg_mse=0;
avg_psnr=0;

for i=1:band
    msee=0.0;
    for j=1:row
        for k=1:col
            msee=msee + (((imdb1(j,k,i)-imdb2(j,k,i))^2)/(row*col));
        end
    end
%     msee=msee/double(row);
%     msee=msee/double(col);
    psnrr=10*log10((255)^2/msee);
    avg_mse=avg_mse+msee;
    avg_psnr=avg_psnr+psnrr;
end

avg_mse=avg_mse/double(band);
avg_psnr=avg_psnr/double(band);

end

