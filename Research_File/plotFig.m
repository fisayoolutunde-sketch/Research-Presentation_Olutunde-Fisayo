%%% Plot Figures 2 - 11 %%%

%%% Figure 2 %%%%
subplot(2,2,1)
hold on
load msl_b_1.dat
A1 = plot(xv(:,1:2:end),1-cc(:,1:2:end)/alpha,"b","linewidth",4)
A2 = plot(xv(:,2:2:end),1-cc(:,2:2:end)/alpha,"r","linewidth",4)
A3 = plot(xy,[(1-C1(kp1)/alpha)*(1-Wt) + (1-div(end)/alpha)*Wt], "k--","linewidth",2)
legend([A1(1),A2(1),A3],"smooth","sticky","autarky average",'location',"southwest")
ylim([0.145,0.31])
xlim([-20,20])
xlabel("log(M)")
title('\beta = -0.80, EIS = 0.32')
%text(0.5,0.27,'\eta\beta = -0.15, \alpha = 0.12','fontsize',10)
box on

subplot(2,2,3)
hold on
load msl_b_5.dat
plot(xv(:,1:2:end),1-cc(:,1:2:end)/alpha,"b","linewidth",4)
plot(xv(:,2:2:end),1-cc(:,2:2:end)/alpha,"r","linewidth",4)
plot(xy,[(1-C1(kp1)/alpha)*(1-Wt) + (1-div(end)/alpha)*Wt], "k--","linewidth",2)
ylim([0.145,0.31])
xlim([-20,20])
xlabel("log(M)")
title('\beta = -1.80, EIS = 0.32')
%text(0.5,0.27,'\eta\beta = -0.15, \alpha = 0.12','fontsize',10)
box on

subplot(2,2,2)
hold on
load msl_p_1.dat
plot(xv(:,2:2:end),1-cc(:,2:2:end)/alpha,"b","linewidth",4)
plot(xv(:,1:2:end),1-cc(:,1:2:end)/alpha,"r","linewidth",4)
plot(xy, (al(ke1+1)/alpha)*(1-Wt) + (al(ke2+1)/alpha)*Wt, "k--","linewidth",2)
ylim([0.145,0.195])
xlim([-12,12])
xlabel("log(M)")
title('\beta = -0.80, EIS = 2.00')
%text(-19,0.1925,'\eta\beta = -0.05, \alpha = 0.06','fontsize',10)
box on

subplot(2,2,4)
hold on
load msl_p_2.dat
plot(xv(:,2:2:end),1-cc(:,2:2:end)/alpha,"b","linewidth",4)
plot(xv(:,1:2:end),1-cc(:,1:2:end)/alpha,"r","linewidth",4)
plot(xy, (al(ke1+1)/alpha)*(1-Wt) + (al(ke2+1)/alpha)*Wt, "k--","linewidth",2)
ylim([0.145,0.195])
xlim([-12,12])
xlabel("log(M)")
title('\beta = -2.00, EIS = 2.00')
%text(-19,0.1925,'\eta\beta = -0.05, \alpha = 0.06','fontsize',10)
box on

%print '-depsc' '-S1280,960' fig_inv.eps
fname = 'figure02';
print (fname, '-depsc', '-tight', '-S1280,960')
%trimeps   

%%% Figure 3 %%%
clear
clf
subplot(2,2,1)
hold on
load msl_b_1.dat
rr = S./cc;
A1 = plot(xv(:,1:2:end),rr(:,1:2:end),"b","linewidth",4)
A2 = plot(xv(:,2:2:end),rr(:,2:2:end),"r","linewidth",4)
A3 = plot(xy,(1-Wt)/C1(kp1)/(1-b(kp1)) + Wt/Y2(ke2), "k--","linewidth",2)
legend([A1(1),A2(1),A3],"smooth","sticky","autarky average",'location',"northeast")
ylim([10,61])
xlim([-20,20])
xlabel("log(M)")
title('\beta = -0.80, EIS = 0.32')
%text(0.5,0.27,'\eta\beta = -0.15, \alpha = 0.12','fontsize',10)
box on

