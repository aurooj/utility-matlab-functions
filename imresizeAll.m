function [] = imresizeAll( path_to_files, target_size, save_path, fmt)
%imresizeAll resizes all images in a given folder to the desired size.

%   Usage: imresizeAll('/home/aisha/input_images/',[224 224],'/home/aisha/output_images')
if(nargin < 4)
    fmt = 'PNG'; %default format for writing images is PNG
end

files = dir(path_to_files);

%remove '.' and '..' from directories
files=files(~ismember({files.name},{'.','..'}));

for i = 1:length(files)
    img = imread(fullfile(path_to_files,files(i).name));
    img = imresize(img, target_size);
    imwrite(img,fullfile(save_path,files(i).name),fmt);      
end

end

