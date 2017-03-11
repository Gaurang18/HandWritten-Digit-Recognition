function images = parseImage(filename)
fid = fopen(filename);
if(fid == -1)
	fprintf('file could not be opened!');
else
	magic_number = fread(fid,4);
	magic_number = conv_to_dec(magic_number');
	num_images = fread(fid,4);
	num_images = conv_to_dec(num_images');
    rows = fread(fid,4);
	rows = conv_to_dec(rows');
	cols = fread(fid,4);
	cols = conv_to_dec(cols');
    if (num_images>=60000)
        images = fread(fid,47040000);
    else
        images = fread(fid,7840000);
    end
	images = images/255.0;
    if (num_images>=60000)
        images = reshape(images,[784,60000]);
    else
        images = reshape(images,[784,10000]);
    end
    images = images';
end

function num = conv_to_dec(vec)
num = 0;
for elem = vec
	num = 256*num + elem;
end