subplot(2,2,3)
hold on
load msl_b_5.dat
rr = S./cc;
plot(xv(:,1:2:end),rr(:,1:2:end),"b","linewidth",4)
plot(xv(:,2:2:end),rr(:,2:2:end),"r","linewidth",4)
plot(xy, (1-Wt)/C1(kp1)/(1-b(kp1)) + Wt/Y2(ke2), "k--","linewidth",2)
ylim([10,61])
xlim([-20,20])
xlabel("log(M)")
title('\beta = -1.80, EIS = 0.32')
%text(0.5,0.27,'\eta\beta = -0.15, \alpha = 0.12','fontsize',10)
box on

subplot(2,2,2)
hold on
load msl_p_1.dat
rr = S./cc;
plot(xv(:,2:2:end),rr(:,2:2:end),"b","linewidth",4)
plot(xv(:,1:2:end),rr(:,1:2:end),"r","linewidth",4)
plot(xy,(1-Wt)/Y1(ke1) + Wt/Y2(ke2), "k--","linewidth",2)
ylim([24.5,37.5])
xlim([-12,12])
xlabel("log(M)")
title('\beta = -0.80, EIS = 2.00')
%text(-19,0.1925,'\eta\beta = -0.05, \alpha = 0.06','fontsize',10)
box on

subplot(2,2,4)
hold on
load msl_p_2.dat
rr = S./cc;
plot(xv(:,2:2:end),rr(:,2:2:end),"b","linewidth",4)
plot(xv(:,1:2:end),rr(:,1:2:end),"r","linewidth",4)
plot(xy,(1-Wt)/Y1(ke1) + Wt/Y2(ke2), "k--","linewidth",2)
ylim([24.5,37.5])
xlim([-12,12])
xlabel("log(M)")
title('\beta = -2.00, EIS = 2.00')
%text(-19,0.1925,'\eta\beta = -0.05, \alpha = 0.06','fontsize',10)
box on

%print '-depsc' '-S1280,960' fig_stock.eps
fname = 'figure03';
print (fname, '-depsc', '-tight', '-S1280,960')
%trimeps   

%%% Figure 4 %%%
clear
clf
subplot(2,2,1)
hold on
load msl_b_5.dat
%rr = wh - wH;
A1 = plot(xv,wh,"b","linewidth",4);
A2 = plot(xv,wH,"r","linewidth",4);
A3 = plot(xv,wC, "k-.","linewidth",2);
legend([A1(1),A2(1),A3(1)],'\omega_h(M)','\omega_H(M)','\omega(M)','location',"northwest")
%ylim([0.15,0.285])
xlim([-20,20])
xlabel("log(M)")
title('\beta = -1.80, EIS = 0.32')
%text(0.5,0.27,'\eta\beta = -0.15, \alpha = 0.12','fontsize',10)
box on

subplot(2,2,3)
hold on
load msl_b_5.dat
A1 = plot(xv,wH-wh,"b","linewidth",4);
load msl_b_1.dat
A2 = plot(xv,wH-wh,"r","linewidth",4);
A3 = plot([-20,20],[0,0],"k--","linewidth",2);
ylim([-0.11,0.281])
xlim([-20,20])
xlabel("log(M)")
legend([A1(1),A2(1),A3],'\beta = -1.80','\beta = -0.80',"Autarky",'location',"northwest")
title('\omega_H(M) - \omega_h(M) (EIS = 0.32)')
%text(0.5,0.27,'\eta\beta = -0.15, \alpha = 0.12','fontsize',10)
box on

subplot(2,2,2)
hold on
load msl_p_1.dat
%rr = S./cc;
A1 = plot(xv,wh,"b","linewidth",4);
A2 = plot(xv,wH,"r","linewidth",4);
A3 = plot(xv,wC, "k-.","linewidth",2);
legend([A1(1),A2(1),A3(1)],'\omega_h(M)','\omega_H(M)','\omega(M)','location',"northwest")
%ylim([24,38])
xlim([-12,12])
xlabel("log(M)")
title('\beta = -0.80, EIS = 2.00')
%text(-19,0.1925,'\eta\beta = -0.05, \alpha = 0.06','fontsize',10)
box on

