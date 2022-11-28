
clear all
close all

%% Load Data

run('XXX\sensor_pack_downloader.m')


%%

Temperature_matrix	= {temp_man_1_x0_t0_down, temp_man_2_x0_t0_down, temp_man_3_x0_t0_down, temp_man_4_x0_t0_down, temp_man_5_x0_t0_down, temp_glide_1_down_x0_t0, temp_glide_1_up_x0_t0,temp_glide_2_down_x0_t0, temp_glide_2_up_x0_t0,temp_man_1_x1_t0_down, temp_man_2_x1_t0_down, temp_man_3_x1_t0_down, temp_man_4_x1_t0_down, temp_man_5_x1_t0_down, temp_glide_1_down_x1_t0, temp_glide_1_up_x1_t0,temp_glide_2_down_x1_t0, temp_glide_2_up_x1_t0, temp_man_1_x0_t3_down, temp_man_2_x0_t3_down, temp_man_3_x0_t3_down, temp_man_4_x0_t3_down, temp_man_5_x0_t3_down, temp_glide_1_down_x0_t3, temp_glide_1_up_x0_t3,temp_glide_2_down_x0_t3, temp_glide_2_up_x0_t3};
Depth_matrix	= {depth_man_1_x0_t0_down, depth_man_2_x0_t0_down, depth_man_3_x0_t0_down, depth_man_4_x0_t0_down, depth_man_5_x0_t0_down, depth_glide_1_down_x0_t0, depth_glide_1_up_x0_t0,depth_glide_2_down_x0_t0, depth_glide_2_up_x0_t0,depth_man_1_x1_t0_down, depth_man_2_x1_t0_down, depth_man_3_x1_t0_down, depth_man_4_x1_t0_down, depth_man_5_x1_t0_down, depth_glide_1_down_x1_t0, depth_glide_1_up_x1_t0,depth_glide_2_down_x1_t0, depth_glide_2_up_x1_t0, depth_man_1_x0_t3_down, depth_man_2_x0_t3_down, depth_man_3_x0_t3_down, depth_man_4_x0_t3_down, depth_man_5_x0_t3_down, depth_glide_1_down_x0_t3, depth_glide_1_up_x0_t3,depth_glide_2_down_x0_t3, depth_glide_2_up_x0_t3};

Correct_Temperature_Matrix = cell(1, length(Temperature_matrix));
Correct_Temperature_Matrix{1, length(Temperature_matrix)} = [];

GA_parameter_matrix = cell(1, length(Temperature_matrix));
GA_parameter_matrix{4, length(Temperature_matrix)} = [];

%%
for QQ = 1:length(Temperature_matrix)

T_measure = Temperature_matrix{QQ};
D_measure = Depth_matrix{QQ};

dt = 0.2365;
t = (0:dt:(length(T_measure)-1)*dt);
nt = length(t);

%% rates of change made into a X point filter 

filter_size = 13; % 13 points represents approx 1 metre
lag_index = int16(filter_size/2);% index value (m) modifier (to ger half points above and half below)

sum_T_measure = [zeros(1,length(T_measure))];
for m=lag_index:length(T_measure)-(lag_index-1)
    sum_T_measure(1:lag_index) = medfilt1(T_measure(1:lag_index),lag_index);% first aa measurements not effected by any of this
    sum_T_measure(end-(lag_index-2):end) = medfilt1(T_measure(end-(lag_index-2):end),lag_index); % last aa measurements not effected by any of this
    y = T_measure(m-(lag_index-1):m+(lag_index-1)); % aa temperature measurements to the left and aa temperature measurements to the right
    x = t(m-(lag_index-1):m+(lag_index-1));%(-3*dt:dt:3*dt);% aa time measurements to the left and aa time measurements to the right
    p =polyfit(x,y,1); % calculate the slope and intecept of the filter_size sample of measurement points 
%     sum_T_measure(m) = hampel(polyval(p,t(m))); %using the y=mx+c above calculate what temperature value m should be if using aa data points either side 
    sum_T_measure(m) = polyval(p,t(m)); %using the y=mx+c above calculate what temperature value m should be if using aa data points either side 
end

%% 
% filter - NOT USED
dT_measure = medfilt1([0; diff(sum_T_measure')] / dt,1);

%%

% sensor lag assignment

    if QQ == 6 || QQ == 7 || QQ == 8 || QQ == 9 || QQ == 15 || QQ == 16 || QQ == 17 || QQ == 18 %|| QQ == 24 || QQ == 25 || QQ == 26 || QQ == 27 % to get different tau for glider speed 1.2 m/s 
        tau_measure = 3;%(1-v_measure)*6;% + 5*(v_measure - mean_v_measure);
    elseif QQ == 24 || QQ == 25 || QQ == 26 || QQ == 27 %
        tau_measure = 4.5; %because x0t3 for the glider emulation is strange - done at slower speed - different wind speed ?
    else % tau for casts speed 0.3 m/s
        tau_measure = 6;%(1-v_measure)*10;% + 5*(v_measure - mean_v_measure);
    end



%%  sensor lag - response time


T_correct = sum_T_measure + tau_measure .* dT_measure';

%% 
T_correct(1:lag_index+1)= NaN;
T_correct(end-(lag_index+1):end)= NaN;
D_measure(1:lag_index+1)= NaN;
D_measure(end-(lag_index+1):end)= NaN;

Correct_Temperature_Matrix{QQ}= T_correct;
Correct_Depth_Matrix{QQ}= D_measure;

end

save('correct_lland_18.mat')
run('xxx\plotter.m')
