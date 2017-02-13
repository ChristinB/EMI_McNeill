clear all
close all

%% Device parameters (VCP)
%Coil spacing [m]
s1=1;
s2=2;

%% Layer properties
%Top layer
cond1=5e-5; %[S/m]

%Thin layer TL
DepthTL=0.5; %[m]
cond2=20e-3; %[S/m]

% Towards phi
Depth=0:0.05:2; %[m]
z1=Depth/s1; %normalized Depth by Coil spacing
z2=Depth/s2;

%for coil spacing 1 PRP
%phi is the sensitivity
%R is the relative contribution to Hs from all material below z1
Phiz1P=2./(4*z1.^2+1).^(3/2); 
Rz1P=2*z1./(4*z1.^2+1).^(1/2);

%for coil spacing 1 HCP
Phiz1H=4*z1./(4*z1.^2+1).^(3/2); 
Rz1H=1-1./(sqrt(4*z1.^2+1));

%Representation of relative influence of current flow as a function of
%depth
figure
hold on
subplot(2,1,1)
hold on
plot(z1,Phiz1P,'-')
plot(z1,Phiz1H,'-')
xlabel('Normalized Depth')
ylabel('Phi(z1)')
title('Sensitivity as a function of depth')
h = legend ({"PRP"}, "HCP");
legend (h, "location", "northeast");
set (h, "fontsize", 20);


subplot(2,1,2)
hold on
plot(z1,Rz1P,'-')
plot(z1,Rz1H,'-')
xlabel('Normalized Depth')
ylabel('R(z1)')
title('Cumulutive response versus depth')