subplot(2,2,4)
hold on
load msl_p_2.dat
A1 = plot(xv,wH-wh,"b","linewidth",4);
load msl_p_1.dat
A2 = plot(xv,wH-wh,"r","linewidth",4);
A3 = plot([-12,12],[0,0],"k--","linewidth",2);
xlim([-12,12])
ylim([-0.151,0.125])
xlabel("log(M)")
legend([A1(1),A2(1),A3],'\beta = -2.00','\beta = -0.80',"Autarky",'location',"northwest")
title('\omega_H(M) - \omega_h(M) (EIS = 2.00)')
%text(-19,0.1925,'\eta\beta = -0.05, \alpha = 0.06','fontsize',10)
box on

fname = 'figure04';
print (fname, '-depsc', '-tight', '-S1280,960')
%trimeps   

%%% Figure 5 %%%

clear
clf
subplot(2,2,1)
hold on
load msl_b_1.dat
A1 = plot(xv(:,2:2:end),Svol(:,2:2:end),"r","linewidth",4)
A2 = plot(xv(:,1:2:end),Cvol(:,1:2:end),"b","linewidth",4)
A3 = plot([-20,30],[0.06,0.06],"k--","linewidth",2)
h1=legend([A1(1),A2(1),A3],"Stock (sticky)","Cons (smooth)","Autarky",'orientation',"vertical",'location',"northwest")
%set(h1,'fontsize',8)
ylim([0.03,0.106])
xlim([-20,20])
xlabel("log(M)")
title('\beta = -0.80, EIS = 0.32')
%text(1,0.195,'\eta\beta = -0.15, \alpha = 0.12','fontsize',10)
box on

subplot(2,2,3)
hold on
load msl_b_5.dat
A1 = plot(xv(:,2:2:end),Svol(:,2:2:end),"r","linewidth",4)
A2 = plot(xv(:,1:2:end),Cvol(:,1:2:end),"b","linewidth",4)
A3 = plot([-20,30],[0.06,0.06],"k--","linewidth",2)
%legend([A1(1),A2(1),A3],"Stock (sticky)","Consumption (smooth)","Autarky")
ylim([0.03,0.48])
xlim([-20,20])
xlabel("log(M)")
title('\beta = -1.80, EIS = 0.32')
%text(1,0.55,'\eta\beta = -0.15, \alpha = 0.12','fontsize',10)
box on

subplot(2,2,2)
hold on
load msl_p_1.dat
A1 = plot(xv(:,1:2:end),Svol(:,1:2:end),"r","linewidth",4)
A2 = plot(xv(:,2:2:end),Cvol(:,2:2:end),"b","linewidth",4)
A3 = plot([-20,20],[0.1,0.1],"k--","linewidth",2)
%h1=legend([A1(1),A2(1),A3],"Stock (sticky)","Consumption (smooth)","Autarky",'orientation',"vertical",'location',"southwest")
set(h1,'fontsize',8)
ylim([0.095,0.12])
xlim([-12,12])
xlabel("log(M)")
title('\beta = -0.80, EIS = 2.00')
%text(1,0.1275,'\eta\beta = -0.05, \alpha = 0.06','fontsize',10)
box on

subplot(2,2,4)
hold on
load msl_p_2.dat
A1 = plot(xv(:,1:2:end),Svol(:,1:2:end),"r","linewidth",4)
A2 = plot(xv(:,2:2:end),Cvol(:,2:2:end),"b","linewidth",4)
A3 = plot([-20,20],[0.1,0.1],"k--","linewidth",2)
%legend([A1(1),A2(1),A3],"Stock (sticky)","Consumption (smooth)","Autarky")
ylim([0.05,0.58])
xlim([-12,12])
xlabel("log(M)")
title('\beta = -2.00, EIS = 2.00')
%text(1,0.3,'\eta\beta = -0.05, \alpha = 0.06','fontsize',10)
box on

%print '-depsc' '-S1280,960' fig_vol.eps

fname = 'figure05';
print (fname, '-depsc', '-tight', '-S1280,960')
%trimeps   

