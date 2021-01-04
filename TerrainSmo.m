function NewdataS = TerrainSmo(NewdataO)

%Moving Average smoothing for span of 25 units
NewdataS=NewdataO;
for i=1:100
    newdatax(i,:) = smooth(NewdataO(i,:),25,'moving');
end

for i=1:100
    newdatay(:,i) = smooth(NewdataO(:,i),25,'moving');
end

NewdataS = (newdatax + newdatay)/2;

%calculating difference between original and smoothed data
diff=NewdataO-NewdataS;

for i=1:100
    maxarr(i)=max(diff(i,:));
end
diff=max(maxarr);

%raising height of smoothed data
NewdataS=NewdataS+diff;

end