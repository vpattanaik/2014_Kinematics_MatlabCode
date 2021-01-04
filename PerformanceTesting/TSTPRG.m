function TSTPRG( Pdata )

load('MuscMem.mat');
load('NewdataO.mat');
Mdata = PRGMP( NewdataO,Pdata );
MuscMem = PRGMM( MuscMem, Mdata );
save ('MuscMem.mat' , 'MuscMem');

end