%%% Figure 6 %%%
clear
clf
subplot(2,2,1)
hold on
load msl_b_1.dat
A1 = plot(xv(:,1:2:end),rr(:,1:2:end),"b","linewidth",4)
A2 = plot(xv(:,2:2:end),rr(:,2:2:end),"r","linewidth",4)
A3 = plot(xy,rr(1,1)*(1-Wt) + rr(end,end)*Wt, "k--","linewidth",2)
legend([A1(1),A2(1),A3],"smooth","sticky","autarky average",'location',"southeast")
%ylim([0.15,0.285])
xlim([-20,20])
xlabel("log(M)")
title('\beta = -0.80, EIS = 0.32')
%text(0.5,0.27,'\eta\beta = -0.15, \alpha = 0.12','fontsize',10)
box on

subplot(2,2,3)
hold on
load msl_b_5.dat
plot(xv(:,1:2:end),rr(:,1:2:end),"b","linewidth",4)
plot(xv(:,2:2:end),rr(:,2:2:end),"r","linewidth",4)
plot(xy,rr(1,1)*(1-Wt) + rr(end,end)*Wt, "k--","linewidth",2)
%ylim([0.15,0.285])
xlim([-20,20])
xlabel("log(M)")
title('\beta = -1.80, EIS = 0.32')
%text(0.5,0.27,'\eta\beta = -0.15, \alpha = 0.12','fontsize',10)
box on

subplot(2,2,2)
hold on
load msl_p_1.dat
plot(xv(:,2:2:end),rr(:,2:2:end),"b","linewidth",4)
plot(xv(:,1:2:end),rr(:,1:2:end),"r","linewidth",4)
plot(xy,rr(1,1)*(1-Wt) + rr(end,end)*Wt, "k--","linewidth",2)
%ylim([0.15,0.192])
xlim([-12,12])
xlabel("log(M)")
title('\beta = -0.80, EIS = 2.00')
%text(-19,0.1925,'\eta\beta = -0.05, \alpha = 0.06','fontsize',10)
box on

subplot(2,2,4)
hold on
load msl_p_2.dat
plot(xv(:,2:2:end),rr(:,2:2:end),"b","linewidth",4)
plot(xv(:,1:2:end),rr(:,1:2:end),"r","linewidth",4)
plot(xy,rr(1,1)*(1-Wt) + rr(end,end)*Wt, "k--","linewidth",2)
%ylim([0.15,0.192])
xlim([-12,12])
xlabel("log(M)")
title('\beta = -2.00, EIS = 2.00')
%text(-19,0.1925,'\eta\beta = -0.05, \alpha = 0.06','fontsize',10)
box on

%print '-depsc' '-S1280,960' fig_int.eps
fname = 'figure06';
print (fname, '-depsc', '-tight', '-S1280,960')
%trimeps   

%%% Figure 7 %%%
 
clear
clf
load msl_b_3.dat
DP = sqrt(wh.*(1-wh))*abs(beta)*sigma*100;
subplot(2,2,1)
hold on
A1 = plot(DP(:,1:2:end),100*(1-cc(:,1:2:end)/alpha),"b","linewidth",4)
A2 = plot(DP(:,2:2:end),100*(1-cc(:,2:2:end)/alpha),"r","linewidth",4)
ylim([14.9,30.1])
%xlim([-20,20])
xlabel("Dispersion (%)")
ylabel("Investment/Output (%)")
legend([A1(1),A2(1)],"smooth","sticky",'location',"northeast")
title("Investment vs. Dispersion")
%text(1,0.195,'\eta\beta = -0.15, \alpha = 0.12','fontsize',10)
box on

subplot(2,2,3)
AA = cc./S*100;
hold on
plot(DP(:,1:2:end),AA(:,1:2:end),"b","linewidth",4)
plot(DP(:,2:2:end),AA(:,2:2:end),"r","linewidth",4)
%ylim([0.03,0.106])
%xlim([-20,20])
xlabel("Dispersion (%)")
ylabel("Dividend Yield (%)")
title("Yield vs. Dispersion")
%text(1,0.55,'\eta\beta = -0.15, \alpha = 0.12','fontsize',10)
box on

