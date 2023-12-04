function G = accLinearModel(m,Iz,lf,lr,Cf,Cr,tau,v0_ego)
A = [-(2*Cf+2*Cr)/m/v0_ego,0,-v0_ego-(2*Cf*lf-2*Cr*lr)/m/v0_ego,0,0;...
     0,0,1,0,0;...
     -(2*Cf*lf-2*Cr*lr)/Iz/v0_ego,0,-(2*Cf*lf^2+2*Cr*lr^2)/Iz/v0_ego,0,0;...
     0,0,0,0,1;...
     0,0,0,0,-1/tau];  
B2 = [0,0,0,0,1/tau]';
C = [0,0,0,1,0];
G = minreal(ss(A,B2,C,0));




 