function Mdata = PRGMP( NewdataO,Pdata )

i = 1;
k = 1;

while i <= length(Pdata)
    Mdata(i,1) = 1;
    Mdata(i,2) = 5 - NewdataO(Pdata(k,1),Pdata(k,2));
    i = i + 1;
    k = k + 1;    
end

end

