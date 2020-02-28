#!/bin/bash

#FOLDER REFERENCES
Data="/Users/raouelletteiv/Research/7T_Spinal_Brain_Study/Data/Spinal_data/"

#RUN COMMAND
for ID in MS088_R01_20_sup; do
#MS073_R01_05_inf MS073_R01_05_sup MS079_R01_11_inf MS079_R01_11_sup MS081_R01_13_inf MS081_R01_13_sup MS084_R01_16_sup MS088_R01_20_inf MS088_R01_20_mid MS088_R01_20_sup MS089_R01_29_inf MS089_R01_29_sup MS091_R01_22_inf MS091_R01_22_sup MS093_R01_24_sup MS095_R01_26_inf MS095_R01_26_sup MS096_R01_27_inf MS096_R01_27_sup MS100_R01_32_inf MS100_R01_32_sup MS101_R01_33_inf MS101_R01_33_sup MS102_R01_34_inf MS102_R01_34_sup MS103_R01_35_inf MS103_R01_35_sup MS104_R01_36_inf MS104_R01_36_sup NIMMS01_inf NIMMS01_mid NIMMS01_sup NIMMS02_inf NIMMS02_sup NIMMS03_sup NIMMS04_inf NIMMS04_sup NIMMS05_inf NIMMS05_sup NIMMS06_sup NIMMS07_inf NIMMS07_sup NIMMS08_inf NIMMS08_sup NIMMS09_inf NIMMS09_sup NIMMS10_inf NIMMS10_sup NIMMS11_inf NIMMS11_sup; do
#for PATIENT_ID in ; do

#Proprocessing
cd ${Data}/${ID}/;
mkdir Eroded.Lesion.Mapping/;
cp ${Data}/${ID}/t2s_crop.nii.gz ${Data}/${ID}/Eroded.Lesion.Mapping/t2s_crop.nii.gz;
cp ${Data}/${ID}/t2s_seg_manual.nii.gz ${Data}/${ID}/Eroded.Lesion.Mapping/t2s_seg_manual.nii.gz;
cp ${Data}/${ID}/t2s_lesion.nii.gz ${Data}/${ID}/Eroded.Lesion.Mapping/t2s_lesion.nii.gz;
cp ${Data}/${ID}/t2s_crop_gmseg.nii.gz ${Data}/${ID}/Eroded.Lesion.Mapping/t2s_crop_gmseg.nii.gz;
cp ${Data}/${ID}/t2s_crop_wmseg.nii.gz ${Data}/${ID}/Eroded.Lesion.Mapping/t2s_crop_wmseg.nii.gz;

mri_binarize --i t2s_crop_wmseg.nii.gz  --min 0.5 --max 1.0 --binval 1 --o ${Data}/${ID}/Eroded.Lesion.Mapping/WM.seg.binary.nii.gz;
mri_binarize --i t2s_crop_gmseg.nii.gz  --min 0.5 --max 1.0 --binval 1 --o ${Data}/${ID}/Eroded.Lesion.Mapping/GM.seg.binary.nii.gz;

