

%% Run Elastix with preset parameters

file_elasti_move = 'E:\LabMembers\Kyra\yingxi\20201016_Xue_Lin_KN_M_p7_190412_NPAScre_Ai75_1X\20201016_P7_G-Bg_20um-iso.tif'; % The moving image
file_elasti_fix = 'E:\LabMembers\Kyra\yingxi\Registration_test\ReferenceBrains\P7\Kim_ref_P7_v2_brain_20um-iso_sagittal_Z1-325_OB-up_Ctx-Left.tif'; % The stationary image 

dir_elasti_out = 'E:\LabMembers\Kyra\yingxi\20201016_Xue_Lin_KN_M_p7_190412_NPAScre_Ai75_1X\'; % Output folder

para_elastx_0 = [pwd '/parameter_YT/001_parameters_Rigid.txt']; % parameter_1
para_elastx_1 = [pwd '/parameter_YT/002_parameters_BSpline.txt']; % parameter_2

calling_elastix(file_elasti_move, file_elasti_fix, para_elastx_0, para_elastx_1, dir_elasti_out);


%% Run transformix

file_transformix_move = 'D:\MATLAB\20210107_YTW_MRI_reggistration/Brain_seta30.tif'; % the moving image
dir_transformix_working = 'D:/temp2/'; % Output folder
file_trans_para_1 = [dir_elasti_out, '/TransformParameters.1.txt'] ; % parameters from elastix


callingg_transformix(file_transformix_move, dir_transformix_working, file_trans_para_1);
