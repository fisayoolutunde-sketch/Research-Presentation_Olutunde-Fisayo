%%% Determine Autarky Equilibria %%%
%setparams
%eta = dib/beta/sigma;
 M = size(al,2);
 mu = (al(3:M)-al(2:M-1)).*(1-b(2:M-1));
 mu = cumsum(mu) + mu0;
 mu1 = [mu0 mu];
 mu2 = mu1 - eta*beta*sigma;
 ald = alpha - al(2:M-1);
 bd = [(1./ald./(1-b(1:M-2)))' (1./ald./(1-b(2:M-1)))'];
 
 re1 = rho1 + vphi*mu1 - 0.5*(1+vphi)*gamma*sigma^2;
 re2 = rho2 + vphi*mu2 - 0.5*(1+vphi)*gamma*sigma^2;
 rp1 = mu1 + (1-b).*(alpha-al(2:end)) - gamma*sigma^2;
 rp2 = mu2 + (1-b).*(alpha-al(2:end)) - gamma*sigma^2;
 
 Y1 = rho1 - (1 -vphi)*(mu1 - 0.5*gamma*sigma^2); 
 Y2 = rho2 - (1 -vphi)*(mu2 - 0.5*gamma*sigma^2);
  
 C1 = (Y1./(1-b) - (1 - vphi).*(alpha-al(2:M)))/vphi;
 C2 = (Y2./(1-b) - (1 - vphi).*(alpha-al(2:M)))/vphi;
 %[Y1' C1' Y2' C2']
 
 vg = (1-vphi)/(1-gamma);
 invp = 1/vphi;
 hp1 = log(rho1*C1.^(-vphi)./(1-b))/vg;
 hp2 = log(rho2*C2.^(-vphi)./(1-b))/vg;
 he1 = log(rho1*(alpha-al(2:M-1)).^(1-vphi)./Y1(1:M-2))/vg;
 he2 = log(rho2*(alpha-al(2:M-1)).^(1-vphi)./Y2(1:M-2))/vg;
 
 idy = find(and(Y1>0,Y2>0));
 ts1 = [alpha - al(2:M)' C1' alpha - al(1:M-1)'];
 ts2 = [alpha - al(2:M)' C2' alpha - al(1:M-1)'];
 
 kp1 = find(ts1(:,1)<ts1(:,2)&ts1(:,2)<ts1(:,3));
 ke1 = find(ts1(1:M-2,1)>=ts1(1:M-2,2)&ts1(1:M-2,1)<=ts1(2:M-1,2));
 kp2 = find(ts2(:,1)<ts2(:,2)&ts2(:,2)<ts2(:,3));
 ke2 = find(ts2(1:M-2,1)>=ts2(1:M-2,2)&ts2(1:M-2,1)<=ts2(2:M-1,2));
 %[1./Y1; 1./Y2; [1./(alpha-al(2:M-1))./(1-b(1:end-1)) inf]; [1./(alpha - al(2:M-1))./(1-b(2:end)) inf]]
 if isempty(kp1)
  kp1 = [];
 endif
 if isempty(kp2)
  kp2 = [];
 endif  
if isempty(idy)
  disp("No Autarky Equilibrium")
endif  
