set file_data [open fluct.txt]
set alphas [atomselect top "protein and alpha"]
$alphas set user [getParameterLines $file_data]
mol modcolor 0 0 User
