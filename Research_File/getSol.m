global PP BB
Mn = size(y,2);
 xv = vl = vp = cc = zeros(100,Mn-1);
 if vphi < 1
   idx = find(id == max(id)); 
 else
   idx = find(id == min(id));
 endif  
 %y1 = linspace(y(1),y(2),100)';
  y1 = [y(1), y(2)+0.5];
 
   [y1 v]=ode45(@value_odeA,y1,vv1,opt,rho1,rho2,gamma,vphi,ald(id(2)),Y1(id(2)),Y2(id(2)),beta,dx(1));
    [y1,ord] = unique(y1); 
    y1 = y1(1:end-1);
    ord = ord(1:end-1);
    v = v(ord,:);
   Ha = ((exp(-vg*v(:,1)).*rho1.*(1 - v(:,2)).^(1-vg)).^invp + (rho2*exp(vg*(y1-v(:,1))).*(v(:,2)).^(1-vg)).^invp);
   %Ha = (rho1*(v(:,1) - v(:,2)).^(1-vg)).^invp + (rho2*exp(vg*y1).*(v(:,2)).^(1-vg)).^invp;

   
   if dx(1) == 0
      Yy = ((1 - dx(2))).^invp;
      BB = ald(id(2));
    else
      Yy = ((1 - dx(1))).^invp;
      BB = ald(id(2));
    endif    
      Yy = Ha./Yy;
      PP = spline(y1,Yy);
      
      y(2) = fsolve("findx",y(2));
       xv(:,1) = linspace(y(1),y(2),100)';
       
       vl(:,1) = spline(y1,v(:,1),xv(:,1));
       vp(:,1) = spline(y1,v(:,2),xv(:,1));
       
       %rt = exp(vp(:,1) - vl(:,1));   
      
    if dx(1) == 0
       Yy = ones(100,1)*ald(id(2));
    else
       Yy = spline(y1,Yy,xv(:,1));
    endif  
        
   %Sy = ones(size(y1))/(1 - dx(1));
   xy = xv(1:end-1,1);
   Wt = vp(1:end-1,1);
   div = Yy(1:end-1);
   cc(:,1) = Yy;
   %Sa = Sy(1:end-1);
   %Sv = sigma*ones(size(xy));

for i = 2:Mn-1
    %y1 = linspace(y(i),min(y(i+1)+1,y(Mn)),100)';
    y1 = [y(i), min(y(i+1)+0.5,y(Mn))];
    vv = [vl(end,i-1), vp(end,i-1)];
   [y1 v]=ode45(@value_odeA,y1,vv,opt,rho1,rho2,gamma,vphi,ald(id(i)),Y1(id(i)),Y2(id(i)),beta,dx(i));
    [y1,ord] = unique(y1);
    y1 = y1(1:end-1);
    ord = ord(1:end-1);
    v = v(ord,:);
    Ha = ((exp(-vg*v(:,1)).*rho1.*(1 - v(:,2)).^(1-vg)).^invp + (rho2*exp(vg*(y1-v(:,1))).*(v(:,2)).^(1-vg)).^invp);
        
    if dx(i) == 0
      Yy = ((1 - dx(i+1))).^invp;
      BB = ald(id(i+1));
    else
      Yy = ((1 - dx(i))).^invp;
      BB = ald(id(i+1));
    endif    
      Yy = Ha./Yy;
      PP = spline(y1,Yy);
    if i < Mn - 1
     if or(and(size(idx,2)>2,i == idx(2)),and(size(idx,2) == 2,i == idx(1)))
      %BB = ald(id(i)-1);
      y(i+1) = fsolve("findx",y(i+1)+1); %usually it is 1!
      
      %disp('it happens here') 
     else
      y(i+1) = fsolve("findx",y(i+1));
     endif   
    endif       
       xv(:,i) = linspace(y(i),y(i+1),100)';
       
       vl(:,i) = spline(y1,v(:,1),xv(:,i));
       vp(:,i) = spline(y1,v(:,2),xv(:,i));
       %rt = exp(vp(:,i) - vl(:,i));
    if dx(i) == 0
       div1 = [ones(100,1)*ald(id(i))];
    else
       div1 = [spline(y1,Yy,xv(:,i))];
    endif  
 if i < Mn-1
  ind = [1:99];
 else
  ind = [1:100];
  n1 = rho1*(1/vg + (gamma - vphi)*(ald(id(i))*(rho1*(v(:,1) - v(:,2)).^(-gamma/(1 - gamma))).^invp./Ha).^(1 - vphi)/(1 - vphi));
  %min(div(end)/SS(end),(Y2(1)-Y1(1))/vphi + (invp - 1)*beta^2/gamma/2)*(vphi-gamma)/(1-vphi)
  %n2 = rho2*(1/vg + (gamma - vphi)*(ald(id(i+1))*(rho2*exp(y1/(1-gamma)).*(v(:,2)).^(-gamma/(1 - gamma))).^invp./Ha).^(1 - vphi)/(1 - vphi));
  n2 = rho2*(1/vg + (gamma - vphi)*(ald(id(i+1))*(rho2*exp(y1/(1-gamma)).*(v(:,2)).^(-gamma/(1 - gamma))).^invp./Ha).^(1 - vphi)/(1 - vphi));
  plot(y1,n1-n2,"linewidth",3)
  [vl(end,end)-y(end) he2(ke2)]
 endif      
 xy = [xy;xv(ind,i)];
 Wt = [Wt;vp(ind,i)];
 div = [div;div1(ind)]; 
 cc(:,i) = div1;
 %Sa = [Sa;Sy(ind)];
 %Sv = [Sv;Svv];
endfor
if i<Mn
 plot(y1,[Yy ppval(PP,y1) repmat([ald(id(i:i+1))  BB],size(y1))],"linewidth",3)
endif 
%clear y1 Yy Sy Svv vv rt Ha PP BB idx
pl = 0;
if pl == 1
plot(xx,S,'linewidth',4)
hold on
plot(xx,repmat(bd(M-2,:),size(xx,1),1),'--r','linewidth',3)
plot(xx,repmat(bd(M-3,:),size(xx,1),1),'-.g','linewidth',3)
endif
%%
adj = 0;
if adj == 1
 id = [id(1:idx(2)) 3 3 id(idx(3):end)];
 dx = [dx(1:idx(2)) 0 0.25 dx(idx(3):end)]; 
 y = [y(1:idx(2)) 3 5 y(idx(3):end)]; 
 
 id = [id(1:idx(1)) 6 6 id(idx(2):end)];
 dx = [dx(1:idx(1)) 0.35 0 dx(idx(2):end)]; 
 y = [y(1:idx(1)) 3 5 y(idx(2):end)]; 
endif 