id = (wC > wh);
SEN = zeros(size(wh));
SEN(id) = 2 - 2*wC(id);
SEN(!id) = 2*wC(!id);
SEN = SEN*100*5/6.7558+2;
subplot(2,2,2)
hold on
plot(SEN(:,1:2:end),100*(1-cc(:,1:2:end)/alpha),"b","linewidth",4)
plot(SEN(:,2:2:13),100*(1-cc(:,2:2:13)/alpha),"r","linewidth",4)
plot(SEN(1:45,14),100*(1-cc(1:45,14)/alpha),"r","linewidth",4)
plot(SEN(:,16:2:end),100*(1-cc(:,16:2:end)/alpha),"r","linewidth",4)
plot(SEN(46:100,14),100*(1-cc(46:100,14)/alpha),"r","linewidth",4)
ylim([14.9,30.1])
xlim([45,155])
xlabel("Sentiment")
ylabel("Investment/Output (%)")
%legend([A1(1),A2(1)],"smooth","sticky",'location',"northeast")
title("Investment vs. Sentiment")
%text(1,0.195,'\eta\beta = -0.15, \alpha = 0.12','fontsize',10)
box on

subplot(2,2,4)
%AA = cc./S*100;
hold on
plot(SEN(:,1:2:end),AA(:,1:2:end),"b","linewidth",4)
%plot(SEN(:,2:2:end),AA(:,2:2:end),"r","linewidth",4)
plot(SEN(:,2:2:13),AA(:,2:2:13),"r","linewidth",4)
plot(SEN(1:45,14),AA(1:45,14),"r","linewidth",4)
plot(SEN(:,16:2:end),AA(:,16:2:end),"r","linewidth",4)
plot(SEN(46:100,14),AA(46:100,14),"r","linewidth",4)
%ylim([0.03,0.106])
xlim([45,155])
xlabel("Sentiment")
ylabel("Dividend Yield (%)")
title("Yield vs. Sentiment")
%text(1,0.55,'\eta\beta = -0.15, \alpha = 0.12','fontsize',10)
box on

fname = 'figure07';
print (fname, '-depsc', '-tight', '-S1280,960')
%trimeps   

%%% Figure 8 %%%

%%%% linear and quadratic costs
clear
clf
load ln-quad.dat
load msl_b_6.dat SS div

subplot(2,2,1)
hold on
plot(xx,yy,"+","linewidth",3)
plot(x,yl,"linewidth",3)
ylim([-0.52,0.62])
xlabel("P/D Ratio")
xlim([13,51])
set(gca,'xtick',[15:5:50])
ylabel("Investment/Output")
title("Linear Cost")
legend("data",'\alpha(1-b) = 0.0475, rmse = 19.4%','fontsize',8,'location',"southeast")
box on

subplot(2,2,2)
hold on
plot(xx,yy,"+","linewidth",3)
plot(x,yq,"linewidth",3)
plot(x,ya,"--","linewidth",3)
ylim([0.12,0.25])
xlim([13,51])
xlabel("P/D Ratio")
ylabel("Investment/Output")
set(gca,'xtick',[15:5:50])
title("Quadratic Cost")
legend("data",'\alpha* = 0.385, b* = 11.1, rmse = 1.42%','\alpha  = 0.12, b* = 25.8, rmse = 2.45%', 'fontsize',8,'location',"southeast")
%legend('FontSize',2)
%legend("boxoff")
box on

subplot(2,2,3)
hold on
plot(xx,yy,"+","linewidth",3)
plot(x,yl,"--","linewidth",3)
plot(x,yq,"-.","linewidth",3)
plot(SS./div,1-div/alpha,"linewidth",3)
xlim([13,51])
ylim([0.13,0.24])
xlabel("P/D Ratio")
ylabel("Investment/Output")
set(gca,'xtick',[15:5:50])
title("Comparison (Investment)")
legend("data","linear","quadratic","piece-wise, rmse = 1.44%",'location',"southeast",'numcolumns',3)
box on