#I. RUN EROSIONS 1-20
cd ${Data}/${ID}/Eroded.Lesion.Mapping/;
sct_maths -i t2s_seg_manual.nii.gz -erode 1,1,1 -o Erode.1_SC.seg.nii.gz;
sct_maths -i t2s_seg_manual.nii.gz -erode 2,2,2 -o Erode.2_SC.seg.nii.gz;
sct_maths -i t2s_seg_manual.nii.gz -erode 3,3,3 -o Erode.3_SC.seg.nii.gz;
sct_maths -i t2s_seg_manual.nii.gz -erode 4,4,4 -o Erode.4_SC.seg.nii.gz;
sct_maths -i t2s_seg_manual.nii.gz -erode 5,5,5 -o Erode.5_SC.seg.nii.gz;
sct_maths -i t2s_seg_manual.nii.gz -erode 6,6,6 -o Erode.6_SC.seg.nii.gz;
sct_maths -i t2s_seg_manual.nii.gz -erode 7,7,7 -o Erode.7_SC.seg.nii.gz;
sct_maths -i t2s_seg_manual.nii.gz -erode 8,8,8 -o Erode.8_SC.seg.nii.gz;
sct_maths -i t2s_seg_manual.nii.gz -erode 9,9,9 -o Erode.9_SC.seg.nii.gz;
sct_maths -i t2s_seg_manual.nii.gz -erode 10,10,10 -o Erode.10_SC.seg.nii.gz;
sct_maths -i t2s_seg_manual.nii.gz -erode 11,11,11 -o Erode.11_SC.seg.nii.gz;
sct_maths -i t2s_seg_manual.nii.gz -erode 12,12,12 -o Erode.12_SC.seg.nii.gz;
sct_maths -i t2s_seg_manual.nii.gz -erode 13,13,13 -o Erode.13_SC.seg.nii.gz;
sct_maths -i t2s_seg_manual.nii.gz -erode 14,14,14 -o Erode.14_SC.seg.nii.gz;
sct_maths -i t2s_seg_manual.nii.gz -erode 15,15,15 -o Erode.15_SC.seg.nii.gz;
sct_maths -i t2s_seg_manual.nii.gz -erode 16,16,16 -o Erode.16_SC.seg.nii.gz;
sct_maths -i t2s_seg_manual.nii.gz -erode 17,17,17 -o Erode.17_SC.seg.nii.gz;
sct_maths -i t2s_seg_manual.nii.gz -erode 18,18,18 -o Erode.18_SC.seg.nii.gz;
sct_maths -i t2s_seg_manual.nii.gz -erode 19,19,19 -o Erode.19_SC.seg.nii.gz;
sct_maths -i t2s_seg_manual.nii.gz -erode 20,20,20 -o Erode.20_SC.seg.nii.gz;
sct_maths -i t2s_seg_manual.nii.gz -erode 21,21,21 -o Erode.21_SC.seg.nii.gz;
sct_maths -i t2s_seg_manual.nii.gz -erode 22,22,22 -o Erode.22_SC.seg.nii.gz;
sct_maths -i t2s_seg_manual.nii.gz -erode 23,23,23 -o Erode.23_SC.seg.nii.gz;
sct_maths -i t2s_seg_manual.nii.gz -erode 24,24,24 -o Erode.24_SC.seg.nii.gz;

#CREATE THE RING VOLUMES BY SUBTRACTING THE FOLLOWING FROM THE FORMER EROSION VOLUME
fslmaths Erode.1_SC.seg.nii.gz -sub Erode.2_SC.seg.nii.gz Layer.1.nii.gz;
fslmaths Erode.2_SC.seg.nii.gz -sub Erode.3_SC.seg.nii.gz Layer.2.nii.gz;
fslmaths Erode.3_SC.seg.nii.gz -sub Erode.4_SC.seg.nii.gz Layer.3.nii.gz;
fslmaths Erode.4_SC.seg.nii.gz -sub Erode.5_SC.seg.nii.gz Layer.4.nii.gz;
fslmaths Erode.5_SC.seg.nii.gz -sub Erode.6_SC.seg.nii.gz Layer.5.nii.gz;
fslmaths Erode.6_SC.seg.nii.gz -sub Erode.7_SC.seg.nii.gz Layer.6.nii.gz;
fslmaths Erode.7_SC.seg.nii.gz -sub Erode.8_SC.seg.nii.gz Layer.7.nii.gz;
fslmaths Erode.8_SC.seg.nii.gz -sub Erode.9_SC.seg.nii.gz Layer.8.nii.gz;
fslmaths Erode.9_SC.seg.nii.gz -sub Erode.10_SC.seg.nii.gz Layer.9.nii.gz;
fslmaths Erode.10_SC.seg.nii.gz -sub Erode.11_SC.seg.nii.gz Layer.10.nii.gz;
fslmaths Erode.11_SC.seg.nii.gz -sub Erode.12_SC.seg.nii.gz Layer.11.nii.gz;
fslmaths Erode.12_SC.seg.nii.gz -sub Erode.13_SC.seg.nii.gz Layer.12.nii.gz;
fslmaths Erode.13_SC.seg.nii.gz -sub Erode.14_SC.seg.nii.gz Layer.13.nii.gz;
fslmaths Erode.14_SC.seg.nii.gz -sub Erode.15_SC.seg.nii.gz Layer.14.nii.gz;
fslmaths Erode.15_SC.seg.nii.gz -sub Erode.16_SC.seg.nii.gz Layer.15.nii.gz;
fslmaths Erode.16_SC.seg.nii.gz -sub Erode.17_SC.seg.nii.gz Layer.16.nii.gz;
fslmaths Erode.17_SC.seg.nii.gz -sub Erode.18_SC.seg.nii.gz Layer.17.nii.gz;
fslmaths Erode.18_SC.seg.nii.gz -sub Erode.19_SC.seg.nii.gz Layer.18.nii.gz;
fslmaths Erode.19_SC.seg.nii.gz -sub Erode.20_SC.seg.nii.gz Layer.19.nii.gz;
fslmaths Erode.20_SC.seg.nii.gz -sub Erode.21_SC.seg.nii.gz Layer.20.nii.gz;
fslmaths Erode.21_SC.seg.nii.gz -sub Erode.22_SC.seg.nii.gz Layer.21.nii.gz;
fslmaths Erode.22_SC.seg.nii.gz -sub Erode.23_SC.seg.nii.gz Layer.22.nii.gz;
fslmaths Erode.23_SC.seg.nii.gz -sub Erode.24_SC.seg.nii.gz Layer.23.nii.gz;

