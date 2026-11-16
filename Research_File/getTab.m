%%% Table 1 %%%
load msl_b_1.dat %%%
load cal_b.dat bet
format bank
display("Table 1: Panel A")

disp([rho1*100 rho2*100 1/vphi gamma mu0*100 sigma*100 alpha*100])

display("Table 1: Panel B")
k = [-1:1:10];
disp([k; al/alpha;[b NaN]])

display("Table 1: Panel C")
 
disp([mu1;mu2;Y1;Y2]*100)

display("Table 1: Panel D")
disp([-bet;(-2/3./bet).^2*100])

display("Table 1: Panel E")
disp([C1(kp1) alpha-C1(kp1) sigma sigma 1-C1(kp1)/alpha 0 rp1(kp1) 1/C1(kp1)/(1-b(kp1))/100 sigma; alpha - al(ke2+1) al(ke2+1) sigma sigma al(ke2+1)/alpha 0 re2(ke2) 1/Y2(ke2)/100 sigma]*100)

%%% Table 2 %%%
clear
load cal_b.dat
load emp_b.dat

for k=1:size(bet,2)
 idx = (rgm==k);
 A(k) = sum(idx)/size(emp.pd,1);
 B(:,k) = [sqrt(mean(emp.rv(idx).^2));sqrt(mean(msv(idx).^2));sqrt(sum((emp.rv(idx)-msv(idx)').^2)/sum(idx));sqrt(mean(mcv(idx).^2));sqrt(mean(miv(idx).^2));mean(minv(idx));mean(mrf(idx))];
 Va(:,k) = (sum([emp.rv(idx)-B(1,k) msv(idx)'-B(2,k)].^2))'./[sum((emp.rv-mean(emp.rv)).^2);sum((msv-mean(msv)).^2)];
end

B = [A;zeros(2,6)*NaN;B(1:3,:);zeros(3,6)*NaN;B(4:6,:);zeros(2,6)*NaN;B(7,:)];
B = [B*100 [sum(A)*100 std(diff(y))*sqrt(12) sqrt(mean(bet(rgm).^2)) sqrt(mean(emp.rv.^2))*100 sqrt(mean(msv.^2))*100 sqrt(mean((emp.rv - msv').^2))*100 std(diff(msv))*sqrt(12)*100 corr(msv(1:end-1)',msv(2:end)') corr(mpd',msv') sqrt(mean(mcv.^2))*100 sqrt(mean(miv.^2))*100 mean(minv)*100 std(diff(minv))*sqrt(12)*100 sqrt(mean((minv(1:3:end)'-dat(:,2)).^2))*100 mean(mrf)*100]'];
format bank
display("Table 2: Panel A")
disp([-bet;std(diff(ly))*sqrt(12);sqrt(mean(sv.^2))*100;std(diff(sv))*sqrt(12)*100;
 diag(corr(sv(1:end-1,:),sv(2:end,:)))';diag(corr(pd,sv))';sqrt(mean((sv-repmat(emp.rv,1,6)).^2))*100])

display("Table 2: Panel B")

disp(B)

display("Table 2: Panel C")

disp([Va sum(Va')']*100)

%%% Table 3 %%%

pkg load io
uncq = xlsread('Dispersion.xlsx','Quarterly');
unc = xlsread('Dispersion.xlsx','Monthly');
UNC = {"INV","UMS","NGG","RGG","INF","INP","COM","CPF","RNR","RRI","FCI","SLG"};
idx = [1 2 4 5 10 12];
Name = ["DYD",UNC(idx(1:4)),"EPU","RVL","SEN","DPF","DPE"];
 
%%%%%%%%%%%%%%% CORRELATION

Nn = 128;
idm = [1:3:3*Nn]; %% using first month model var as the quarterly var

mon = [emp.date bet(rgm)' 1-mCt' sqrt(mwt'.*(1-mwt')) sqrt(mwt'.*(1-mwt').*((bet(rgm)').^2-(-2/3)^2))]; %%% eta*beta == -2/3 
%X = [ones(Nn,1) mon(idm,3:end)];
qua = [uncq(1:Nn,[1 2 3 5 6]) unc(idm,3) emp.rv(idm) mon(idm,3:end)];

COR=corr([1./emp.pd(idm) qua(:,2:end)]);
  %[uncq(1:128,idx(1:4)+1) unc(3:3:384,3) rv(idm) X(:,2:end)])

display("Table 3: Correlations")

for i = 1:size(COR,1)-1
 for j = 1:size(COR,1)
  if j == 1 
    printf("%s &",Name{i})  
  elseif j <= i
    printf(" &")
  elseif j == i+1
   if i < size(COR,1)-1
    printf("%5.2f &", COR(i,j)) 
   else
    printf("%5.2f\\\\\n",COR(i,j))
   endif   
  elseif (j > i+1)&(j < size(COR,1))
    printf("%5.2f &", COR(i,j))   
  elseif j == size(COR,2)
    printf("%5.2f\\\\\n",COR(i,j))
  endif
 endfor
endfor 


