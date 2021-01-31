function MAPLE(N,net1,net2,net3,net4,mue,sig)

load ("MAPLE4stepwithFPModels.mat"); % Loads the neural network models as objects for  Recovery (net1), purity (net2), 10.^(Energy (net4)), Productivity (net3)
%load ("MAPLE4stepwithLPPModels.mat"); % Loads the neural network models as objects for Recovery (net1), purity (net2), 10.^(Energy (net4)), Productivity (net3)

TolPur=0.95;%Purity optimization target
TolRec=0.90;%Recovery optimization target

% Inputs to code N=[Qsat [mol/m3] [800 10000] log10bCO2 [m3/mol] [-5 1] log10bN2 [m3/mol] [-7 0]
%                   DelUCO2 [kJ/mol] [-47 -7] DelUN2 [kJ/mol] [-25 3] Density [kg/m3] [800 
%                   1200] Yfeed [-] [0.05 0.45] tADS [s] [10 110] PH [bar] [1-5] PI [bar]
%                   [0.07 4] PL [bar] [0.01 0.99] Vfeed [m/s] [0.1 1.5] ];
% log10BCO2 and log10BN2 are log10(b0CO2.*(exp(-DelUCO2/(R.*T))) and log10(b0N2.*(exp(-DelUN2/(R.*T))), respectivly 

% Example Data point 
 N=[5000 -2 -4 -30 -10 1000 0.2 50 5 0.4 0.05 0.5];


Train=N(:,1:12);

Train(:,10)=log10(Train(:,10)./Train(:,9));
Train(:,11)=log10(Train(:,11)./Train(:,9));
ZTrain=(Train-mue)./sig;
Input1=ZTrain;
inputs = Input1';

Pu = net2(inputs);
Re = net1(inputs);
Pr = net4(inputs);
En = 10.^(net3(inputs));

purity=Pu%Purity [%]
recovery=Re %Recovery [%]
Productivity=Pr %Productivity [mol CO2/m3 adsorbent s]
Energy=En %Energy [kWh/tonne CO2 cap]

f=zeros(2,1);

Data=[N(1),N(2),N(3),N(4),N(5),N(6),N(7),N(8),N(9),N(10),N(11),N(12),purity,recovery,Energy,Productivity];

Data(isnan(Data))=0;

f(1)=Energy./100     +5000*(max(0,TolPur-purity./100)).^2+5000*(max(0,TolRec-recovery./100)).^2;%Optimization objectives
f(2)=10/Productivity +5000*(max(0,TolPur-purity./100)).^2+5000*(max(0,TolRec-recovery./100)).^2;%Optimization objectives

%Prints final results
fid = fopen('RESULTS.txt', 'at');
fprintf(fid,'%e	%e	%e	%e	%e	%e	%e	%e	%e	%e	%e	%e	%e	%e	%e	%e\n',Data);
fclose(fid);


end