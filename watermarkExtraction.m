function [ watermark_imagee ] = watermarkExtraction( cover_image,watermarked_image,alpha,beta )

[llc,lhc,hlc,hhc]=applyDWT(cover_image);

[llw,lhw,hlw,hhw]=applyDWT(watermarked_image);

L_average=lhc+hlc;
L_average=L_average+hhc;
L_average=L_average./3;

dcmodi(:,:,1)=dct2(llw(:,:,1));
dcmodi(:,:,2)=dct2(llw(:,:,2));
dcmodi(:,:,3)=dct2(llw(:,:,3));

dl(:,:,1)=dct2(L_average(:,:,1));
dl(:,:,2)=dct2(L_average(:,:,2));
dl(:,:,3)=dct2(L_average(:,:,3));

dc(:,:,1)=dct2(llc(:,:,1));
dc(:,:,2)=dct2(llc(:,:,2));
dc(:,:,3)=dct2(llc(:,:,3));

dlmodi(:,:,1)=(dcmodi(:,:,1) - dc(:,:,1))./beta;
dlmodi(:,:,2)=(dcmodi(:,:,2) - dc(:,:,2))./beta;
dlmodi(:,:,3)=(dcmodi(:,:,3) - dc(:,:,3))./beta;

dw(:,:,1)=(dlmodi(:,:,1) - dl(:,:,1))./alpha;
dw(:,:,2)=(dlmodi(:,:,2) - dl(:,:,2))./alpha;
dw(:,:,3)=(dlmodi(:,:,3) - dl(:,:,3))./alpha;

watermark_imagee(:,:,1)=idct2(dw(:,:,1));
watermark_imagee(:,:,2)=idct2(dw(:,:,2));
watermark_imagee(:,:,3)=idct2(dw(:,:,3));

end

