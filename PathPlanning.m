function Path = PathPlanning( Org,Trg )

i = 1;
TempTrg = Org;
Path(i,:) = Org;

while TempTrg(1,1) ~= Trg(1,1) || TempTrg(1,2) ~= Trg(1,2)
    i = i+1;
    
    if TempTrg(1,1) < Trg(1,1)
        TempTrg(1,1) = TempTrg(1,1)+1;
    elseif TempTrg(1,1) > Trg(1,1)
        TempTrg(1,1) = TempTrg(1,1)-1;
    end
    
    if TempTrg(1,2) < Trg(1,2)
        TempTrg(1,2) = TempTrg(1,2)+1;
    elseif TempTrg(1,2) > Trg(1,2)
        TempTrg(1,2) = TempTrg(1,2)-1;
    end
    Path(i,:) = TempTrg(1,:);
    
end

end