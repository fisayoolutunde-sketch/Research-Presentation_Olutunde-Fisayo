load emp_b.dat %contain investment (dat), price-to-dividend ratio (S&P500,emp.pd), realized volatility (emp.rv), implied volatility (emp.imv)  
clear PS PI
fil = {"1","2","3","4","5","6"} %% emp_XX.dat
pre = "msl_b_";
for k = 1:size(fil,2)
load (strcat(pre,fil{k},".dat"))
PS(k) = spline(xy,SS./div);
PI(k) = spline(xy,1-div/alpha);
lb(k) = xy(SS./div==min(SS./div));
bet(k) = -beta;
end

%%% Fixed beta %%%

ly = pd = sv = cv = iv = wt = Ht = Ct = rf = inv = zeros(size(emp.pd,1),size(PS,2));
for i=1:size(emp.pd,1)
  for j=1:size(PS,2)
   [ly(i,j),pd(i,j)] = findyy(PS(j),emp.pd(i),lb(j));
  endfor
endfor   

for k = 1:size(fil,2)
 load (strcat(pre,fil{k},".dat"))
for i = 1:384
  idx = find(ly(i,k)-xv(1,:)>0);
   sv(i,k) = spline(xv(:,idx(end)),Svol(:,idx(end)),ly(i,k));
   cv(i,k) = spline(xv(:,idx(end)),Cvol(:,idx(end)),ly(i,k));
   iv(i,k) = spline(xv(:,idx(end)),Ivol(:,idx(end)),ly(i,k));
   wt(i,k) = spline(xv(:,idx(end)),wh(:,idx(end)),ly(i,k));
   Ht(i,k) = spline(xv(:,idx(end)),wH(:,idx(end)),ly(i,k));
   Ct(i,k) = spline(xv(:,idx(end)),wC(:,idx(end)),ly(i,k));
   rf(i,k) = spline(xv(:,idx(end)),rr(:,idx(end)),ly(i,k));
   inv(i,k) = ppval(PI(k),ly(i,k));
 endfor
endfor

%%% Varying beta %%%
y = [];
for i = 1:size(emp.pd,1)
  aa = abs(sv(i,:) - emp.rv(i));
  idx = find(aa == min(aa));
   if size(idx,2) == 1  
     rgm(i) = idx;
   else   
    if i>1
     aa = abs(ly(i,idx) - y(i-1));
    else
     aa = abs(ly(i,idx) - ly(i,idx(1)));
    endif  
     rgm(i) = idx(min(find(aa == min(aa))));
   endif 
     msv(i) = sv(i,rgm(i));
     mcv(i) = cv(i,rgm(i));
     miv(i) = iv(i,rgm(i));
     mwt(i) = wt(i,rgm(i));
     mHt(i) = Ht(i,rgm(i));
     mCt(i) = Ct(i,rgm(i)); 
     mrf(i) = rf(i,rgm(i));
     y(i) = ly(i,rgm(i));
     mpd(i) = pd(i,rgm(i)); %ppval(PS(rgm(i)),y(i)); 
     minv(i) = inv(i,rgm(i)); %ppval(PI(rgm(i)),y(i));
endfor

save cal_b.dat sigma bet ly pd sv cv iv wt Ht Ct rf inv rgm msv mcv miv mwt mHt mCt mrf mpd minv y