#MULTIPLE THE RING BY IT'S NUMBER TO INDIVIDUALIZE RINGS TO DIFFERENTIATE
fslmaths Layer.1.nii.gz -mul 1 Layer.1.nii.gz;
fslmaths Layer.2.nii.gz -mul 2 Layer.2.nii.gz;
fslmaths Layer.3.nii.gz -mul 3 Layer.3.nii.gz;
fslmaths Layer.4.nii.gz -mul 4 Layer.4.nii.gz;
fslmaths Layer.5.nii.gz -mul 5 Layer.5.nii.gz;
fslmaths Layer.6.nii.gz -mul 6 Layer.6.nii.gz;
fslmaths Layer.7.nii.gz -mul 7 Layer.7.nii.gz;
fslmaths Layer.8.nii.gz -mul 8 Layer.8.nii.gz;
fslmaths Layer.9.nii.gz -mul 9 Layer.9.nii.gz;
fslmaths Layer.10.nii.gz -mul 10 Layer.10.nii.gz;
fslmaths Layer.11.nii.gz -mul 11 Layer.11.nii.gz;
fslmaths Layer.12.nii.gz -mul 12 Layer.12.nii.gz;
fslmaths Layer.13.nii.gz -mul 13 Layer.13.nii.gz;
fslmaths Layer.14.nii.gz -mul 14 Layer.14.nii.gz;
fslmaths Layer.15.nii.gz -mul 15 Layer.15.nii.gz;
fslmaths Layer.16.nii.gz -mul 16 Layer.16.nii.gz;
fslmaths Layer.17.nii.gz -mul 17 Layer.17.nii.gz;
fslmaths Layer.18.nii.gz -mul 18 Layer.18.nii.gz;
fslmaths Layer.19.nii.gz -mul 19 Layer.19.nii.gz;
fslmaths Layer.20.nii.gz -mul 20 Layer.20.nii.gz;
fslmaths Layer.21.nii.gz -mul 21 Layer.21.nii.gz;
fslmaths Layer.22.nii.gz -mul 22 Layer.22.nii.gz;
fslmaths Layer.23.nii.gz -mul 23 Layer.23.nii.gz;

#ADD INTO SINGULAR MASK
fslmaths Layer.1.nii.gz -add Layer.2.nii.gz Rings.Combined.nii.gz
fslmaths Rings.Combined.nii.gz -add Layer.3.nii.gz Rings.Combined.nii.gz;
fslmaths Rings.Combined.nii.gz -add Layer.4.nii.gz Rings.Combined.nii.gz;
fslmaths Rings.Combined.nii.gz -add Layer.5.nii.gz Rings.Combined.nii.gz;
fslmaths Rings.Combined.nii.gz -add Layer.6.nii.gz Rings.Combined.nii.gz;
fslmaths Rings.Combined.nii.gz -add Layer.7.nii.gz Rings.Combined.nii.gz;
fslmaths Rings.Combined.nii.gz -add Layer.8.nii.gz Rings.Combined.nii.gz;
fslmaths Rings.Combined.nii.gz -add Layer.9.nii.gz Rings.Combined.nii.gz;
fslmaths Rings.Combined.nii.gz -add Layer.10.nii.gz Rings.Combined.nii.gz;
fslmaths Rings.Combined.nii.gz -add Layer.11.nii.gz Rings.Combined.nii.gz;
fslmaths Rings.Combined.nii.gz -add Layer.12.nii.gz Rings.Combined.nii.gz;
fslmaths Rings.Combined.nii.gz -add Layer.13.nii.gz Rings.Combined.nii.gz;
fslmaths Rings.Combined.nii.gz -add Layer.14.nii.gz Rings.Combined.nii.gz;
fslmaths Rings.Combined.nii.gz -add Layer.15.nii.gz Rings.Combined.nii.gz;
fslmaths Rings.Combined.nii.gz -add Layer.16.nii.gz Rings.Combined.nii.gz;
fslmaths Rings.Combined.nii.gz -add Layer.17.nii.gz Rings.Combined.nii.gz;
fslmaths Rings.Combined.nii.gz -add Layer.18.nii.gz Rings.Combined.nii.gz;
fslmaths Rings.Combined.nii.gz -add Layer.19.nii.gz Rings.Combined.nii.gz;
fslmaths Rings.Combined.nii.gz -add Layer.20.nii.gz Rings.Combined.nii.gz;
fslmaths Rings.Combined.nii.gz -add Layer.21.nii.gz Rings.Combined.nii.gz;
fslmaths Rings.Combined.nii.gz -add Layer.22.nii.gz Rings.Combined.nii.gz;
fslmaths Rings.Combined.nii.gz -add Layer.23.nii.gz Rings.Combined.nii.gz;

