%%%%%%%%%%%%%%%%%%%%%%%%%%%% Given info %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
gamma = 1.01e-2;
R = 8.314;
T = 298;
rho = 4502;
M = 233.4 / 1000;
ka = pi;
kV= pi/6;

Vm = M / rho;

%%%%%%%%%%%%%%%%%%%%%%%%%%%% CASE 1-2-3 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
S1 = 1.05;
S2 = 1.5;
S3 = 2.1;

%%%%%%%%%%%%%%%%%%%%%% x (char. Length from 0 to 5e-8) %%%%%%%%%%%%%%%%%%%%
L = linspace(0,5e-8);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%% CALCULATION %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% For S = 1.05
DeltaGV1 = (-kV .* L.^3 ./ Vm) .*R.*T.*log(S1);
DeltaGa1 = ka .* L.^2 .*gamma;

DeltaG1 = DeltaGV1 + DeltaGa1;
% For S = 1.5
DeltaGV2 = (-kV .* L.^3 ./ Vm) .*R.*T.*log(S2);
DeltaGa2 = ka .* L.^2 .*gamma;

DeltaG2 = DeltaGV2 + DeltaGa2;
% For S = 2.1
DeltaGV3 = (-kV .* L.^3 ./ Vm) .*R.*T.*log(S3);
DeltaGa3 = ka .* L.^2 .*gamma;

DeltaG3 = DeltaGV3 + DeltaGa3;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% PLOT %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure;
plot(L,DeltaG1,'k',L,DeltaGa1,'r',L,DeltaGV1,'b');
xlabel('Length');
ylabel('Delta G');

figure;
plot(L,DeltaG2,'k',L,DeltaGa2,'r',L,DeltaGV2,'b');
xlabel('Length');
ylabel('Delta G');

figure;
plot(L,DeltaG3,'k',L,DeltaGa3,'r',L,DeltaGV3,'b');
xlabel('Length');
ylabel('Delta G');

%%%%%%%%%%%%%%%%%%%%%%%%%%%% Critical Size %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
S = [0.5 1.05 1.5 2 3]
for n = 1:5
    Lc(n) = 2 * ka * gamma * Vm / (3 * kV * R * T * log(S(n)));
end
