%%% Trim eps file %%%
%%% option 1: use esptool %%%
system(['epstool --copy --bbox',' ',[fname,'.eps'],' ',[fname,'-new.eps']]);
system(['mv',' ',[fname,'-new.eps'],' ',[fname,'.eps']]);

%%% option 2: use pdfcrop %%%
%system(['epstopdf',' ',[fname,'.eps']]);
%system(['pdfcrop',' ',[fname,'.pdf']]);
%system(['mv',' ',[fname,'-crop.pdf'],' ',[fname,'.pdf']]);
%system(['pdftops',' ','-eps',' ',[fname,'.pdf']]);