#Delete Superflous compotition FILES
rm *Layer*
rm *Erode*

#EXTRACT THE WHOLE/WHITE MATTER/GREY MATTER LESION DILATION VALUES
fslmaths Rings.Combined.nii.gz -mas t2s_lesion.nii.gz Whole.Les.Ring.nii.gz;
#fslmaths Whole.Les.Ring.nii.gz -mas WM.seg.binary.nii.gz WM.Les.Ring.nii.gz;
#fslmaths Whole.Les.Ring.nii.gz -mas GM.seg.binary.nii.gz GM.Les.Ring.nii.gz;
#RECIEVE THE FOLLOWING ERROR.
#WARNING:: Inconsistent orientations for individual images in pipeline!
#          Will use voxel-based orientation which is probably incorrect - *PLEASE CHECK*!
#
#Image Exception : #3 :: Attempted to multiply images of different sizes
#libc++abi.dylib: terminating with uncaught exception of type armawrap::AWException: Attempted to multiply images of different sizes
#Abort trap: 6

#RUN VOLUMES EXTRACTIONS: OUTPUT INTO XLS/TXT FILES
fslstats Whole.Les.Ring.nii.gz -l 0 -u 2 -V >> Whole.Lesion.Vol.txt;
fslstats Whole.Les.Ring.nii.gz -l 1 -u 3 -V >> Whole.Lesion.Vol.txt;
fslstats Whole.Les.Ring.nii.gz -l 2 -u 4 -V >> Whole.Lesion.Vol.txt;
fslstats Whole.Les.Ring.nii.gz -l 3 -u 5 -V >> Whole.Lesion.Vol.txt;
fslstats Whole.Les.Ring.nii.gz -l 4 -u 6 -V >> Whole.Lesion.Vol.txt;
fslstats Whole.Les.Ring.nii.gz -l 5 -u 7 -V >> Whole.Lesion.Vol.txt;
fslstats Whole.Les.Ring.nii.gz -l 6 -u 8 -V >> Whole.Lesion.Vol.txt;
fslstats Whole.Les.Ring.nii.gz -l 7 -u 9 -V >> Whole.Lesion.Vol.txt;
fslstats Whole.Les.Ring.nii.gz -l 8 -u 10 -V >> Whole.Lesion.Vol.txt;
fslstats Whole.Les.Ring.nii.gz -l 9 -u 11 -V >> Whole.Lesion.Vol.txt;
fslstats Whole.Les.Ring.nii.gz -l 10 -u 12 -V >> Whole.Lesion.Vol.txt;
fslstats Whole.Les.Ring.nii.gz -l 11 -u 13 -V >> Whole.Lesion.Vol.txt;
fslstats Whole.Les.Ring.nii.gz -l 12 -u 14 -V >> Whole.Lesion.Vol.txt;
fslstats Whole.Les.Ring.nii.gz -l 13 -u 15 -V >> Whole.Lesion.Vol.txt;
fslstats Whole.Les.Ring.nii.gz -l 14 -u 16 -V >> Whole.Lesion.Vol.txt;
fslstats Whole.Les.Ring.nii.gz -l 15 -u 17 -V >> Whole.Lesion.Vol.txt;
fslstats Whole.Les.Ring.nii.gz -l 16 -u 18 -V >> Whole.Lesion.Vol.txt;
fslstats Whole.Les.Ring.nii.gz -l 17 -u 19 -V >> Whole.Lesion.Vol.txt;
fslstats Whole.Les.Ring.nii.gz -l 18 -u 20 -V >> Whole.Lesion.Vol.txt;
fslstats Whole.Les.Ring.nii.gz -l 19 -u 21 -V >> Whole.Lesion.Vol.txt;
fslstats Whole.Les.Ring.nii.gz -l 20 -u 22 -V >> Whole.Lesion.Vol.txt;
fslstats Whole.Les.Ring.nii.gz -l 21 -u 23 -V >> Whole.Lesion.Vol.txt;
fslstats Whole.Les.Ring.nii.gz -l 22 -u 24 -V >> Whole.Lesion.Vol.txt;
fslstats Whole.Les.Ring.nii.gz -l 23 -u 25 -V >> Whole.Lesion.Vol.txt;
done
