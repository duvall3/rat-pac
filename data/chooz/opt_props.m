%% load RATDB OPTICS entry (from MATERIALS_Watchman.ratdb)
name = 'OPTICS';
index = 'gd_scintillator';
valid_begin  = [0, 0];
valid_end  = [0, 0];

NEUTRON_CAPTURE_TIME_value1 = [0.0, 1.0, ];
NEUTRON_CAPTURE_TIME_value2 = [163000.0, 163000.0, ];

NEUTRON_SLOW_DIFFUSION_CONST_value1 = [0.0, 1.0, ];
NEUTRON_SLOW_DIFFUSION_CONST_value2 = [0.03, 0.03, ];

NEUTRON_FAST_DIFFUSION_RMS_value1 = [0.0, 1.0, ];
NEUTRON_FAST_DIFFUSION_RMS_value2 = [50.0, 50.0, ];

RINDEX_option = 'wavelength';
RINDEX_value1 = [200.0, 300.0, 400.0, 500.0, 600.0, 700.0, 800.0, ];
RINDEX_value2 = [1.5930, 1.4867, 1.4578, 1.4460, 1.4399, 1.4364, 1.4342, ];

SCINTILLATION_option = 'dy_dwavelength';
SCINTILLATION_value1 = [200.0, 335.0, 340.0, 345.0, 347.0, 350.0, 352.0, 354.0, 356.0, 358.0, 360.0, 363.0, 376.0, 383.0, 388.0, 396.0, 403.0, 411.0, 422.0, 438.0, 450.0, 460.0, 470.0, 480.0, 490.0, 500.0, 510.0, 800.0, ];
SCINTILLATION_value2 = [0.0, 0.0, 1.0, 12.0, 23.0, 46.0, 69.0, 92.0, 115.0, 138.0, 161.0, 178.0, 178.0, 161.0, 138.0, 115.0, 92.0, 69.0, 46.0, 23.0, 13.0, 8.0, 5.0, 3.0, 2.0, 1.0, 0.0, 0.0, ];

SCINTWAVEFORM_value1 = [-9.8, -24.0, -67.6, ];
SCINTWAVEFORM_value2 = [0.60, 0.0, 0.40, ];

SCINTWAVEFORMalpha_value1 = [-8.218, -23.41, -288.9, ];
SCINTWAVEFORMalpha_value2 = [0.5206, 0.4259, 0.5356e-1, ];

SCINTWAVEFORMneutron_value1 = [-6.862, -12.79e-2, -84.34, ];
SCINTWAVEFORMneutron_value2 = [0.7407, 0.2050, 0.5427e-1, ];

SCINTMOD_value1 = [1.0, ];
SCINTMOD_value2 = [0.152, ];

ABSLENGTH_option = 'wavelength';
ABSLENGTH_value1 = [200.0, 300.0, 350.0, 355.0, 360.0, 365.0, 370.0, 385.0, 390.0, 400.0, 470.0, 500.0, 540.0, 600.0, 650.0, 680.0, 770.0, 800.0, ];
ABSLENGTH_value2 = [0.1e-3, 0.1e-3, 27.0, 75.0, 530.0, 2.4e3, 5.3e3, 7.5e3, 10.0e3, 15.0e3, 20.0e3, 20.0e3, 40.0e3, 40.0e3, 20.0e3, 15.0e3, 10.0e3, 0.1e-3, ];

OPSCATFRAC_option = 'wavelength';
OPSCATFRAC_value1 = [200.0, 300.0, 350.0, 360.0, 400.0, 450.0, 500.0, 600.0, 700.0, 770.0, 800.0, ];
OPSCATFRAC_value2 = [0.0, 0.0, 0.0, 0.44, 0.28, 0.17, 0.10, 0.0625, 0.0337, 0.020, 0.0, ];

