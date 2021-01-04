function MDataO = MotionPlanningO( NewdataO,Path )

i = 1;
%j = -1;
k = 1;

while i <= 4*length(Path)
    
%     if j > 1
%         j = -1;
%     end
    
    MDataO(i,1) = 5;
    MDataO(i,2) = 0;
    i = i + 1;
    
    MDataO(i,1) = 5;
    MDataO(i,2) = 0;
    i = i + 1;
    
    MDataO(i,1) = 1;
    MDataO(i,2) = (5 - NewdataO(Path(k,1),Path(k,2))) / 2;
    i = i + 1;
    
    MDataO(i,1) = 1;
    MDataO(i,2) = 5 - NewdataO(Path(k,1),Path(k,2));
    i = i + 1;
    
%     j = j + 1;
    k = k + 1;
    
end

end

