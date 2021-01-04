function Kdata = InvKinematics( X,Y,L1,L2 )

for i = 1:length(X)
    THETA1(i) = acos( X(i) / (sqrt( X(i)^2 + Y(i)^2 ))) - acos( ( L1 + ((X(i)^2 + Y(i)^2 - L1^2 - L2^2) / (2*L1)) ) / (sqrt( X(i)^2 + Y(i)^2 ) ) );
    THETA2(i) = acos( (X(i)^2 + Y(i)^2 - L1^2 - L2^2) / (2*L1*L2) );
end

for i = 1:length(X)
    if THETA2(i) ~= 0
        THETA2(i) = pi - THETA2(i);
    end
end

Kdata = [THETA1(:) THETA2(:)];
Kdata = Kdata * 180 / pi;
Kdata = real(Kdata);
end