function NewdataO = TerrainGen(demdata)

% %read STDS file
% stdsFilename = 'FileName.DDF';
% 
% %read every point of the DEM file
% [Z, R] = sdtsdemread(stdsFilename);
% 
% %save data in variable 'demdata'
% demdata=Z;

%replacing missing data (NaN) by lowest value
minarr=min(demdata);
low=min(minarr);
size(demdata);
x=ans(1,1);
y=ans(1,2);
for i=1:x
    for j=1:y
        if isnan(demdata(i,j))
            demdata(i,j)=low;
        end
    end
end

%resizing data to 100*100 matrix
NewdataO=resizem(demdata, [100, 100],'nearest');

end