REEMISSION_PROB_option = 'wavelength';
REEMISSION_PROB_value1 = [200.0, 300.0, 350.0, 365.0, 370.0, 375.0, 380.0, 385.0, 390.0, 395.0, 400.0, 405.0, 410.0, 415.0, 420.0, 425.0, 430.0, 435.0, 440.0, 445.0, 450.0, 500.0, 600.0, 700.0, 800.0, ];
REEMISSION_PROB_value2 = [1.0, 1.0, 0.9996, 0.9704, 0.8722, 0.6353, 0.4165, 0.3004, 0.2354, 0.2203, 0.1969, 0.1936, 0.1712, 0.1417, 0.1409, 0.1344, 0.1372, 0.1160, 0.1215, 0.1259, 0.1141, 0.0587, 0.0000, 0.0, 0.0, ];
PROPERTY_LIST = ['NEUTRON_CAPTURE_TIME', 'NEUTRON_SLOW_DIFFUSION_CONST', 'NEUTRON_FAST_DIFFUSION_RMS', 'RINDEX', 'SCINTILLATION', 'SCINTWAVEFORM', 'SCINTWAVEFORMalpha', 'SCINTWAVEFORMneutron', 'SCINTMOD', 'ABSLENGTH', 'OPSCATFRAC', 'REEMISSION_PROB', ];


%% make plots

pos = [100 100 840 630];

% neutron capture time
f_NEUTRON_CAPTURE_TIME = figure('position', pos);
ax_NEUTRON_CAPTURE_TIME = axes;
p_NEUTRON_CAPTURE_TIME = plot( NEUTRON_CAPTURE_TIME_value1, NEUTRON_CAPTURE_TIME_value2, 'marker', '^' );
xlim([-0.2 1.2])
ylim([150000 175000])
xl_NEUTRON_CAPTURE_TIME = xlabel('NEUTRON_CAPTURE_TIME_value1 (?)');
yl_NEUTRON_CAPTURE_TIME = ylabel('NEUTRON_CAPTURE_TIME_value2 (ns?)');
T_NEUTRON_CAPTURE_TIME = title('Material "gd_scintillator": Neutron Capture Time');

% neutron slow diffusion const
f_NEUTRON_SLOW_DIFFUSION_CONST = figure('position', pos);
ax_NEUTRON_SLOW_DIFFUSION_CONST = axes;
p_NEUTRON_SLOW_DIFFUSION_CONST = plot( NEUTRON_SLOW_DIFFUSION_CONST_value1, NEUTRON_SLOW_DIFFUSION_CONST_value2, 'marker', '^' );
xlim([-0.2 1.2])
ylim([0.00, 0.05])
xl_NEUTRON_SLOW_DIFFUSION_CONST = xlabel('NEUTRON_SLOW_DIFFUSION_CONST_value1 (?)');
yl_NEUTRON_SLOW_DIFFUSION_CONST = ylabel('NEUTRON_SLOW_DIFFUSION_CONST_value2 (?)');
T_NEUTRON_SLOW_DIFFUSION_CONST = title('Material "gd_scintillator": Neutron Slow Diffusion Const');

% neutron fast diffusion rms
f_NEUTRON_FAST_DIFFUSION_RMS = figure('position', pos);
ax_NEUTRON_FAST_DIFFUSION_RMS = axes;
p_NEUTRON_FAST_DIFFUSION_RMS = plot( NEUTRON_FAST_DIFFUSION_RMS_value1, NEUTRON_FAST_DIFFUSION_RMS_value2 );
xlim([0 1])
ylim(0 100])
xl_NEUTRON_FAST_DIFFUSION_RMS = xlabel('NEUTRON_FAST_DIFFUSION_RMS_value1 (?)', 'interpreter', 'none');
ylNEUTRON_FAST_DIFFUSION_RMS = ylabel('NEUTRON_FAST_DIFFUSION_RMS_value2 (?)', 'interpreter', 'none');
T_NEUTRON_FAST_DIFFUSION_RMS = title('NEUTRON_FAST_DIFFUSION_RMS', 'interpreter', 'none');

% refractive index
f_RINDEX = figure('position', pos);
ax_RINDEX = axes;
p_RINDEX = plot( RINDEX_value1, RINDEX_value2 );
xlim([0 1000])
ylim([0 2])
xl_RINDEX = xlabel('Wavelength (nm)');
yl_RINDEX = ylabel('Refractive Index');
T_RINDEX = title('RINDEX');

% 