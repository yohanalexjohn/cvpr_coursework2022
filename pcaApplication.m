%% location of the Folders
DATASET_FOLDER = '~/Documents/MATLAB/cvpr/MSRC_ObjCategImageDatabase_v2';
OUT_FOLDER = '~/Documents/MATLAB/cvpr/descriptors';
OUT_SUBFOLDER='pca';

%% Extract the descriptors from the .bmp files
allfiles=dir (fullfile([DATASET_FOLDER,'/Images/*.bmp']));

for filenum=1:length(allfiles)
    fname=allfiles(filenum).name;
    imgfname_full=([DATASET_FOLDER,'/Images/',fname]);
    img=double(imread(imgfname_full))./255;
    F=get_globalHistColours(img);
    all_descriptors(filenum, :) = F;
end

  FF = get_pca(all_descriptors);

% Global Histogram Colour Descriptor used to lower the dimensional space
for fileid = 1:591
    fname=allfiles(fileid).name;
    imgfname_full=([DATASET_FOLDER,'/Images/',fname]);
    fout=[OUT_FOLDER,'/',OUT_SUBFOLDER,'/',fname(1:end-4),'.mat'];%replace .bmp with .ma
    F=FF(fileid, :);
    save(fout,'F'); %fout is the directory
end