subplot(2,2,4)
hold on
plot([14,49.8],[alpha/sl,alpha/sl],"--","linewidth",3)
plot(x,1./(1-s(1)*s(2)*yq),"-.","linewidth",3)
plot(x,1./(1-0.12*sq*ya),":","linewidth",3)
plot(SS./div,SS,"linewidth",3)
xlim([13,51])
ylim([1,15])
xlabel("P/D Ratio")
ylabel("Market/Capital")
set(gca,'xtick',[15:5:50])
title("Comparison (Market/Book)")
legend('linear (\alpha = 0.12)',"quadratic",'quadratic (\alpha = 0.12)','piece-wise (\alpha = 0.12)','fontsize',8,'location',"northwest")
box on

fname = 'figure08';
print (fname, '-depsc', '-tight', '-S1280,960')
%trimeps   
 
%%% Figure 9 %%%
clear
clf
load emp_b.dat
load cal_b.dat
subplot(2,2,3:4)
ind = !(msv==sigma);
plot(emp.date,emp.rv*100,"linewidth",3)
hold on
plot(emp.date,msv*100,"linewidth",3)
%plot(emp.date(ind,1),msv(ind)*100,"+","linewidth",3)
datetick("mm/yy")
xlim([emp.date(1),emp.date(end)])
ylim([4,78])
set(gca,'ytick',[5:10:75])
%xlabel("Year")
ylabel("Volatility (\%)")
h1=legend("data","model implied",'location',"northwest")
%h1=legend("data","model implied, sticky","model implied, smooth",'location',"northwest")
set(h1,'fontsize',24)
title('Varying \beta')

subplot(2,2,1)
plot(emp.date(ind),[emp.rv(ind)*100 sv(ind,3:4)*100],"linewidth",3)
datetick("mm/yy")
xlim([emp.date(1),emp.date(end)])
ylim([4,78])
set(gca,'ytick',[5:10:75])
ylabel("Volatility (\%)")
h2=legend("data",'model, \beta = -1.15','model, \beta = -1.40','location',"northwest")
set(h2,'fontsize',14)
title('Fixed \beta')

subplot(2,2,2)
hold on
plot(emp.pd,emp.rv*100,"+","linewidth",1)
for k=1:6
ind = (rgm == k);
plot(emp.pd(ind),msv(ind)*100,"*","linewidth",1)
end
xlim([13,52])
ylim([4,78])
set(gca,'ytick',[5:10:75])
set(gca,'xtick',[15:5:50])
xlabel("P/D Ratio")
ylabel("Volatility (\%)")
box on
legend("data","-0.80","-0.95","-1.15","-1.40","-1.80","-2.50")
%legend{"numcolumns",2)
title("P/D vs. Volatility")
%print '-depsc' '-S1280,960' fig_vol_tmd.eps
fname = 'figure09';
print (fname, '-depsc', '-tight', '-S1280,960')
%trimeps   

