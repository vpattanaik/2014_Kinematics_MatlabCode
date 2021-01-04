function data = FrdKinematics( L1, L2 )

if isnan(L1) | isnan(L2)
    L1=0;
    L2=0;
end

theta1 = 0:10:90; % all possible theta1 values
theta2 = 0:10:180; % all possible theta2 values

[THETA1, THETA2] = meshgrid(theta1, theta2); % generate a grid of theta1 and theta2 values

X = L1 * cos(THETA1*pi/180) + L2 * cos((THETA1*pi/180) + (THETA2*pi/180)); % compute x coordinates
Y = L1 * sin(THETA1*pi/180) + L2 * sin((THETA1*pi/180) + (THETA2*pi/180)); % compute y coordinates

data = [X(:) , Y(:) , THETA1(:) , THETA2(:)]; % create x-y-theta1-theta2 dataset

% clear l1 l2 theta1 theta2 X Y THETA1 THETA2 PRIO;

end

