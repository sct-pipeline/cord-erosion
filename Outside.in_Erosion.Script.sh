#!/bin/bash
# This script is eroding the T2seg manual mask from the outside inwards.
# Tested with SCT e5eee1f18f4cc3655dc42c565ffac5b2453af2d1
# Results are in Whole.Lesion.Vol.txt: 1st column: number of voxels, 2nd column: volume (in mm3).

# PARAMETERS
# Set the number of erosion steps. On the PAM50, there is nothing left after the 9th iteration.
sizes=(1 2 3 4 5 6 7 8 9)

#FOLDER REFERENCES
# Data="/Users/raouelletteiv/Research/7T_Spinal_Brain_Study/Data/Spinal_data/"
Data=""  # run the script within the Data folder for it to work without specifying a custom Data variable

# Download PAM50 template from SCT v3.0.1
wget -O PAM50.zip https://osf.io/gdwn6/download
unzip PAM50.zip
cd PAM50/template/
# Initialize PAM50_cord_rings.nii.gz file from cord segmentation
cp PAM50_cord.nii.gz PAM50_cord_rings.nii.gz
# Erode cord mask several times, until there is nothing left
for size in ${sizes[@]}; do
  # 2D erosion in the axial plane
  sct_maths -i PAM50_cord.nii.gz -erode $size -shape disk -dim 2 -o tmp.PAM50_cord_rings_e${size}.nii.gz
	# Iteratively add mask in order to create rings: each ring will have a specific label value: 1 (most outer ring), 2, 3, 4, etc.
	sct_maths -i PAM50_cord_rings.nii.gz -add tmp.PAM50_cord_rings_e${size}.nii.gz -o PAM50_cord_rings.nii.gz
done
# remove temp stuff
rm tmp.*
# Create convenient variable pointing to file
cord_rings=`pwd`/PAM50_cord_rings.nii.gz

# Go back to local folder
cd ../..

# Iterate across subjects and quantify in rings, WM and GM
subjects=(MS088_R01_20)
for subject in ${subjects[@]}; do
	# go to subject folder
  cd $subject
  # Binarize lesion mask
  fslmaths lesion_merged.nii.gz -thr 0.5 -bin lesion_merged_bin.nii.gz
  # Multiply by rings
  fslmaths lesion_merged_bin.nii.gz -mul $cord_rings lesion_merged_bin_rings.nii.gz
  # Quantify lesion volume fraction in each sub-ring
  for size in ${sizes[@]}; do
    fslstats lesion_merged_bin_rings.nii.gz -l $(($size-1)) -u $(($size+1)) -V >> Whole.Lesion.Vol.txt
  done
done
