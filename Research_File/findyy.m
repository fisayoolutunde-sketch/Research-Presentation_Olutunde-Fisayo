function [yy, mpd] = findyy(PP,pd,lb)

%m = PP.dim;
yy1 = -12;
yy2 = lb;
if pd < ppval(PP,lb)
 yy = lb;
else
ep = 10;
while ep > 1e-8
yy = 0.5*(yy1 + yy2);
aa = ppval(PP,yy) - pd;
if aa > 0
yy1 = yy;
else
yy2 = yy;
endif
ep = max(abs(aa));
if max(abs(yy1 - yy2)) < eps
break
endif
endwhile
endif
mpd = ppval(PP,yy);
endfunction

