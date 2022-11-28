close all; clear all; clc

%% Load Data


[~, ~, raw] = xlsread('XXX\Llandegfedd_18_Aug_2022','raw','B1:D58843');

raw(cellfun(@(x) ~isempty(x) && isnumeric(x) && isnan(x),raw)) = {''};
R = cellfun(@(x) ~isnumeric(x) && ~islogical(x),raw); % Find non-numeric cells
raw(R) = {NaN}; % Replace non-numeric cells
data = reshape([raw{:}],size(raw));
temperature = data(:,1);
analoge_dig = data(:,2);
pressure = data(:,3);
clearvars data raw R;

% change pressure to depth
density_water =1007; %(kg/m^3)
atmospheric_presure = nanmean(pressure(1:100)); % take first 100 pressure readings
g = 9.81; %(m/s^2)
depth = -(pressure - atmospheric_presure)*100/(density_water*g);

% clean data of annomolies

depth_min = 5; % above water
depth_max = -22;% below lake depth
n = 0;

for n = 1:length(depth)
    if depth(n) > depth_min || depth(n) < depth_max  
        depth(n) = -999;
        temperature(n) = -999;
        
        n=n+1;
    end
end
%
% remove zeros (or placeholders eg -999) 
depth = depth(depth ~= -999);
temperature = temperature(temperature ~= -999);
%

% Filters - NOT USED
windowSize = 1; 
b = (1/windowSize)*ones(1,windowSize);
a = 1;

med_size = 1;
temperature1 = medfilt1(filter(b,a,temperature),med_size);
depth1 = medfilt1(filter(b,a,depth),med_size);

%% For x0 t0
%start and end of each evolution (zeros are a lazy way of not correcting a
%the a and b indexes)
a =[565, 990, 1711, 2535, 3088,5677, 6243, 0, 0, 7410, 8293, 9311, 10110, 11170, 12120, 13450, 14320, 15860, 16790]; % start
c=[795, 1160, 1867, 2692, 3224, 5965, 6370]; % mid/deepest 
% c=[795, 1181, 1910, 2726, 3249, 5983, 6394]; % mid/coldest
b=[796,1272, 2001, 2813, 3345, 6216, 6503, 0, 0, 8014, 9019, 9784, 10860, 11770, 13030, 14020, 15450, 16400, 17770]; % end

a =[565, 990, 1711, 2535, 3088,5677, 6243, 0, 0, 7306, 8123, 9236, 10010, 11110, 11930, 13420, 14260, 15680, 16740]; % start - wide interp
b=[796,1272, 2001, 2813, 3345, 6216, 6503, 0, 0, 8014, 9068, 9818, 10920, 11800, 13160, 14060, 15470, 16460, 17860]; % end - wide interp


% cast data - down casts only
temp_man_1_x0_t0_down = temperature(a(1):c(1))';
depth_man_1_x0_t0_down = depth(a(1):c(1))';
temp_man_2_x0_t0_down = temperature(a(2):c(2))';
depth_man_2_x0_t0_down = depth(a(2):c(2))';
temp_man_3_x0_t0_down = temperature(a(3):c(3))';
depth_man_3_x0_t0_down = depth(a(3):c(3))';
temp_man_4_x0_t0_down = temperature(a(4):c(4))';
depth_man_4_x0_t0_down = depth(a(4):c(4))';
temp_man_5_x0_t0_down = temperature(a(5):c(5))';
depth_man_5_x0_t0_down = depth(a(5):c(5))';

% up cast data
temp_man_1_x0_t0_up = temperature(c(1):b(1))';
depth_man_1_x0_t0_up = depth(c(1):b(1))';
temp_man_2_x0_t0_up = temperature(c(2):b(2))';
depth_man_2_x0_t0_up = depth(c(2):b(2))';
temp_man_3_x0_t0_up = temperature(c(3):b(3))';
depth_man_3_x0_t0_up = depth(c(3):b(3))';
temp_man_4_x0_t0_up = temperature(c(4):b(4))';
depth_man_4_x0_t0_up = depth(c(4):b(4))';
temp_man_5_x0_t0_up = temperature(c(5):b(5))';
depth_man_5_x0_t0_up = depth(c(5):b(5))';


% up and down cast sample
temp_man_1_x0_t0_down_up = temperature(a(1):b(1))';
depth_man_1_x0_t0_down_up = depth(a(1):b(1))';
temp_man_2_x0_t0_down_up = temperature(a(2):b(2))';
depth_man_2_x0_t0_down_up = depth(a(2):b(2))';
temp_man_3_x0_t0_down_up = temperature(a(3):b(3))';
depth_man_3_x0_t0_down_up = depth(a(3):b(3))';
temp_man_4_x0_t0_down_up = temperature(a(4):b(4))';
depth_man_4_x0_t0_down_up = depth(a(4):b(4))';
temp_man_5_x0_t0_down_up = temperature(a(5):b(5))';
depth_man_5_x0_t0_down_up = depth(a(5):b(5))';

% % % % save('uppy_downy.mat')%,'temp_man_1_x0_t0_down_up', 'depth_man_1_x0_t0_down_up', 'temp_man_2_x0_t0_down_up', 'depth_man_2_x0_t0_down_up', 'temp_man_3_x0_t0_down_up', 'depth_man_3_x0_t0_down_up');

% glider data - down and up casts
temp_glide_1_down_x0_t0 = temperature(a(6):c(6))';
depth_glide_1_down_x0_t0 = depth(a(6):c(6))';
temp_glide_1_up_x0_t0 = temperature(c(6):b(6))';
depth_glide_1_up_x0_t0 = depth(c(6):b(6))';
temp_glide_2_down_x0_t0 = temperature(a(7):c(7))';
depth_glide_2_down_x0_t0 = depth(a(7):c(7))';
temp_glide_2_up_x0_t0 = temperature(c(7):b(7))';
depth_glide_2_up_x0_t0 = depth(c(7):b(7))';

