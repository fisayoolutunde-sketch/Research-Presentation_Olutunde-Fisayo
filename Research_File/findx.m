function a = findx(y)
global PP BB 
%BB
 a = (ppval(PP,y) - BB)/BB;
endfunction
