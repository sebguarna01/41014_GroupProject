

% Convert a .png image file type to a .jpg file type
f = dir('*.png');

fil = {f.name};

for k = 1:numel(fil)
  file = fil{k};
  new_file = strrep(strcat('calib_',file),'.png','.jpg');
  im = imread(file);
  imwrite(im, new_file);
end



