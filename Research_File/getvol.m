 S = wh = whh = pi1 = pi2 = wH = wHH = wC = rr = nu1 = nu2 = ids = zeros(100,Mn-1);
 for i=1:Mn-1
 xx = linspace(xv(1,i),xv(end,i),50)';
 yy = [2*xx(1)-xx(2);xx;2*xx(end)-xx(end-1)];
 v = exp(vl(:,i)).*[ones(size(xv(:,i))),vp(:,i)]; %v = exp([vl(:,i) vp(:,i)]);
 dh = vp(:,i); %dh = exp(vp(:,i)-vl(:,i));
 ddh = spline(xv(:,i),dh,yy);
 ddh = (ddh(3:end)-ddh(1:end-2))./(yy(3:end)-yy(1:end-2));
 ddh = spline(xx,ddh,xv(:,i));
 Haa = (rho1*(v(:,1) - v(:,2)).^(1-vg)).^invp; 
 Ha = Haa + (rho2*exp(vg*xv(:,i) + (1-vg)*log(v(:,2)))).^invp;
 omg = (Ha - Haa)./Ha;
 H = vphi*log(Ha);
 SS = ald(id(i+1))^(vphi)*exp(vl(:,i) - H);
 HH = spline(xv(:,i),H,yy);
 dH = (HH(3:end) - HH(1:end-2))./(yy(3:end)-yy(1:end-2));
 ddH = (HH(1:end-2) + HH(3:end)  - 2*HH(2:end-1))/(yy(2)-yy(1))^2;
 dH = spline(xx,dH,xv(:,i));
 ddH = spline(xx,ddH,xv(:,i));
 %sS = -(dh - dH)*beta;
 %sigS = sqrt(sigma^2 + 2*sigma*eta*sS + sS.^2);
  if dx(i) == 0
    n1 = rho1*(1/vg + (gamma - vphi)*(ald(id(i+1))*(rho1*(v(:,1) - v(:,2)).^(-gamma/(1 - gamma))).^invp./Ha).^(1 - vphi)/(1 - vphi));
    n2 = rho2*(1/vg + (gamma - vphi)*(ald(id(i+1))*(rho2*exp(xv(:,i)/(1-gamma)).*(v(:,2)).^(-gamma/(1 - gamma))).^invp./Ha).^(1 - vphi)/(1 - vphi));
    ra1 = gamma*(mu1(id(i+1)) - (1+gamma)*sigma^2/2);
    ra2 = gamma*(mu2(id(i+1)) - (1+gamma)*sigma^2/2);
   
    rr(:,i) = (1 - dH).*(n1 + ra1) + dH.*(n2 + ra2) - beta^2*(ddH - dH.*(1 - dH))/2;
    nu1(:,i) = n1;
    nu2(:,i) = n2;
    S(:,i) = SS;
    %Svol(:,i) = sigS;
    %wh(:,i) = dh;
    %wH(:,i) = dH;
    %wC(:,i) = omg;
    ids(:,i) = 1; %sS/beta;
  else  
   n1 = rho1*(1/vg + (gamma - vphi)*(rho1*(v(:,1) - v(:,2)).^(-gamma/(1-gamma))./v(:,1)/(1-dx(i))).^(invp-1)/(1-vphi));
   n2 = rho2*(1/vg + (gamma - vphi)*(rho2*exp(xv(:,i)/(1 - gamma)).*(v(:,2)).^(-gamma/(1-gamma))./v(:,1)/(1-dx(i))).^(invp-1)/(1-vphi));
   ra1 = mu1(id(i+1)) + (1 - dx(i))*ald(id(i+1)) - gamma*sigma^2;
   ra2 = mu2(id(i+1)) + (1 - dx(i))*ald(id(i+1)) - gamma*sigma^2;
   rr(:,i) = (1 - dh)*ra1 + dh*ra2;
   nu1(:,i) = n1;
   nu2(:,i) = n2;
   S(:,i) = 1/(1 - dx(i));
   %Svol(:,i) = sigma;
   ids(:,i) = 0;
  endif 
   
   wh(:,i) = dh;
   whh(:,i) = ddh - dh.*(1-dh);
   wHH(:,i) = ddH - dH.*(1-dH);
   wH(:,i) = dH;
   wC(:,i) = omg;
endfor

Svol = -(wh - wH).*ids*beta;
pi1 = sigma + (wh.*(!ids) + wH.*ids + whh./(1-wh))*eta*beta;
pi2 = sigma - (1-wh.*(!ids) - wH.*ids + whh./wh)*eta*beta;
%pi1 = pi1./(sigma + Svol*eta);
%pi2 = pi2./(sigma + Svol*eta);
Svol = sqrt(sigma^2 + 2*eta*sigma*Svol + Svol.^2);
Cvol = (wh - wH).*(!ids)*beta/vphi;
Cvol = sqrt(sigma^2 + 2*eta*sigma*Cvol + Cvol.^2);
Ivol = -(wh - wH).*(!ids).*cc./(alpha - cc)*beta/vphi;
Ivol = sqrt(sigma^2 + 2*eta*sigma*Ivol + Ivol.^2);

SS = Sh = [];
for i=1:Mn-1
 if i<Mn-1
  SS = [SS;S(1:end-1,i)];
 else
  SS = [SS;S(:,i)];
 endif
end
 
clear BB Ha Haa H HH PP Ss Yy adj ans dH ddH ddh dh div1 ep i ind omg ord pl n1 n2 ra1 ra2 sigS ts1 ts2 v vop vop1 vop2 vv vv11 xx y1 yy Ss ya
%save msl_b_6.dat
