% santa_cut -- additional items for preparing SANTA data (after using n0_data.m)
% ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ August 2015 ~ %


x_cut_min = -100;
x_cut_max = 100;
y_cut_min = -1000;
y_cut_max = -796;
z_cut_min = 47;
z_cut_max = 53;

cut_inds = find( x_cut_min<xf & xf<x_cut_max & y_cut_min<yf & yf<y_cut_max & z_cut_min<zf & zf<z_cut_max );
x_cut = x(cut_inds); y_cut = y(cut_inds); z_cut = z(cut_inds);
mu_x_cut = mean(x_cut); mu_y_cut = mean(y_cut); mu_z_cut = mean(z_cut);
sigma_x_cut = std(x_cut); sigma_y_cut = std(y_cut); sigma_z_cut = std(z_cut);