% glider data - by yo-yos
temp_glide_yo_1_x0_t0 = temperature(a(6):b(6))';
depth_glide_yo_1_x0_t0 = depth(a(6):b(6))';
temp_glide_yo_2_x0_t0 = temperature(a(7):b(7))';
depth_glide_yo_2_x0_t0 = depth(a(7):b(7))';



% AUV racetrack data 
% fliplr is to acount for one run N-S then the next S-N means get
% consistant physical start and end positions
temp_auv_1_x0_t0 = temperature(a(10):b(10))';
depth_auv_1_x0_t0 = depth(a(10):b(10))';
temp_auv_2_x0_t0 = fliplr(temperature(a(11):b(11))');
depth_auv_2_x0_t0 = fliplr(depth(a(11):b(11))');
temp_auv_3_x0_t0 = temperature(a(12):b(12))';
depth_auv_3_x0_t0 = depth(a(12):b(12))';
temp_auv_4_x0_t0 = fliplr(temperature(a(13):b(13))');
depth_auv_4_x0_t0 = fliplr(depth(a(13):b(13))');
temp_auv_5_x0_t0 = temperature(a(14):b(14))';
depth_auv_5_x0_t0 = depth(a(14):b(14))';
temp_auv_6_x0_t0 = fliplr(temperature(a(15):b(15))');
depth_auv_6_x0_t0 = fliplr(depth(a(15):b(15))');
temp_auv_7_x0_t0 = temperature(a(16):b(16))';
depth_auv_7_x0_t0 = depth(a(16):b(16))';

temp_auv_8_x0_t0 = fliplr(temperature(a(17):b(17))');
depth_auv_8_x0_t0 = fliplr(depth(a(17):b(17))');
temp_auv_9_x0_t0 = temperature(a(18):b(18))';
depth_auv_9_x0_t0 = depth(a(18):b(18))';
temp_auv_10_x0_t0 = fliplr(temperature(a(19):b(19))');
depth_auv_10_x0_t0 = fliplr(depth(a(19):b(19))');

%%
% auv_x0_t0 =[min(temp_auv_1_x0_t0) mean(temp_auv_1_x0_t0) max(temp_auv_1_x0_t0) mean(depth_auv_1_x0_t0); min(temp_auv_2_x0_t0) mean(temp_auv_2_x0_t0) max(temp_auv_2_x0_t0) mean(depth_auv_2_x0_t0); min(temp_auv_3_x0_t0) mean(temp_auv_3_x0_t0) max(temp_auv_3_x0_t0) mean(depth_auv_3_x0_t0); min(temp_auv_4_x0_t0) mean(temp_auv_4_x0_t0) max(temp_auv_4_x0_t0) mean(depth_auv_4_x0_t0); min(temp_auv_5_x0_t0) mean(temp_auv_5_x0_t0) max(temp_auv_5_x0_t0) mean(depth_auv_5_x0_t0); min(temp_auv_6_x0_t0) mean(temp_auv_6_x0_t0) max(temp_auv_6_x0_t0) mean(depth_auv_6_x0_t0); min(temp_auv_7_x0_t0) mean(temp_auv_7_x0_t0) max(temp_auv_7_x0_t0) mean(depth_auv_7_x0_t0)];
% plot(auv_x0_t0(:,1), auv_x0_t0(:,4),auv_x0_t0(:,2), auv_x0_t0(:,4),auv_x0_t0(:,3), auv_x0_t0(:,4))

%%
% auv_x0_t0 =[min(temp_auv_1_x0_t0) mean(temp_auv_1_x0_t0) max(temp_auv_1_x0_t0) mean(depth_auv_1_x0_t0); min(temp_auv_2_x0_t0) mean(temp_auv_2_x0_t0) max(temp_auv_2_x0_t0) mean(depth_auv_2_x0_t0); min(temp_auv_3_x0_t0) mean(temp_auv_3_x0_t0) max(temp_auv_3_x0_t0) mean(depth_auv_3_x0_t0); min(temp_auv_4_x0_t0) mean(temp_auv_4_x0_t0) max(temp_auv_4_x0_t0) mean(depth_auv_4_x0_t0); min(temp_auv_5_x0_t0) mean(temp_auv_5_x0_t0) max(temp_auv_5_x0_t0) mean(depth_auv_5_x0_t0); min(temp_auv_6_x0_t0) mean(temp_auv_6_x0_t0) max(temp_auv_6_x0_t0) mean(depth_auv_6_x0_t0); min(temp_auv_7_x0_t0) mean(temp_auv_7_x0_t0) max(temp_auv_7_x0_t0) mean(depth_auv_7_x0_t0); min(temp_auv_8_x0_t0) mean(temp_auv_8_x0_t0) max(temp_auv_8_x0_t0) mean(depth_auv_8_x0_t0); min(temp_auv_9_x0_t0) mean(temp_auv_9_x0_t0) max(temp_auv_9_x0_t0) mean(depth_auv_9_x0_t0); min(temp_auv_10_x0_t0) mean(temp_auv_10_x0_t0) max(temp_auv_10_x0_t0) mean(depth_auv_10_x0_t0)];

auv_x0_t0 =[min(temp_auv_1_x0_t0) mean(temp_auv_1_x0_t0) max(temp_auv_1_x0_t0) mean(depth_auv_1_x0_t0) min(depth_auv_1_x0_t0) max(depth_auv_1_x0_t0); min(temp_auv_2_x0_t0) mean(temp_auv_2_x0_t0) max(temp_auv_2_x0_t0) mean(depth_auv_2_x0_t0) min(depth_auv_2_x0_t0) max(depth_auv_2_x0_t0); min(temp_auv_3_x0_t0) mean(temp_auv_3_x0_t0) max(temp_auv_3_x0_t0) mean(depth_auv_3_x0_t0) min(depth_auv_3_x0_t0) max(depth_auv_3_x0_t0); min(temp_auv_4_x0_t0) mean(temp_auv_4_x0_t0) max(temp_auv_4_x0_t0) mean(depth_auv_4_x0_t0) min(depth_auv_4_x0_t0) max(depth_auv_4_x0_t0); min(temp_auv_5_x0_t0) mean(temp_auv_5_x0_t0) max(temp_auv_5_x0_t0) mean(depth_auv_5_x0_t0) min(depth_auv_5_x0_t0) max(depth_auv_5_x0_t0); min(temp_auv_6_x0_t0) mean(temp_auv_6_x0_t0) max(temp_auv_6_x0_t0) mean(depth_auv_6_x0_t0) min(depth_auv_6_x0_t0) max(depth_auv_6_x0_t0); min(temp_auv_7_x0_t0) mean(temp_auv_7_x0_t0) max(temp_auv_7_x0_t0) mean(depth_auv_7_x0_t0) min(depth_auv_7_x0_t0) max(depth_auv_7_x0_t0); min(temp_auv_8_x0_t0) mean(temp_auv_8_x0_t0) max(temp_auv_8_x0_t0) mean(depth_auv_8_x0_t0) min(depth_auv_8_x0_t0) max(depth_auv_8_x0_t0); min(temp_auv_9_x0_t0) mean(temp_auv_9_x0_t0) max(temp_auv_9_x0_t0) mean(depth_auv_9_x0_t0) min(depth_auv_9_x0_t0) max(depth_auv_9_x0_t0); min(temp_auv_10_x0_t0) mean(temp_auv_10_x0_t0) max(temp_auv_10_x0_t0) mean(depth_auv_10_x0_t0) min(depth_auv_10_x0_t0) max(depth_auv_10_x0_t0)];


% figure(2)
% 
% plot(auv_x0_t0(:,2), auv_x0_t0(:,4),'-xg')
% % plot(auv_x0_t0(:,1), auv_x0_t0(:,4),'xg',auv_x0_t0(:,3), auv_x0_t0(:,4),'xg',auv_x0_t0(:,2), auv_x0_t0(:,5),'xg',auv_x0_t0(:,2), auv_x0_t0(:,6),'xg')
% 
% 
% set(gca, 'Layer', 'top')% ensures that axis drawn on top of patches
% hold on
% 
% %patch([auv_x0_t0(:,3)' fliplr(auv_x0_t0(:,1)')], [auv_x0_t0(:,5)' fliplr(auv_x0_t0(:,6)')], 'g','FaceAlpha',0.1,'EdgeAlpha',0.3,'EdgeColor','g','LineStyle',':')
% 
% plot(temp_man_1_x0_t0_down, depth_man_1_x0_t0_down,'r')%,temp_man_1_x0_t0_up, depth_man_1_x0_t0_up,':r')% something went wrong on up cast and no data recorded
% 
% plot(temp_man_1_x0_t0_down, depth_man_1_x0_t0_down,':r')
% plot(temp_glide_1_down_x0_t0, depth_glide_1_down_x0_t0,'b')
% plot(temp_glide_1_up_x0_t0, depth_glide_1_up_x0_t0,':b')
% 
% plot(temp_man_2_x0_t0_down, depth_man_2_x0_t0_down,'r',temp_man_2_x0_t0_up, depth_man_2_x0_t0_up,':r')
% plot(temp_man_3_x0_t0_down, depth_man_3_x0_t0_down,'r',temp_man_3_x0_t0_up, depth_man_3_x0_t0_up,':r')
% plot(temp_man_4_x0_t0_down, depth_man_4_x0_t0_down,'r',temp_man_4_x0_t0_up, depth_man_4_x0_t0_up,':r')
% plot(temp_man_5_x0_t0_down, depth_man_5_x0_t0_down,'r',temp_man_5_x0_t0_up, depth_man_5_x0_t0_up,':r')
% plot(temp_glide_2_down_x0_t0, depth_glide_2_down_x0_t0,'b',temp_glide_2_up_x0_t0, depth_glide_2_up_x0_t0,':b')
% hold off
% xlim([14 23])
% ylim([-21 0])
% title('Raw Temperature/Depth data of (100m) transit x0 t0 (consisting 5 manual casts, 2 glider yo-yos and a set of auv racetracks')
% legend('Mean AUV Temperature (Deg C)','AUV Temperature Range (Deg C)','Manual downcast Temperature (Deg C)','Manual upcast Temperature (Deg C)','Glider downward yo Temperature (Deg C)','Glider upward yo Temperature (Deg C)','Location','Best')
% 
% 
% xlabel('Water Temperature (Deg C)')
% ylabel ('Lake Depth (m)')


%% For x1 t0
%start and end of each evolution 
d =[20230, 20720, 21230, 22060, 23050, 25050, 25770, 28250, 29120, 30340, 30880, 32520, 33120, 34590, 35740, 37890]; % start
f=[20380, 20900, 21420, 22240, 23170, 25380, 26130]; % mid/deepest
% f=[20400, 20930, 21430, 22270, 23240, 25430, 26150]; % mid/COLDEST


e =[20490, 21020, 21550, 22360, 23330, 25700, 26480, 28700, 30060, 30690, 32220, 32860, 34290, 35010, 36650, 38890]; % end


% cast data - down casts only
temp_man_1_x1_t0_down = temperature(d(1):f(1))';
depth_man_1_x1_t0_down = depth(d(1):f(1))';
temp_man_2_x1_t0_down = temperature(d(2):f(2))';
depth_man_2_x1_t0_down = depth(d(2):f(2))';
temp_man_3_x1_t0_down = temperature(d(3):f(3))';
depth_man_3_x1_t0_down = depth(d(3):f(3))';
temp_man_4_x1_t0_down = temperature(d(4):f(4))';
depth_man_4_x1_t0_down = depth(d(4):f(4))';
temp_man_5_x1_t0_down = temperature(d(5):f(5))';
depth_man_5_x1_t0_down = depth(d(5):f(5))';

% up cast data
temp_man_1_x1_t0_up = temperature(f(1):e(1))';
depth_man_1_x1_t0_up = depth(f(1):e(1))';
temp_man_2_x1_t0_up = temperature(f(2):e(2))';
depth_man_2_x1_t0_up = depth(f(2):e(2))';
temp_man_3_x1_t0_up = temperature(f(3):e(3))';
depth_man_3_x1_t0_up = depth(f(3):e(3))';
temp_man_4_x1_t0_up = temperature(f(4):e(4))';
depth_man_4_x1_t0_up = depth(f(4):e(4))';
temp_man_5_x1_t0_up = temperature(f(5):e(5))';
depth_man_5_x1_t0_up = depth(f(5):e(5))';


% up and down cast sample
temp_man_1_x1_t0_down_up = temperature(d(1):e(1))';
depth_man_1_x1_t0_down_up = depth(d(1):e(1))';
temp_man_2_x1_t0_down_up = temperature(d(2):e(2))';
depth_man_2_x1_t0_down_up = depth(d(2):e(2))';
temp_man_3_x1_t0_down_up = temperature(d(3):e(3))';
depth_man_3_x1_t0_down_up = depth(d(3):e(3))';
temp_man_4_x1_t0_down_up = temperature(d(4):e(4))';
depth_man_4_x1_t0_down_up = depth(d(4):e(4))';
temp_man_5_x1_t0_down_up = temperature(d(5):e(5))';
depth_man_5_x1_t0_down_up = depth(d(5):e(5))';

% % % % save('uppy_downy.mat')%,'temp_man_1_x1_t0_down_up', 'depth_man_1_x1_t0_down_up', 'temp_man_2_x1_t0_down_up', 'depth_man_2_x1_t0_down_up', 'temp_man_3_x1_t0_down_up', 'depth_man_3_x1_t0_down_up');

% glider data - down and up casts
temp_glide_1_down_x1_t0 = temperature(d(6):f(6))';
depth_glide_1_down_x1_t0 = depth(d(6):f(6))';
temp_glide_1_up_x1_t0 = temperature(f(6):e(6))';
depth_glide_1_up_x1_t0 = depth(f(6):e(6))';
temp_glide_2_down_x1_t0 = temperature(d(7):f(7))';
depth_glide_2_down_x1_t0 = depth(d(7):f(7))';
temp_glide_2_up_x1_t0 = temperature(f(7):e(7))';
depth_glide_2_up_x1_t0 = depth(f(7):e(7))';

% glider data - by yo-yos
temp_glide_yo_1_x1_t0 = temperature(d(6):e(6))';
depth_glide_yo_1_x1_t0 = depth(d(6):e(6))';
temp_glide_yo_2_x1_t0 = temperature(d(7):e(7))';
depth_glide_yo_2_x1_t0 = depth(d(7):e(7))';



% AUV racetrack data 
% fliplr is to acount for one run N-S then the next S-N means get
% consistant physical start and end positions
temp_auv_1_x1_t0 = temperature(d(8):e(8))';
depth_auv_1_x1_t0 = depth(d(8):e(8))';
temp_auv_2_x1_t0 = fliplr(temperature(d(9):e(9))');
depth_auv_2_x1_t0 = fliplr(depth(d(9):e(9))');
temp_auv_3_x1_t0 = temperature(d(10):e(10))';
depth_auv_3_x1_t0 = depth(d(10):e(10))';
temp_auv_4_x1_t0 = fliplr(temperature(d(11):e(11))');
depth_auv_4_x1_t0 = fliplr(depth(d(11):e(11))');
temp_auv_5_x1_t0 = temperature(d(12):e(12))';
depth_auv_5_x1_t0 = depth(d(12):e(12))';
temp_auv_6_x1_t0 = fliplr(temperature(d(13):e(13))');
depth_auv_6_x1_t0 = fliplr(depth(d(13):e(13))');
temp_auv_7_x1_t0 = temperature(d(14):e(14))';
depth_auv_7_x1_t0 = depth(d(14):e(14))';
temp_auv_8_x1_t0 = fliplr(temperature(d(15):e(15))');
depth_auv_8_x1_t0 = fliplr(depth(d(15):e(15))');
temp_auv_9_x1_t0 = temperature(d(16):e(16))';
depth_auv_9_x1_t0 = depth(d(16):e(16))';
% temp_auv_10_x1_t0 = fliplr(temperature(d(17):e(17))');
% depth_auv_10_x1_t0 = fliplr(depth(d(17):e(19))');



temp_auv_all_x1_t0 = horzcat(temp_auv_1_x1_t0, temp_auv_2_x1_t0, temp_auv_3_x1_t0, temp_auv_4_x1_t0, temp_auv_5_x1_t0, temp_auv_6_x1_t0, temp_auv_7_x1_t0, temp_auv_8_x1_t0, temp_auv_9_x1_t0);
depth_auv_all_x1_t0 = horzcat(depth_auv_1_x1_t0, depth_auv_2_x1_t0, depth_auv_3_x1_t0, depth_auv_4_x1_t0, depth_auv_5_x1_t0, depth_auv_6_x1_t0, depth_auv_7_x1_t0, depth_auv_8_x1_t0, depth_auv_9_x1_t0);
%
% auv_x1_t0 =[min(temp_auv_1_x1_t0) mean(temp_auv_1_x1_t0) max(temp_auv_1_x1_t0) mean(depth_auv_1_x1_t0); min(temp_auv_2_x1_t0) mean(temp_auv_2_x1_t0) max(temp_auv_2_x1_t0) mean(depth_auv_2_x1_t0); min(temp_auv_3_x1_t0) mean(temp_auv_3_x1_t0) max(temp_auv_3_x1_t0) mean(depth_auv_3_x1_t0); min(temp_auv_4_x1_t0) mean(temp_auv_4_x1_t0) max(temp_auv_4_x1_t0) mean(depth_auv_4_x1_t0); min(temp_auv_5_x1_t0) mean(temp_auv_5_x1_t0) max(temp_auv_5_x1_t0) mean(depth_auv_5_x1_t0); min(temp_auv_6_x1_t0) mean(temp_auv_6_x1_t0) max(temp_auv_6_x1_t0) mean(depth_auv_6_x1_t0); min(temp_auv_7_x1_t0) mean(temp_auv_7_x1_t0) max(temp_auv_7_x1_t0) mean(depth_auv_7_x1_t0)];
% plot(auv_x1_t0(:,1), auv_x1_t0(:,4),auv_x1_t0(:,2), auv_x1_t0(:,4),auv_x1_t0(:,3), auv_x1_t0(:,4))

%
%auv_x1_t0 =[min(temp_auv_1_x1_t0) mean(temp_auv_1_x1_t0) max(temp_auv_1_x1_t0) mean(depth_auv_1_x1_t0); min(temp_auv_2_x1_t0) mean(temp_auv_2_x1_t0) max(temp_auv_2_x1_t0) mean(depth_auv_2_x1_t0); min(temp_auv_3_x1_t0) mean(temp_auv_3_x1_t0) max(temp_auv_3_x1_t0) mean(depth_auv_3_x1_t0); min(temp_auv_4_x1_t0) mean(temp_auv_4_x1_t0) max(temp_auv_4_x1_t0) mean(depth_auv_4_x1_t0); min(temp_auv_5_x1_t0) mean(temp_auv_5_x1_t0) max(temp_auv_5_x1_t0) mean(depth_auv_5_x1_t0); min(temp_auv_6_x1_t0) mean(temp_auv_6_x1_t0) max(temp_auv_6_x1_t0) mean(depth_auv_6_x1_t0); min(temp_auv_7_x1_t0) mean(temp_auv_7_x1_t0) max(temp_auv_7_x1_t0) mean(depth_auv_7_x1_t0); min(temp_auv_8_x1_t0) mean(temp_auv_8_x1_t0) max(temp_auv_8_x1_t0) mean(depth_auv_8_x1_t0); min(temp_auv_9_x1_t0) mean(temp_auv_9_x1_t0) max(temp_auv_9_x1_t0) mean(depth_auv_9_x1_t0)];

auv_x1_t0 =[min(temp_auv_1_x1_t0) mean(temp_auv_1_x1_t0) max(temp_auv_1_x1_t0) mean(depth_auv_1_x1_t0) min(depth_auv_1_x1_t0) max(depth_auv_1_x1_t0); min(temp_auv_2_x1_t0) mean(temp_auv_2_x1_t0) max(temp_auv_2_x1_t0) mean(depth_auv_2_x1_t0) min(depth_auv_2_x1_t0) max(depth_auv_2_x1_t0); min(temp_auv_3_x1_t0) mean(temp_auv_3_x1_t0) max(temp_auv_3_x1_t0) mean(depth_auv_3_x1_t0) min(depth_auv_3_x1_t0) max(depth_auv_3_x1_t0); min(temp_auv_4_x1_t0) mean(temp_auv_4_x1_t0) max(temp_auv_4_x1_t0) mean(depth_auv_4_x1_t0) min(depth_auv_4_x1_t0) max(depth_auv_4_x1_t0); min(temp_auv_5_x1_t0) mean(temp_auv_5_x1_t0) max(temp_auv_5_x1_t0) mean(depth_auv_5_x1_t0) min(depth_auv_5_x1_t0) max(depth_auv_5_x1_t0); min(temp_auv_6_x1_t0) mean(temp_auv_6_x1_t0) max(temp_auv_6_x1_t0) mean(depth_auv_6_x1_t0) min(depth_auv_6_x1_t0) max(depth_auv_6_x1_t0); min(temp_auv_7_x1_t0) mean(temp_auv_7_x1_t0) max(temp_auv_7_x1_t0) mean(depth_auv_7_x1_t0) min(depth_auv_7_x1_t0) max(depth_auv_7_x1_t0); min(temp_auv_8_x1_t0) mean(temp_auv_8_x1_t0) max(temp_auv_8_x1_t0) mean(depth_auv_8_x1_t0) min(depth_auv_8_x1_t0) max(depth_auv_8_x1_t0); min(temp_auv_9_x1_t0) mean(temp_auv_9_x1_t0) max(temp_auv_9_x1_t0) mean(depth_auv_9_x1_t0) min(depth_auv_9_x1_t0) max(depth_auv_9_x1_t0)];



%%
% figure(3)
% 
% plot(auv_x1_t0(:,2), auv_x1_t0(:,4),'-xg')
% 
% 
% set(gca, 'Layer', 'top')% ensures that axis drawn on top of patches
% hold on
% 
% %patch([auv_x1_t0(:,3)' fliplr(auv_x1_t0(:,1)')], [auv_x1_t0(:,4)' fliplr(auv_x1_t0(:,4)')], 'g','FaceAlpha',0.1,'EdgeAlpha',0.3,'EdgeColor','g','LineStyle',':')
% 
% patch([auv_x1_t0(:,3)' fliplr(auv_x1_t0(:,1)')], [auv_x1_t0(:,5)' fliplr(auv_x1_t0(:,6)')], 'g','FaceAlpha',0.1,'EdgeAlpha',0.3,'EdgeColor','g','LineStyle',':')
% 
% plot(temp_man_1_x1_t0_down, depth_man_1_x1_t0_down,'r',temp_man_1_x1_t0_up, depth_man_1_x1_t0_up,':r')
% plot(temp_glide_1_down_x1_t0, depth_glide_1_down_x1_t0,'b',temp_glide_1_up_x1_t0, depth_glide_1_up_x1_t0,':b')
% 
% plot(temp_man_2_x1_t0_down, depth_man_2_x1_t0_down,'r',temp_man_2_x1_t0_up, depth_man_2_x1_t0_up,':r')
% plot(temp_man_3_x1_t0_down, depth_man_3_x1_t0_down,'r',temp_man_3_x1_t0_up, depth_man_3_x1_t0_up,':r')
% plot(temp_man_4_x1_t0_down, depth_man_4_x1_t0_down,'r',temp_man_4_x1_t0_up, depth_man_4_x1_t0_up,':r')
% plot(temp_man_5_x1_t0_down, depth_man_5_x1_t0_down,'r',temp_man_5_x1_t0_up, depth_man_5_x1_t0_up,':r')
% plot(temp_glide_2_down_x1_t0, depth_glide_2_down_x1_t0,'b',temp_glide_2_up_x1_t0, depth_glide_2_up_x1_t0,':b')
% hold off
% xlim([14 23])
% ylim([-21 0])
% title('Raw Temperature/Depth data of (100m) transit x1 t0 (consisting 5 manual casts, 2 glider yo-yos and a set of auv racetracks')
% legend('Mean AUV Temperature (Deg C)','AUV Temperature Range (Deg C)','Manual downcast Temperature (Deg C)','Manual upcast Temperature (Deg C)','Glider downward yo Temperature (Deg C)','Glider upward yo Temperature (Deg C)','Location','Best')
% 
% 
% xlabel('Water Temperature (Deg C)')
% ylabel ('Lake Depth (m)')




%% For x0 t3
%start and end of each evolution 
g =[41740, 42270, 43020, 43520, 44290, 46040, 46830, 48560, 49430, 50450, 51200, 52170,53070, 54100, 54980, 56370, 57360]; % start
i=[41930, 42470, 43200, 43720, 44460, 46410, 47090]; % mid/deepest
% i=[41950, 42500, 43230, 43740, 44480, 46420, 47100]; % mid/COLDEST

h =[42070, 42600, 43320, 43850, 44590, 46740, 47390, 49220, 50140, 50920, 51870, 52670, 53830, 54680, 55720, 56770, 57880]; % end

% NOTE THERE ARE 6 MANUAL CASTS BUT ONLY 5 ARE USED - CHECK GPS LOCATION OF
% EACH TO ENSURE CORRECT ONES USED.

% cast data - down casts only
temp_man_1_x0_t3_down = temperature(g(1):i(1))';
depth_man_1_x0_t3_down = depth(g(1):i(1))';
temp_man_2_x0_t3_down = temperature(g(2):i(2))';
depth_man_2_x0_t3_down = depth(g(2):i(2))';
temp_man_3_x0_t3_down = temperature(g(3):i(3))';
depth_man_3_x0_t3_down = depth(g(3):i(3))';
temp_man_4_x0_t3_down = temperature(g(4):i(4))';
depth_man_4_x0_t3_down = depth(g(4):i(4))';
temp_man_5_x0_t3_down = temperature(g(5):i(5))';
depth_man_5_x0_t3_down = depth(g(5):i(5))';

% up cast data
temp_man_1_x0_t3_up = temperature(i(1):h(1))';
depth_man_1_x0_t3_up = depth(i(1):h(1))';
temp_man_2_x0_t3_up = temperature(i(2):h(2))';
depth_man_2_x0_t3_up = depth(i(2):h(2))';
temp_man_3_x0_t3_up = temperature(i(3):h(3))';
depth_man_3_x0_t3_up = depth(i(3):h(3))';
temp_man_4_x0_t3_up = temperature(i(4):h(4))';
depth_man_4_x0_t3_up = depth(i(4):h(4))';
temp_man_5_x0_t3_up = temperature(i(5):h(5))';
depth_man_5_x0_t3_up = depth(i(5):h(5))';


% up and down cast sample
temp_man_1_x0_t3_down_up = temperature(g(1):h(1))';
depth_man_1_x0_t3_down_up = depth(g(1):h(1))';
temp_man_2_x0_t3_down_up = temperature(g(2):h(2))';
depth_man_2_x0_t3_down_up = depth(g(2):h(2))';
temp_man_3_x0_t3_down_up = temperature(g(3):h(3))';
depth_man_3_x0_t3_down_up = depth(g(3):h(3))';
temp_man_4_x0_t3_down_up = temperature(g(4):h(4))';
depth_man_4_x0_t3_down_up = depth(g(4):h(4))';
temp_man_5_x0_t3_down_up = temperature(g(5):h(5))';
depth_man_5_x0_t3_down_up = depth(g(5):h(5))';

% % % % savh('uppy_downy.mat')%,'temp_man_1_x0_t3_down_up', 'depth_man_1_x0_t3_down_up', 'temp_man_2_x0_t3_down_up', 'depth_man_2_x0_t3_down_up', 'temp_man_3_x0_t3_down_up', 'depth_man_3_x0_t3_down_up');

% glider data - down and up casts
temp_glide_1_down_x0_t3 = temperature(g(6):i(6))';
depth_glide_1_down_x0_t3 = depth(g(6):i(6))';
temp_glide_1_up_x0_t3 = temperature(i(6):h(6))';
depth_glide_1_up_x0_t3 = depth(i(6):h(6))';
temp_glide_2_down_x0_t3 = temperature(g(7):i(7))';
depth_glide_2_down_x0_t3 = depth(g(7):i(7))';
temp_glide_2_up_x0_t3 = temperature(i(7):h(7))';
depth_glide_2_up_x0_t3 = depth(i(7):h(7))';

% glider data - by yo-yos
temp_glide_yo_1_x0_t3 = temperature(g(6):h(6))';
depth_glide_yo_1_x0_t3 = depth(g(6):h(6))';
temp_glide_yo_2_x0_t3 = temperature(g(7):h(7))';
depth_glide_yo_2_x0_t3 = depth(g(7):h(7))';



% AUV racetrack data 
% fliplr is to acount for one run N-S then the next S-N means get
% consistant physical start and end positions
temp_auv_1_x0_t3 = temperature(g(8):h(8))';
depth_auv_1_x0_t3 = depth(g(8):h(8))';
temp_auv_2_x0_t3 = fliplr(temperature(g(9):h(9))');
depth_auv_2_x0_t3 = fliplr(depth(g(9):h(9))');
temp_auv_3_x0_t3 = temperature(g(10):h(10))';
depth_auv_3_x0_t3 = depth(g(10):h(10))';
temp_auv_4_x0_t3 = fliplr(temperature(g(11):h(11))');
depth_auv_4_x0_t3 = fliplr(depth(g(11):h(11))');
temp_auv_5_x0_t3 = temperature(g(12):h(12))';
depth_auv_5_x0_t3 = depth(g(12):h(12))';
temp_auv_6_x0_t3 = fliplr(temperature(g(13):h(13))');
depth_auv_6_x0_t3 = fliplr(depth(g(13):h(13))');
temp_auv_7_x0_t3 = temperature(g(14):h(14))';
depth_auv_7_x0_t3 = depth(g(14):h(14))';
temp_auv_8_x0_t3 = fliplr(temperature(g(15):h(15))');
depth_auv_8_x0_t3 = fliplr(depth(g(15):h(15))');
temp_auv_9_x0_t3 = temperature(g(16):h(16))';
depth_auv_9_x0_t3 = depth(g(16):h(16))';
temp_auv_10_x0_t3 = fliplr(temperature(g(17):h(17))');
depth_auv_10_x0_t3 = fliplr(depth(g(17):h(17))');

%
% auv_x0_t3 =[min(temp_auv_1_x0_t3) mean(temp_auv_1_x0_t3) max(temp_auv_1_x0_t3) mean(depth_auv_1_x0_t3); min(temp_auv_2_x0_t3) mean(temp_auv_2_x0_t3) max(temp_auv_2_x0_t3) mean(depth_auv_2_x0_t3); min(temp_auv_3_x0_t3) mean(temp_auv_3_x0_t3) max(temp_auv_3_x0_t3) mean(depth_auv_3_x0_t3); min(temp_auv_4_x0_t3) mean(temp_auv_4_x0_t3) max(temp_auv_4_x0_t3) mean(depth_auv_4_x0_t3); min(temp_auv_5_x0_t3) mean(temp_auv_5_x0_t3) max(temp_auv_5_x0_t3) mean(depth_auv_5_x0_t3); min(temp_auv_6_x0_t3) mean(temp_auv_6_x0_t3) max(temp_auv_6_x0_t3) mean(depth_auv_6_x0_t3); min(temp_auv_7_x0_t3) mean(temp_auv_7_x0_t3) max(temp_auv_7_x0_t3) mean(depth_auv_7_x0_t3)];
% plot(auv_x0_t3(:,1), auv_x0_t3(:,4),auv_x0_t3(:,2), auv_x0_t3(:,4),auv_x0_t3(:,3), auv_x0_t3(:,4))

%
% auv_x0_t3 =[min(temp_auv_1_x0_t3) mean(temp_auv_1_x0_t3) max(temp_auv_1_x0_t3) mean(depth_auv_1_x0_t3); min(temp_auv_2_x0_t3) mean(temp_auv_2_x0_t3) max(temp_auv_2_x0_t3) mean(depth_auv_2_x0_t3); min(temp_auv_3_x0_t3) mean(temp_auv_3_x0_t3) max(temp_auv_3_x0_t3) mean(depth_auv_3_x0_t3); min(temp_auv_4_x0_t3) mean(temp_auv_4_x0_t3) max(temp_auv_4_x0_t3) mean(depth_auv_4_x0_t3); min(temp_auv_5_x0_t3) mean(temp_auv_5_x0_t3) max(temp_auv_5_x0_t3) mean(depth_auv_5_x0_t3); min(temp_auv_6_x0_t3) mean(temp_auv_6_x0_t3) max(temp_auv_6_x0_t3) mean(depth_auv_6_x0_t3); min(temp_auv_7_x0_t3) mean(temp_auv_7_x0_t3) max(temp_auv_7_x0_t3) mean(depth_auv_7_x0_t3); min(temp_auv_8_x0_t3) mean(temp_auv_8_x0_t3) max(temp_auv_8_x0_t3) mean(depth_auv_8_x0_t3); min(temp_auv_9_x0_t3) mean(temp_auv_9_x0_t3) max(temp_auv_9_x0_t3) mean(depth_auv_9_x0_t3); min(temp_auv_10_x0_t3) mean(temp_auv_10_x0_t3) max(temp_auv_10_x0_t3) mean(depth_auv_10_x0_t3)];
auv_x0_t3 =[min(temp_auv_1_x0_t3) mean(temp_auv_1_x0_t3) max(temp_auv_1_x0_t3) mean(depth_auv_1_x0_t3) min(depth_auv_1_x0_t3) max(depth_auv_1_x0_t3); min(temp_auv_2_x0_t3) mean(temp_auv_2_x0_t3) max(temp_auv_2_x0_t3) mean(depth_auv_2_x0_t3) min(depth_auv_2_x0_t3) max(depth_auv_2_x0_t3); min(temp_auv_3_x0_t3) mean(temp_auv_3_x0_t3) max(temp_auv_3_x0_t3) mean(depth_auv_3_x0_t3) min(depth_auv_3_x0_t3) max(depth_auv_3_x0_t3); min(temp_auv_4_x0_t3) mean(temp_auv_4_x0_t3) max(temp_auv_4_x0_t3) mean(depth_auv_4_x0_t3) min(depth_auv_4_x0_t3) max(depth_auv_4_x0_t3); min(temp_auv_5_x0_t3) mean(temp_auv_5_x0_t3) max(temp_auv_5_x0_t3) mean(depth_auv_5_x0_t3) min(depth_auv_5_x0_t3) max(depth_auv_5_x0_t3); min(temp_auv_6_x0_t3) mean(temp_auv_6_x0_t3) max(temp_auv_6_x0_t3) mean(depth_auv_6_x0_t3) min(depth_auv_6_x0_t3) max(depth_auv_6_x0_t3); min(temp_auv_7_x0_t3) mean(temp_auv_7_x0_t3) max(temp_auv_7_x0_t3) mean(depth_auv_7_x0_t3) min(depth_auv_7_x0_t3) max(depth_auv_7_x0_t3); min(temp_auv_8_x0_t3) mean(temp_auv_8_x0_t3) max(temp_auv_8_x0_t3) mean(depth_auv_8_x0_t3) min(depth_auv_8_x0_t3) max(depth_auv_8_x0_t3); min(temp_auv_9_x0_t3) mean(temp_auv_9_x0_t3) max(temp_auv_9_x0_t3) mean(depth_auv_9_x0_t3) min(depth_auv_9_x0_t3) max(depth_auv_9_x0_t3); min(temp_auv_10_x0_t3) mean(temp_auv_10_x0_t3) max(temp_auv_10_x0_t3) mean(depth_auv_10_x0_t3) min(depth_auv_10_x0_t3) max(depth_auv_10_x0_t3)];




%%
figure(4)

plot(auv_x0_t3(:,2), auv_x0_t3(:,4),'-xg')


set(gca, 'Layer', 'top')% ensures that axis drawn on top of patches
hold on

patch([auv_x0_t3(:,3)' fliplr(auv_x0_t3(:,1)')], [auv_x0_t3(:,5)' fliplr(auv_x0_t3(:,6)')], 'g','FaceAlpha',0.1,'EdgeAlpha',0.3,'EdgeColor','g','LineStyle',':')

plot(temp_man_1_x0_t3_down, depth_man_1_x0_t3_down,'r',temp_man_1_x0_t3_up, depth_man_1_x0_t3_up,':r')
plot(temp_glide_1_down_x0_t3, depth_glide_1_down_x0_t3,'b',temp_glide_1_up_x0_t3, depth_glide_1_up_x0_t3,':b')

plot(temp_man_2_x0_t3_down, depth_man_2_x0_t3_down,'r',temp_man_2_x0_t3_up, depth_man_2_x0_t3_up,':r')
plot(temp_man_3_x0_t3_down, depth_man_3_x0_t3_down,'r',temp_man_3_x0_t3_up, depth_man_3_x0_t3_up,':r')
plot(temp_man_4_x0_t3_down, depth_man_4_x0_t3_down,'r',temp_man_4_x0_t3_up, depth_man_4_x0_t3_up,':r')
plot(temp_man_5_x0_t3_down, depth_man_5_x0_t3_down,'r',temp_man_5_x0_t3_up, depth_man_5_x0_t3_up,':r')
plot(temp_glide_2_down_x0_t3, depth_glide_2_down_x0_t3,'b',temp_glide_2_up_x0_t3, depth_glide_2_up_x0_t3,':b')
hold off
xlim([14 23])
ylim([-21 0])
title('Raw Temperature/Depth data of (100m) transit x0 t3 (consisting 5 manual casts, 2 glider yo-yos and a set of auv racetracks')
legend('Mean AUV Temperature (Deg C)','AUV Temperature Range (Deg C)','Manual downcast Temperature (Deg C)','Manual upcast Temperature (Deg C)','Glider downward yo Temperature (Deg C)','Glider upward yo Temperature (Deg C)','Location','Best')


xlabel('Water Temperature (Deg C)')
ylabel ('Lake Depth (m)')


%%

save('lland_18_aug.mat')%,'temp_man_1_x0_t4', 'depth_man_1_x0_t4','temp_man_2_x0_t4', 'depth_man_2_x0_t4','temp_man_3_x0_t4', 'depth_man_3_x0_t4','temp_man_4_x0_t4', 'depth_man_4_x0_t4','temp_glide_1_x0_t4', 'depth_glide_1_x0_t4','temp_auv_1_x0_t4', 'depth_auv_1_x0_t4');


