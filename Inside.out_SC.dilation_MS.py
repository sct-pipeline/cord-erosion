# -*- coding: utf-8 -*-
"""

Compute the average of a given 3D field (e.g. SUV) as a function of distance
to a structure (e.g. lateral ventricule) defined by a mask.

At each step, the mask is dilated by a ball of radius 1, then we substract
the previous step to get only a ring.

We then average the field over the ring

"""

from numpy import *
import os
import nibabel as nib
from skimage.morphology import binary_dilation, ball

###############################################################################

''' DATA LOAD '''
# To get speed and memory, data need to be unzipped format like *.nii, not .nii.gz
# a mgz file can be renamed mgh.gz and then unziped.

subject_list = ['WM.GM.test_MS073_R01_05_inf']
#['MS070_R01_02_inf','MS070_R01_02_sup','MS073_R01_05_inf','MS073_R01_05_sup','MS075_R01_07_inf','MS075_R01_07_sup','MS079_R01_11_inf','MS079_R01_11_sup','MS081_R01_13_inf','MS081_R01_13_sup','MS084_R01_16_inf','MS084_R01_16_sup','MS087_R01_19_inf','MS087_R01_19_sup','MS088_R01_20_inf','MS088_R01_20_mid','MS088_R01_20_sup','MS089_R01_29_inf','MS089_R01_29_sup','MS091_R01_22_inf','MS091_R01_22_sup','MS093_R01_24_inf','MS093_R01_24_sup','MS095_R01_26_inf','MS095_R01_26_sup','MS096_R01_27_inf','MS096_R01_27_sup','MS098_R01_30_inf','MS098_R01_30_sup','MS099_R01_31_inf','MS099_R01_31_sup','MS100_R01_32_inf','MS100_R01_32_sup','MS101_R01_33_inf','MS101_R01_33_sup','MS102_R01_34_inf','MS102_R01_34_sup','MS103_R01_35_inf','MS103_R01_35_sup','MS104_R01_36_inf','MS104_R01_36_sup','NIMMS01_inf','NIMMS01_mid','NIMMS01_sup','NIMMS02_inf','NIMMS02_sup','NIMMS03_inf','NIMMS03_sup','NIMMS04_inf','NIMMS04_sup','NIMMS05_inf','NIMMS05_sup','NIMMS06_inf','NIMMS06_sup','NIMMS07_inf','NIMMS07_sup','NIMMS08_inf','NIMMS08_sup','NIMMS09_inf','NIMMS09_sup','NIMMS10_inf','NIMMS10_sup','NIMMS11_inf','NIMMS11_sup']

print("Load SUVs")

for k in range(len(subject_list)):

    subject = subject_list[k]
    #recon = recon_list[k]

    #subject_dir = "/autofs/cluster/mscat/users/sindhuja/data/3T/"+recon+"/mri"
    path_files = "/Users/raouelletteiv/Research/7T_Spinal_Brain_Study/Data/Spinal_data/Spinal.Rings_outside_in/"+subject

    SUV_filename = 't2s_seg_manual.nii.gz'

    SUV = nib.load(os.path.join(path_files,SUV_filename)).get_data()
    SUV_pos = SUV>0

    print("Load region")

    NAWM_filename = 't2s_seg_manual.nii.gz'
    region = nib.load(os.path.join(path_files,NAWM_filename)).get_data() > 0

    print("Load mask")

    #LV_filename = 'LV.nii'
    LV_filename = 't2s_centerline_expand.nii.gz'
    raw_mask = nib.load(os.path.join(path_files,LV_filename)).get_data() >0

    #
    #
    mask = raw_mask

    del raw_mask
    #
    #
    ''' DILATIONS '''
    print("dilations")
    NDIL = 25  # Number of dilations
    annot = nib.load(os.path.join(path_files,NAWM_filename))
    annot.get_data()[:,:,:]=0
    res = []
    for ndil in range(NDIL):
        mask_dil = binary_dilation(mask,ball(1)).astype('bool')
        ring = (mask_dil ^ mask).astype('bool') & region
        ring = ring & SUV_pos
        av = sum(SUV[ring])/sum(ring)
        mask = mask_dil.copy()
        annot.get_data()[ring]=ndil+1
        res = res + [[ndil,av]]
        print(ndil, av)
    annot_name = "/Users/raouelletteiv/Research/7T_Spinal_Brain_Study/Data/Spinal_data/Spinal.Rings_outside_in/"+subject+"/"+subject+"_INsideOut_2vox_dilation.nii"
    nib.save(annot,annot_name) #to write the file with the dilations
    outfilename = "/Users/raouelletteiv/Research/7T_Spinal_Brain_Study/Data/Spinal_data/Spinal.Rings_outside_in/"+subject+"/"+subject+"_INsideOut_2vox_dilation.csv"
    savetxt(outfilename,array(res),delimiter=' ',header="ndil;average")
