function MuscMemN = TstMuscMemory( MuscMem,NewdataO,NewdataS,Path )

Mdata = MotionPlanningS ( NewdataO,NewdataS,Path );

count = length(MuscMem(:,1));

for i = 1:length(Mdata)
    exist = 0;
    for j = 1:count
        if MuscMem( j , 1:2 ) == Mdata ( i , 1:2 )
            MuscMem ( j , 5 ) = MuscMem ( j , 5 ) + 1;
            exist = 1;
            break
        end
    end
    
    if exist == 0
            count = count + 1;
            Theta = InvKinematics ( Mdata(i,1),Mdata(i,2),3,2 );
            MuscMem ( count , : ) = [ Mdata(i,1) Mdata(i,2) Theta(1,1) Theta(1,2) 1 ];
    end
end

MuscMem = sortrows(MuscMem , 5);

j = 1;
for i = length(MuscMem):-1:1
    MuscMemN( j , :) = MuscMem ( i , : );
    j  = j + 1;
end

end

