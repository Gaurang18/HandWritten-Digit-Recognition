function labels = parseLabel(filename)
fid = fopen(filename);
if(fid == -1)
	fprintf('file could not be opened!');
else
	magic_number = fread(fid,4);
	magic_number = conv_to_dec(magic_number');
	num_labels = fread(fid,4);
	num_labels = conv_to_dec(num_labels');
	%rows = fread(fid,4);
	%rows = conv_to_dec(rows');
	%cols = fread(fid,4);
	%cols = conv_to_dec(cols');
	labels = fread(fid,60000);
	%labels = reshape(images,[60000,784]);
end

function num = conv_to_dec(vec)
num = 0;
for elem = vec
	num = num + 256*num + elem;
end
