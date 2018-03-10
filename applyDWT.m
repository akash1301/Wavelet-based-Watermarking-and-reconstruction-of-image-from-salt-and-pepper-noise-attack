function [ ll_image,lh_image,hl_image,hh_image ] = applyDWT( in_image )
%applyDWT Summary of this function goes here
%   Detailed explanation goes here

[llr,lhr,hlr,hhr] = dwt2(in_image(:,:,1),'haar');
[llg,lhg,hlg,hhg] = dwt2(in_image(:,:,2),'haar');
[llb,lhb,hlb,hhb] = dwt2(in_image(:,:,3),'haar');

ll_image(:,:,1)=llr;
ll_image(:,:,2)=llg;
ll_image(:,:,3)=llb;

lh_image(:,:,1)=lhr;
lh_image(:,:,2)=lhg;
lh_image(:,:,3)=lhb;

hl_image(:,:,1)=hlr;
hl_image(:,:,2)=hlg;
hl_image(:,:,3)=hlb;

hh_image(:,:,1)=hhr;
hh_image(:,:,2)=hhg;
hh_image(:,:,3)=hhb;

end

