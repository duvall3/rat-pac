% ibd_signal -- simple script to draw a typical IBD detector signal
% Mark J. Duvall ~ mjduvall@hawaii.edu ~ October 2015 ~ %


%% create signals
t = -5:.005:20; % -5 to 20 us in 1-ns increments
%t_noise = [-5:.005:-1.2 1.2:.005:12.5 17.5:.005:20];
t_zero = [-5:.005:-3 3:.005:12 18:.005:20];
t_prompt = -3:.005:3;
t_delayed = 12:.005:18;
s_zero = zeros( size(t_zero) ) + 1;
% prompt signal at DeltaT = 0 us, width 1 us
s_prompt = gauss( t_prompt, 0, 1, 5*10^2 );
%s_prompt = gauss( t, 0, 1, 4*10^2 );
% delayed signal at DeltaT = 15 us, width 1 us
s_delayed = gauss( t_delayed, 15, 1, 7*10^2 );
%s_delayed = gauss( t, 15, 1, 10^3 );
%% noise for signals
%n_noise = 20 * randn( size(t_noise) );
%n_prompt= 20 * randn( size(t_prompt) );
%n_delayed = 20 * randn( size(t_delayed) );


%% draw
% figure
f_sig = figure;
if exist('pos'); set(f_sig, 'position', pos); end%if
ax_sig = axes;

% plots
%p_noise = plot( t_noise, n_noise, 'color', 'k', 'linewidth', 2 );
p_zero= plot( t_zero, s_zero, 'color', 'k', 'linewidth', 3 );
hold on
%p_prompt = plot( t_prompt, s_prompt+n_prompt, 'color', 'k', 'linewidth', 1 );
p_prompt = plot( t_prompt, s_prompt, 'color', 'r', 'linewidth', 3 );
%p_delayed = plot( t_delayed, s_delayed+n_delayed, 'color', 'k', 'linewidth', 1 );
p_delayed = plot( t_delayed, s_delayed, 'color', 'c', 'linewidth', 3 );
ylim([0 350])

% title & labels
TS_signal = 'Typical Detector IBD Signal';
T_signal = title( TS_signal, 'fontsize', 26 );
xlabel('Time', 'fontsize', 20)
ylabel('Signal', 'fontsize', 20)
set(ax_sig, 'xgrid', 'off', 'ygrid', 'off')
set(ax_sig, 'yticklabel', {})
set(ax_sig, 'xticklabel', {})
%set(ax_sig, 'xtick', [], 'ytick', [])

% annotations
l_sig(1) = line( [0 0], [0 500], 'color', 'k', 'linestyle', '--', 'linewidth', 2 );
l_sig(2) = line( [15 15], [0 500], 'color', 'k', 'linestyle', '--', 'linewidth', 2 );
ts_dt = 'characteristic \Deltat';
%t_dt = text( 4, 450, ts_dt, 'fontsize', 20 );

