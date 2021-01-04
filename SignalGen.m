function SignalGen( MKdataO,MKdataS )

for i = 1:length(MKdataO)
    t(i) = i;
end

q1 = MKdataO(:,3);
q2 = MKdataO(:,4);
SignalO.time = t;
SignalO.signals.values = [q1,q2];
SignalO.signals.dimensions = 2;

save ('SignalO.mat' , 'SignalO');


for i = 1:length(MKdataS)
    t(i) = i;
end

q1 = MKdataS(:,3);
q2 = MKdataS(:,4);
SignalS.time = t;
SignalS.signals.values = [q1,q2];
SignalS.signals.dimensions = 2;

save ('SignalS.mat' , 'SignalS');

end