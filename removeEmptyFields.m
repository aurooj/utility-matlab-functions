%% 
function matfile = removeEmptyFields(matfile)
%%remove empty structures from .mat file.
%%Input: struct with empty fields to be removed.
%%output: cleaned struct without any empty rows.
%% example:Input={{[],[]},{a,b},{b,c}}
%% output={{a,b},{b,c}}

data = matfile;
fnames = {data.file_name};

%find indices which have empty entries
indices = find(cellfun('isempty',fnames));

matfile(indices) = [];%delete them

end