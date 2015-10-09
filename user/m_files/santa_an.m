ds_all = ibd_data( data );
santa_cut

pos = [1000 100 1.5*[560 420]];

figure('position', pos);
if exist('k'); else k=1; end
s(k) = scatter( ds_cut.neutron_X, ds_cut.neutron_Y, 'marker', '.' );
hold on
s0 = scatter( 0, 0, 'marker', 'o', 'markerfacecolor', 'r', 'sizedata', 100 );
set(gca, 'dataaspectratio', [1 1 1], 'xgrid', 'on', 'ygrid', 'on')
xlim([-200 200])
ylim([-200 200])
xlabel 'x (cm)'
ylabel 'y (cm)'

th = ds_cut.Theta_neutron;
ind = find( th < 0 );
th(ind) = th(ind) + 180;
th = th - 90;

thbins = -90:90;
figure;
hg( th, thbins );
xlabel '\theta (^o)'
ylabel 'Entries'

disp '[θ σ σ/√N], all events:'
disp([mean(th) std(th) std(th)/sqrt(length(th))])

disp '[θ σ σ/√N], first 100 events:'
disp([mean(th(1:100)) std(th(1:100)) std(th(1:100))/10])


