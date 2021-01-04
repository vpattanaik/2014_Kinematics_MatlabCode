function MuscMem = ActMuscMemory( MKdata )

MKdata ( : , 5 ) = 1;
MuscData ( 1 , : ) = MKdata ( 1 , : );
count = 1;

for i = 2:length(MKdata)
    exist = 0;
    for j = 1:count
        if MuscData( j , 1:4 ) == MKdata ( i , 1:4 )
            MuscData ( j , 5 ) = MuscData ( j , 5 ) + 1;
            exist = 1;
            break
        end
    end
    
    if exist == 0
            count = count + 1;
            MuscData ( count , : ) = MKdata ( i , : );
    end
end

MuscData = sortrows(MuscData , 5);

j = 1;
for i = length(MuscData):-1:1
    MuscMem( j , :) = MuscData ( i , : );
    j  = j + 1;
end

end