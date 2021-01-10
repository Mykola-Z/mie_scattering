function [ output ] = Mie_xscan(m, nsteps, dx, x_min);
% Computation and plot of Mie Efficiencies for given
% complex refractive-index ratio m=m'+im"
% and range of size parameters x=k0*a,
% starting at x=0 with nsteps increments of dx
% a=sphere radius, using complex Mie coefficients an and bn
% according to Bohren and Huffman (1983) BEWI:TDD122
% result: m', m", x, efficiencies for extinction (qext),
% scattering (qsca), absorption (qabs), backscattering (qb),
% qratio=qb/qsca and asymmetry parameter (asy=<costeta>).
% C. M�tzler, May 2002.
nx=(1:nsteps)';
x= x_min +(nx-1)*dx;

for j = 1:nsteps
    [result] = Mie(m,x(j));
    b(j,:) = result;
end;

% output_parameters='Real(m), Imag(m), x, Qext, Qsca, Qabs, Qb, <costeta>,Qb/Qsca'
% m1=real(m);m2=imag(m);
% plot(b(:,3),b(:,4:9)) % plotting the results
% legend('Qext','Qsca','Qabs','Qb','<costeta>','Qb/Qsca')
% title(sprintf('Mie Efficiencies, m=%g+%gi',m1,m2))
% xlabel('x')
output=b;


end

