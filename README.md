# Elastix_registration

This code can be used to registered mouse brain 3D imaging data (e.g., serial two-photon tomography) to a referecen brain (e.g., Allen common coordinate framework; CCF). 

The code runs on MATLAB while calling Elastix image registration package. 

1. Typically, the imaged dataset is registered to the CCF to have all datasets within the same space. This means, when directing file parameters using the code folder “20210115_YTW_elastix_and_transformix”, the moving image or “file_elasti_move” is the sample data, while the fixed image or “file_elasti_fix” is the CCF template where the moving image will be registered to.
a.	“file_elasti_move” (Line 5) should have the directory pathname for the sample image data, preferably down sized by a factor of 20 (resolution 20 μm × 20 μm × 50 μm). The file format for the moving image can either be TIF or NIfTI. Additionally, when Elastix is run separately from other pipelines, it works best with an image data set that includes autofluorescence.
b.	“file_elasti_fix” (Line 6) should be defined as the directory pathname for the template image. Note that the image stack orientation should match between moving and fixed images. 
c.	“dir_elasti_out” (Line 8) should contain the output directory pathname for where the user wants the registration file to be saved.
d.	The parameter files ‘001_parameters_Rigid.txt’ and ‘002_parameters_BSpline.txt’ should be located within the current directory and pointed to accordingly (Lines 10 and 11).

2. When the code is run, the ‘calling_elastix.m’ function (Line 13) will use the information provided in the previous step to perform 3D image registration.
The output consists of a log ﬁle (elastix.log), the parameters of the transformation that relates the ﬁxed and the moving image (TransformParameters.txt), and the resulting registered image (result.mhd). The log ﬁle contains all messages that were print to screen during registration. Also, the parameterFile.txt is copied into the log ﬁle, and the contents of the TransformParameters.txt ﬁles are included. 

3. After registration, Transformix is called to map detected signals (e.g., cell counts) to the CCF template by apply the transformation parameters. 
a.	“file_transformix_move” (Line 18) should contain the input directory pathname for the new moving image with signals of interest.
b.	“dir_transformix_working” (Line 19) should be the output directory pathname.
c.	“file_trans_para_1” (Line 20) should be set to the Elastix output directory where the TransformParameters.1.txt file exists.

4.	The ‘calling_transformix.m’ function (Line 23) is for performing the final transform to map signals in the CCF based on registration parameters.