clf;
%%% Figure 10 %%%
mon = [emp.date bet(rgm)' mCt' sqrt(mwt'.*(1-mwt')) sqrt(mwt'.*(1-mwt').*((bet(rgm)').^2-(2/3)^2))];
MIV = mean(reshape(minv,3,128))';
subplot(3,1,1)
[D1,d1,d2] = plotyy(emp.date,bet(rgm),emp.date,[mon(:,4)*2/3 mon(:,5)]*sigma)
set(d1,'linewidth',3)
set(d2,'linewidth',3)
datetick(D1(1),'x',"mm/yy")
datetick(D1(2),'x',"mm/yy")
xlim([emp.date(1),emp.date(end)])
set(D1(1),'ylabel',"Disagreement")
set(D1(1),'ylim', [0.75,2.55])
set(D1(2),'ylabel',"Dispersion")
set(D1(2),'ylim', [0,0.06])
legend("DPF","DPE",'|\beta|','location',"northwest",'orientation',"vertical")
title('Implied Disagreements and Dispersions')

subplot(3,1,2)
[Aa,a1,a2] = plotyy(emp.date,y,emp.date,[1-mwt' 1-mCt'])
set(a1,'linewidth',3)
set(a2,'linewidth',3)
datetick(Aa(1),'x',"mm/yy")
datetick(Aa(2),'x',"mm/yy")
xlim([emp.date(1),emp.date(end)])
set(Aa(1),'ylabel',"log(M)")
set(Aa(1),'ylim',[-6,2.5])
set(Aa(2),'ylabel',"Share")
legend("wealth","consumption","log(M)",'location',"southwest",'orientation',"horizontal")
title("log(M) and Investor 1's Wealth (Consumption) Share")

subplot(3,1,3)
[Ax,h1,h2] = plotyy(emp.date,[mpd],dat(:,1),[dat(:,2) MIV])
set(h1,'linewidth',3)
set(h2,'linewidth',3)
datetick(Ax(1),'x',"mm/yy")
datetick(Ax(2),'x',"mm/yy")
xlim([emp.date(1),emp.date(end)])
set(Ax(1),'ylabel',"P/D Ratio")
set(Ax(1),'ylim',[13,52])
set(Ax(2),'ylabel',"Investment/Output")
set(Ax(2),'ylim',[0.15,0.24])
legend("investment, data","investment, model","p/d ratio",'orientation',"horizontal",'location',"southwest")
title('P/D Ratio and Investment')

fname = 'figure10';
print (fname, '-depsc', '-tight', '-S1280,960')
%trimeps   

%%% Figure 11 %%%
clear
clf
load msl_p_2.dat
subplot(1,2,1)
vphi = 1/0.32;
bet = linspace(-2.4,2.4,100)';
for i = 1:100
 beta = bet(i);
 eta = 0.025;
 getAuk
 dn1(i) = min([C1(kp1)*(1-b(kp1)) Y1(ke1)],(Y1(1)-Y2(1))/vphi + (invp - 1)*beta^2/gamma/2)*(gamma - vphi)/(1-vphi);
 dn2(i) = -min([C2(kp2)*(1-b(kp2)) Y2(ke2)],(Y2(1)-Y1(1))/vphi + (invp - 1)*beta^2/gamma/2)*(gamma - vphi)/(1-vphi);
end 
plot(bet,[dn1' dn2'],"linewidth",4)
hold on
plot(bet,[bet.^2/2 -bet.^2/2],"g-.","linewidth",3)
ylim([-0.25,0.22])
legend('\nu_1(0) - \nu_2(0)','\nu_1(\infty) - \nu_2(\infty)','\pm \beta^2/2','orientation',"horizontal",'location',"south")
xlabel('\beta')
title('\eta = 0.025, EIS = 0.32')
text(-2.8,0,"both investors",'fontsize',10)
text(0.9,0,"both investors",'fontsize',10)
text(-0.7,0.12,"investor 1",'fontsize',10)
text(-0.7,-0.12,"investor 2",'fontsize',10)
box on

subplot(1,2,2)
%load msl_p_2.dat
bet = linspace(-2,2,100)';
vphi = 1/2;
 for i = 1:100
 beta = bet(i);
 eta = 0.025;
 getAuk
 dn1(i) = min([C1(kp1)*(1-b(kp1)) Y1(ke1)],(Y1(1)-Y2(1))/vphi + (invp - 1)*beta^2/gamma/2)*(gamma - vphi)/(1-vphi);
 dn2(i) = -min([C2(kp2)*(1-b(kp2)) Y2(ke2)],(Y2(1)-Y1(1))/vphi + (invp - 1)*beta^2/gamma/2)*(gamma - vphi)/(1-vphi);
end 
plot(bet,[dn1' dn2'],"linewidth",4)
hold on
plot(bet,[bet.^2/2 -bet.^2/2],"g-.","linewidth",3)
ylim([-0.4,0.4])
legend('\nu_1(0) - \nu_2(0)','\nu_1(\infty) - \nu_2(\infty)','\pm \beta^2/2','orientation',"horizontal",'location',"south")
xlabel('\beta')
title('\eta = 0.025, EIS = 2')
text(-1.8,0,"both investors",'fontsize',10)
text(0.4,0,"both investors",'fontsize',10)
text(0,0.1,"investor 1",'rotation',90,'fontsize',10)
text(0,-0.04,"investor 2",'rotation',-90,'fontsize',10)
box on

%print '-depsc' '-S1280,480' fig_dnus.eps
fname = 'figure11';
print (fname, '-depsc', '-tight', '-S1280,480')
%trimeps 
quit
