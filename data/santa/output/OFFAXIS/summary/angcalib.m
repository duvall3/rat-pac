# angcalib -- Simple script to run linear fit
#   on SANTA angle-calibration data

# read data
FILENAME = 'orig_fit.dat'
import_labeled_data

# plot points
f = figure('position', [0 0 1000 1000]);
ax = axes;
% s = scatter(MU, DEG);
s = plot(MU, DEG, 'ob');
set(s, 'markerfacecolor', 'b')
T = title('SANTA | Rough Angular Calibration');
xla = xlabel('\varphi_{Recon} (^{o})');
yla = ylabel('\varphi_{True} (^{o})');
xlim([-5 25])
ylim([-5 50])
grid on
hold on

# perform and plot fit
[P S] = polyfit(MU, DEG, 1);
XL = xlim;
X = linspace(XL(1), XL(2), 1000);
Y = polyval(P, X);
p = plot(X, Y, 'r');

# annotations
l = legend([s p], {'Data  ', 'Linear Fit  '}, 'location', 'northwest');
% fitstr = sprintf("y = %1.2f x + %1.2f  ", P(1), P(2));
% l = legend([s p], {'Data  ', fitstr}, 'location', 'northwest');


# all pau!   )
print -dpng angcalib
print -deps -color angcalib
close
