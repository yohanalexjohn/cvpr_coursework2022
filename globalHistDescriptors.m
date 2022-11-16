%% location of the Folders
DATASET_FOLDER = '~/Documents/MATLAB/cvpr/MSRC_ObjCategImageDatabase_v2';
OUT_FOLDER = '~/Documents/MATLAB/cvpr/descriptors';
OUT_SUBFOLDER='globalRGBhisto';

%% Extract the descriptors from the .bmp files
allfiles=dir (fullfile([DATASET_FOLDER,'/Images/*.bmp']));
for filenum=1:length(allfiles)
    fname=allfiles(filenum).name;
    fprintf('Processing file %d/%d - %s\n',filenum,length(allfiles),fname);
    tic;
    imgfname_full=([DATASET_FOLDER,'/Images/',fname]);
    img=double(imread(imgfname_full))./255;
    fout=[OUT_FOLDER,'/',OUT_SUBFOLDER,'/',fname(1:end-4),'.mat'];%replace .bmp with .mat
    F=get_globalHistColours(img)
    save(fout,'F');
    toc
end

