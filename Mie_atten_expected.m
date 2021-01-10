function [ut_theory] = Mie_atten_expected(diameter,Vol_conc,B,diam)


Rad = diameter/2; % cm
Modvol = 4/3*pi*Rad^3; % (cm^3)   particle radius
numdensity = Vol_conc/Modvol; % cm^-3 number density  of particles
Across_sec = pi*(Rad)^2; % cm^2  geometric cross section of particles

% which column of B?
[M1,~] = find(diam'>(diameter*1e4));
[M2,~] = find(diam'<(diameter*1e4));

extract = [1:size(diam,2)];
extract([M1; M2])=[];

if size(extract,2) == 1
    column = extract(1,1);
else
    column = M1(1,1);
end

ut_theory = numdensity*Across_sec.*B(:,column)';



end

