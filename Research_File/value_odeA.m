function dhdx = value_odeA(x,A,rho1,rho2,gamma,vphi,ald,Y1,Y2,bet,idx)                    

%beta2 = beta^2/2;

vg = (1-vphi)/(1-gamma);
invp = 1/vphi;
 
G1 = bet.^2*vg/2;
 
%Y1=Y1/G1;
%Y2=Y2/G1;
%ALD = ald^(1-vphi)/G1;
 
dhdx(1) = A(2);

if idx == 0
H = ((exp(-vg*A(1)).*rho1*(1 - A(2)).^(1-vg)).^invp + (rho2*exp(vg*(x-A(1))).*(A(2)).^(1-vg)).^invp).^vphi*ald^(1-vphi);
dd = (Y1*(1 - A(2)) + Y2*A(2) - H)/G1 + A(2)*(1 - A(2));
%dd = (Y1*(1 - A(2)) + Y2*A(2) - ald^(1-vphi)*exp(-vg*A(1)).*((rho1*(1 - A(2)).^(1-vg)).^invp + (rho2*exp(vg*x).*(A(2)).^(1-vg)).^invp).^vphi)/G1 + A(2)*(1 - A(2));
%dd = Y1*(1 - A(2)) + Y2*A(2) - ALD*exp(-vg*A(1)).*((rho1*(1 - A(2)).^(1-vg)).^invp + (rho2*exp(vg*x).*(A(2)).^(1-vg)).^invp).^vphi + A(2)*(1 - A(2));
else
H = ((exp(-vg*A(1)).*rho1*(1 - A(2)).^(1-vg)).^invp + (rho2*exp(vg*(x-A(1))).*(A(2)).^(1-vg)).^invp).*(1-idx)^(1-invp);
dd = (Y1*(1 - A(2)) - (1-vphi)*ald*(1 - idx) + Y2*A(2) - vphi*H)/G1 + A(2)*(1 - A(2));

endif

dhdx(2) = dd;
 
endfunction
