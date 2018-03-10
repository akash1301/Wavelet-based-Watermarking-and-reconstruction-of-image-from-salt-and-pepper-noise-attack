function watermarked_image = watermarkEmbedding(cover_image,watermark_image,alpha,beta)


[ll,lh,hl,hh] = applyDWT(cover_image);

% figure, imshow(watermark_image), title ('Water Mark image');
% figure, imshow(cover_image), title('Cover image');
% figure, imshow(ll/255), title('LL sub band after first dwt');
% figure, imshow(lh), title('LH sub band after first dwt');
% figure, imshow(hl), title('Hl sub band after first dwt');
% figure, imshow(hh), title('HH sub band after first dwt');

L_average=lh + hl;
L_average=L_average + hh;
L_average=L_average./3;

% figure, imshow(L_average), title('L average');

dc(:,:,1)=dct2(ll(:,:,1));
dc(:,:,2)=dct2(ll(:,:,2));
dc(:,:,3)=dct2(ll(:,:,3));

dl(:,:,1)=dct2(L_average(:,:,1));
dl(:,:,2)=dct2(L_average(:,:,2));
dl(:,:,3)=dct2(L_average(:,:,3));

dw(:,:,1)=dct2(watermark_image(:,:,1));
dw(:,:,2)=dct2(watermark_image(:,:,2));
dw(:,:,3)=dct2(watermark_image(:,:,3));

dlmodi(:,:,1)=dl(:,:,1) + alpha * dw(:,:,1);
dlmodi(:,:,2)=dl(:,:,2) + alpha * dw(:,:,2);
dlmodi(:,:,3)=dl(:,:,3) + alpha * dw(:,:,3);

dcmodi(:,:,1)=dc(:,:,1) + beta * dlmodi(:,:,1);
dcmodi(:,:,2)=dc(:,:,2) + beta * dlmodi(:,:,2);
dcmodi(:,:,3)=dc(:,:,3) + beta * dlmodi(:,:,3);

llcmodi(:,:,1)=idct2(dcmodi(:,:,1));
llcmodi(:,:,2)=idct2(dcmodi(:,:,2));
llcmodi(:,:,3)=idct2(dcmodi(:,:,3));

watermarked_image(:,:,1)=idwt2(llcmodi(:,:,1),lh(:,:,1),hl(:,:,1),hh(:,:,1),'haar');
watermarked_image(:,:,2)=idwt2(llcmodi(:,:,2),lh(:,:,2),hl(:,:,2),hh(:,:,2),'haar');
watermarked_image(:,:,3)=idwt2(llcmodi(:,:,3),lh(:,:,3),hl(:,:,3),hh(:,:,3),'haar');

% figure, imshow(imabsdiff(cover_image2(:,:,1),watermarked_image(:,:,1))), title('Difference Red plane');
% figure, imshow(imabsdiff(cover_image2(:,:,2),watermarked_image(:,:,2))), title('Difference Green plane');
% figure, imshow(imabsdiff(cover_image2(:,:,3),watermarked_image(:,:,3))), title('Difference Blue plane');

end
