function[]=drawFigure(ITER,s1,s2,s3,dispStr,kStr,k2Str,xStr,yStr,legend1Str,legend2Str);
disp(dispStr);
resultAll = [s1, s2(end)]
x=1:ITER;
figure,plot(x,s2, kStr, x, s3, k2Str);
xlabel(xStr);
ylabel(yStr);
legend(legend1Str, legend2Str);
