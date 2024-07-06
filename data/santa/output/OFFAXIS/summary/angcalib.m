% angcalib -- Simple script to run linear fit
%   on SANTA angle-calibration data

% read data
FILENAME = 'orig_fit.dat'
import_labeled_data

% plot points
f = figure('position', [0 0 1000 1000]);
ax = axes;
s = plot(MU, DEG, 'ob');
set(s, 'markerfacecolor', 'b')
T = title('SANTA | Rough Angular Calibration');
xla = xlabel('\varphi_{Recon} (^{o})');
yla = ylabel('\varphi_{True} (^{o})');
xlim([-5 25])
ylim([-5 50])
grid on
hold on

% perform and plot fit
[P S] = polyfit(MU, DEG, 1);
XL = xlim;
% % using polyval and plot:
% X = linspace(XL(1), XL(2), 1000);
% Y = polyval(P, X);
% p = plot(X, Y, 'r');
% using anon func and fplot:
F = @(x) P(1)*x + P(2);
[FX FY]  = fplot(F, XL);
p = plot(FX, FY, 'r');

% coefficient of determination (i.e., R^2)
SSe = sumsq(DEG - S.yf);
SSt = sumsq(DEG - mean(DEG));
Rsq = 1 - SSe/SSt;

% annotations
l = legend([s p], {'Data  ', 'Linear Fit  '}, 'location', 'northwest');
% fitstr = sprintf("y = %1.2f x + %1.2f  ", P(1), P(2));
% l = legend([s p], {'Data  ', fitstr}, 'location', 'northwest');

print basic fit info:
% % to stdout
% printf('\nLinear Fit Results:\n')
% printf('Model\t\tY = m*X + B\n')
% printf('m\t\t%g\n', P(2))
% printf('b\t\t%g\n', P(1))
% printf('R^2\t\t%f\n', Rsq)
% printf('\n')
% to file
fout = fopen('angcalib_fitresult.txt', 'w');
fprintf(fout, 'Linear Fit Results:\n')
fprintf(fout, 'Model\t\tY = m*X + B\n')
fprintf(fout, 'm\t\t%g\n', P(2))
fprintf(fout, 'b\t\t%g\n', P(1))
fprintf(fout, 'R^2\t\t%f\n', Rsq)
fclose(fout);


% all pau!   )
print -dpng angcalib
print -deps -color angcalib
close
