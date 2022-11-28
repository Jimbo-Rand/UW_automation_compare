

% clear all
% close all


%% parameters

max_depth = -21;
max_temp = 22.5;
min_temp = 14;

set(gca,'FontSize',12,'fontWeight','bold')

line_width = 1.5;

%%

figure(1)

plot(temp_auv_1_x0_t0,depth_auv_1_x0_t0,'.g', 'linewidth', line_width)
set(gca, 'Layer', 'top')% ensures that axis drawn on top of patches
hold on


plot(temp_man_2_x0_t0_down, depth_man_2_x0_t0_down,'r',temp_man_2_x0_t0_up, depth_man_2_x0_t0_up,':r', 'linewidth', line_width)
plot(temp_glide_1_down_x0_t0, depth_glide_1_down_x0_t0,'b', 'linewidth', line_width)
plot(temp_glide_1_up_x0_t0, depth_glide_1_up_x0_t0,':b', 'linewidth', line_width)



plot(temp_man_1_x0_t0_down, depth_man_1_x0_t0_down,':r', 'linewidth', line_width)

plot(temp_man_1_x0_t0_down, depth_man_1_x0_t0_down,'r', 'linewidth', line_width)%,temp_man_1_x0_t0_up, depth_man_1_x0_t0_up,':r', 'linewidth', line_width)% something went wrong on up cast and no data recorded


plot(temp_man_2_x0_t0_down, depth_man_2_x0_t0_down,'r',temp_man_2_x0_t0_up, depth_man_2_x0_t0_up,':r', 'linewidth', line_width)
plot(temp_man_3_x0_t0_down, depth_man_3_x0_t0_down,'r',temp_man_3_x0_t0_up, depth_man_3_x0_t0_up,':r', 'linewidth', line_width)
plot(temp_man_4_x0_t0_down, depth_man_4_x0_t0_down,'r',temp_man_4_x0_t0_up, depth_man_4_x0_t0_up,':r', 'linewidth', line_width)
plot(temp_man_5_x0_t0_down, depth_man_5_x0_t0_down,'r',temp_man_5_x0_t0_up, depth_man_5_x0_t0_up,':r', 'linewidth', line_width)
plot(temp_glide_2_down_x0_t0, depth_glide_2_down_x0_t0,'b',temp_glide_2_up_x0_t0, depth_glide_2_up_x0_t0,':b', 'linewidth', line_width)


plot(temp_auv_1_x0_t0,depth_auv_1_x0_t0,'.g', 'linewidth', line_width)
plot(temp_auv_2_x0_t0,depth_auv_2_x0_t0,'.g', 'linewidth', line_width)
plot(temp_auv_3_x0_t0,depth_auv_3_x0_t0,'.g', 'linewidth', line_width)
plot(temp_auv_4_x0_t0,depth_auv_4_x0_t0,'.g', 'linewidth', line_width)
plot(temp_auv_5_x0_t0,depth_auv_5_x0_t0,'.g', 'linewidth', line_width)
plot(temp_auv_6_x0_t0,depth_auv_6_x0_t0,'.g', 'linewidth', line_width)
plot(temp_auv_7_x0_t0,depth_auv_7_x0_t0,'.g', 'linewidth', line_width)
plot(temp_auv_8_x0_t0,depth_auv_8_x0_t0,'.g', 'linewidth', line_width)
plot(temp_auv_9_x0_t0,depth_auv_9_x0_t0,'.g', 'linewidth', line_width)
plot(temp_auv_10_x0_t0,depth_auv_10_x0_t0,'.g', 'linewidth', line_width)






hold off


xlim([min_temp max_temp])
ylim([max_depth 0])
% title('Raw Temperature/Depth data of (100m) transit x0 t0 (consisting 5 manual casts, 2 glider yo-yos and a set of auv racetracks')
legend('AUV Temperature (Deg C)','Manual downcast Temperature (Deg C)','Manual upcast Temperature (Deg C)','Glider downward yo Temperature (Deg C)','Glider upward yo Temperature (Deg C)','Location','Best')

xlabel('Water Temperature (Deg C)')
ylabel ('Lake Depth (m)')
set(gca,'FontSize',18,'fontWeight','bold')

%%
figure(2)


plot(temp_auv_1_x1_t0,depth_auv_1_x1_t0,'.g', 'linewidth', line_width)
set(gca, 'Layer', 'top')% ensures that axis drawn on top of patches
hold on

plot(temp_man_1_x1_t0_down, depth_man_1_x1_t0_down,'r',temp_man_1_x1_t0_up, depth_man_1_x1_t0_up,':r', 'linewidth', line_width)
plot(temp_glide_1_down_x1_t0, depth_glide_1_down_x1_t0,'b',temp_glide_1_up_x1_t0, depth_glide_1_up_x1_t0,':b', 'linewidth', line_width)

plot(temp_man_2_x1_t0_down, depth_man_2_x1_t0_down,'r',temp_man_2_x1_t0_up, depth_man_2_x1_t0_up,':r', 'linewidth', line_width)
plot(temp_man_3_x1_t0_down, depth_man_3_x1_t0_down,'r',temp_man_3_x1_t0_up, depth_man_3_x1_t0_up,':r', 'linewidth', line_width)
plot(temp_man_4_x1_t0_down, depth_man_4_x1_t0_down,'r',temp_man_4_x1_t0_up, depth_man_4_x1_t0_up,':r', 'linewidth', line_width)
plot(temp_man_5_x1_t0_down, depth_man_5_x1_t0_down,'r',temp_man_5_x1_t0_up, depth_man_5_x1_t0_up,':r', 'linewidth', line_width)
plot(temp_glide_2_down_x1_t0, depth_glide_2_down_x1_t0,'b',temp_glide_2_up_x1_t0, depth_glide_2_up_x1_t0,':b', 'linewidth', line_width)

plot(temp_auv_1_x1_t0,depth_auv_1_x1_t0,'.g', 'linewidth', line_width)
plot(temp_auv_2_x1_t0,depth_auv_2_x1_t0,'.g', 'linewidth', line_width)
plot(temp_auv_3_x1_t0,depth_auv_3_x1_t0,'.g', 'linewidth', line_width)
plot(temp_auv_4_x1_t0,depth_auv_4_x1_t0,'.g', 'linewidth', line_width)
plot(temp_auv_5_x1_t0,depth_auv_5_x1_t0,'.g', 'linewidth', line_width)
plot(temp_auv_6_x1_t0,depth_auv_6_x1_t0,'.g', 'linewidth', line_width)
plot(temp_auv_7_x1_t0,depth_auv_7_x1_t0,'.g', 'linewidth', line_width)
plot(temp_auv_8_x1_t0,depth_auv_8_x1_t0,'.g', 'linewidth', line_width)
plot(temp_auv_9_x1_t0,depth_auv_9_x1_t0,'.g', 'linewidth', line_width)

hold off

xlim([min_temp max_temp])
ylim([max_depth 0])
% title('Raw Temperature/Depth data of (100m) transit, location x1 and time t0, consisting 5 manual casts, 2 glider yo-yos and a set of AUV racetracks')
legend('AUV Temperature (Deg C)','Manual downcast Temperature (Deg C)','Manual upcast Temperature (Deg C)','Glider downward yo Temperature (Deg C)','Glider upward yo Temperature (Deg C)','Location','Best')
set(gca,'FontSize',18,'fontWeight','bold')

xlabel('Water Temperature (Deg C)')
ylabel ('Lake Depth (m)')


%%
figure(3)

plot(temp_auv_1_x0_t3,depth_auv_1_x0_t3,'.g', 'linewidth', line_width)
set(gca, 'Layer', 'top')% ensures that axis drawn on top of patches
hold on


plot(temp_man_1_x0_t3_down, depth_man_1_x0_t3_down,'r',temp_man_1_x0_t3_up, depth_man_1_x0_t3_up,':r', 'linewidth', line_width)
plot(temp_glide_1_down_x0_t3, depth_glide_1_down_x0_t3,'b',temp_glide_1_up_x0_t3, depth_glide_1_up_x0_t3,':b', 'linewidth', line_width)

plot(temp_man_2_x0_t3_down, depth_man_2_x0_t3_down,'r',temp_man_2_x0_t3_up, depth_man_2_x0_t3_up,':r', 'linewidth', line_width)
plot(temp_man_3_x0_t3_down, depth_man_3_x0_t3_down,'r',temp_man_3_x0_t3_up, depth_man_3_x0_t3_up,':r', 'linewidth', line_width)
plot(temp_man_4_x0_t3_down, depth_man_4_x0_t3_down,'r',temp_man_4_x0_t3_up, depth_man_4_x0_t3_up,':r', 'linewidth', line_width)
plot(temp_man_5_x0_t3_down, depth_man_5_x0_t3_down,'r',temp_man_5_x0_t3_up, depth_man_5_x0_t3_up,':r', 'linewidth', line_width)
plot(temp_glide_2_down_x0_t3, depth_glide_2_down_x0_t3,'b',temp_glide_2_up_x0_t3, depth_glide_2_up_x0_t3,':b', 'linewidth', line_width)

plot(temp_auv_1_x0_t3,depth_auv_1_x0_t3,'.g', 'linewidth', line_width)
plot(temp_auv_2_x0_t3,depth_auv_2_x0_t3,'.g', 'linewidth', line_width)
plot(temp_auv_3_x0_t3,depth_auv_3_x0_t3,'.g', 'linewidth', line_width)
plot(temp_auv_4_x0_t3,depth_auv_4_x0_t3,'.g', 'linewidth', line_width)
plot(temp_auv_5_x0_t3,depth_auv_5_x0_t3,'.g', 'linewidth', line_width)
plot(temp_auv_6_x0_t3,depth_auv_6_x0_t3,'.g', 'linewidth', line_width)
plot(temp_auv_7_x0_t3,depth_auv_7_x0_t3,'.g', 'linewidth', line_width)
plot(temp_auv_8_x0_t3,depth_auv_8_x0_t3,'.g', 'linewidth', line_width)
plot(temp_auv_9_x0_t3,depth_auv_9_x0_t3,'.g', 'linewidth', line_width)
plot(temp_auv_10_x0_t3,depth_auv_10_x0_t3,'.g', 'linewidth', line_width)

pbaspect([2 1 1])

hold off
xlim([min_temp max_temp])
ylim([max_depth 0])
% title('Raw Temperature/Depth data of (100m) transit x0 t3 (consisting 5 manual casts, 2 glider yo-yos and a set of auv racetracks')
legend('AUV Temperature (Deg C)','Manual downcast Temperature (Deg C)','Manual upcast Temperature (Deg C)','Glider downward yo Temperature (Deg C)','Glider upward yo Temperature (Deg C)','Location','Best')
set(gca,'FontSize',18,'fontWeight','bold')

xlabel('Water Temperature (Deg C)')
ylabel ('Lake Depth (m)')



%%
figure(10)

set(gca, 'Layer', 'top')% ensures that axis drawn on top of patches
hold on
plot(temp_auv_1_x0_t0,depth_auv_1_x0_t0,'.g', 'linewidth', line_width)



plot(Correct_Temperature_Matrix{1}, Correct_Depth_Matrix{1},'-b', 'linewidth', line_width)

plot(Correct_Temperature_Matrix{6}, Correct_Depth_Matrix{6},'-r', 'linewidth', line_width)
plot(Correct_Temperature_Matrix{7}, Correct_Depth_Matrix{7},'-r', 'linewidth', line_width)
plot(Correct_Temperature_Matrix{8}, Correct_Depth_Matrix{8},'-r', 'linewidth', line_width)
plot(Correct_Temperature_Matrix{9}, Correct_Depth_Matrix{9},'-r', 'linewidth', line_width)

plot(Correct_Temperature_Matrix{2}, Correct_Depth_Matrix{2},'-b', 'linewidth', line_width)
plot(Correct_Temperature_Matrix{3}, Correct_Depth_Matrix{3},'-b', 'linewidth', line_width)
plot(Correct_Temperature_Matrix{4}, Correct_Depth_Matrix{4},'-b', 'linewidth', line_width)
plot(Correct_Temperature_Matrix{5}, Correct_Depth_Matrix{5},'-b', 'linewidth', line_width)

plot(temp_auv_1_x0_t0,depth_auv_1_x0_t0,'.g', 'linewidth', line_width)
plot(temp_auv_2_x0_t0,depth_auv_2_x0_t0,'.g', 'linewidth', line_width)
plot(temp_auv_3_x0_t0,depth_auv_3_x0_t0,'.g', 'linewidth', line_width)
plot(temp_auv_4_x0_t0,depth_auv_4_x0_t0,'.g', 'linewidth', line_width)
plot(temp_auv_5_x0_t0,depth_auv_5_x0_t0,'.g', 'linewidth', line_width)
plot(temp_auv_6_x0_t0,depth_auv_6_x0_t0,'.g', 'linewidth', line_width)
plot(temp_auv_7_x0_t0,depth_auv_7_x0_t0,'.g', 'linewidth', line_width)
plot(temp_auv_8_x0_t0,depth_auv_8_x0_t0,'.g', 'linewidth', line_width)
plot(temp_auv_9_x0_t0,depth_auv_9_x0_t0,'.g', 'linewidth', line_width)
plot(temp_auv_10_x0_t0,depth_auv_10_x0_t0,'.g', 'linewidth', line_width)
hold off
xlim([min_temp max_temp])
ylim([max_depth 0])
% title('Corrected Manual casts, glider and AUV racetracks Temperature/Depth data over (100m) transit x0 t0')
legend('AUV Temperature (Deg C)','Corrected Manual Cast Temperature (Deg C)','Corrected Glider Yo-Yos Temperature (Deg C)','Location','Best')
set(gca,'FontSize',18,'fontWeight','bold')

xlabel('Water Temperature (Deg C)')
ylabel ('Lake Depth (m)')

%%
figure(11)

set(gca, 'Layer', 'top')% ensures that axis drawn on top of patches
hold on
plot(temp_auv_1_x1_t0,depth_auv_1_x1_t0,'.g', 'linewidth', line_width)


plot(Correct_Temperature_Matrix{10}, Correct_Depth_Matrix{10},'-b', 'linewidth', line_width)

plot(Correct_Temperature_Matrix{15}, Correct_Depth_Matrix{15},'-r', 'linewidth', line_width)
plot(Correct_Temperature_Matrix{16}, Correct_Depth_Matrix{16},'-r', 'linewidth', line_width)
plot(Correct_Temperature_Matrix{17}, Correct_Depth_Matrix{17},'-r', 'linewidth', line_width)
plot(Correct_Temperature_Matrix{18}, Correct_Depth_Matrix{18},'-r', 'linewidth', line_width)


plot(Correct_Temperature_Matrix{11}, Correct_Depth_Matrix{11},'-b', 'linewidth', line_width)
plot(Correct_Temperature_Matrix{12}, Correct_Depth_Matrix{12},'-b', 'linewidth', line_width)
plot(Correct_Temperature_Matrix{13}, Correct_Depth_Matrix{13},'-b', 'linewidth', line_width)
plot(Correct_Temperature_Matrix{14}, Correct_Depth_Matrix{14},'-b', 'linewidth', line_width)

plot(temp_auv_1_x1_t0,depth_auv_1_x1_t0,'.g', 'linewidth', line_width)
plot(temp_auv_2_x1_t0,depth_auv_2_x1_t0,'.g', 'linewidth', line_width)
plot(temp_auv_3_x1_t0,depth_auv_3_x1_t0,'.g', 'linewidth', line_width)
plot(temp_auv_4_x1_t0,depth_auv_4_x1_t0,'.g', 'linewidth', line_width)
plot(temp_auv_5_x1_t0,depth_auv_5_x1_t0,'.g', 'linewidth', line_width)
plot(temp_auv_6_x1_t0,depth_auv_6_x1_t0,'.g', 'linewidth', line_width)
plot(temp_auv_7_x1_t0,depth_auv_7_x1_t0,'.g', 'linewidth', line_width)
plot(temp_auv_8_x1_t0,depth_auv_8_x1_t0,'.g', 'linewidth', line_width)
plot(temp_auv_9_x1_t0,depth_auv_9_x1_t0,'.g', 'linewidth', line_width)

hold off
xlim([min_temp max_temp])
ylim([max_depth 0])
% title('Corrected Manual casts, glider and AUV racetracks Temperature/Depth data over (100m) transit x1 t0')
legend('AUV Temperature (Deg C)','Corrected Manual Cast Temperature (Deg C)','Corrected Glider Yo-Yos Temperature (Deg C)','Location','Best')
set(gca,'FontSize',18,'fontWeight','bold')

xlabel('Water Temperature (Deg C)')
ylabel ('Lake Depth (m)')

%%
figure(12)
set(gca, 'Layer', 'top')% ensures that axis drawn on top of patches
hold on
plot(temp_auv_1_x0_t3,depth_auv_1_x0_t3,'.g', 'linewidth', line_width)
plot(Correct_Temperature_Matrix{19}, Correct_Depth_Matrix{19},'-b', 'linewidth', line_width)

plot(Correct_Temperature_Matrix{24}, Correct_Depth_Matrix{24},'-r', 'linewidth', line_width)
plot(Correct_Temperature_Matrix{25}, Correct_Depth_Matrix{25},'-r', 'linewidth', line_width)
plot(Correct_Temperature_Matrix{26}, Correct_Depth_Matrix{26},'-r', 'linewidth', line_width)
plot(Correct_Temperature_Matrix{27}, Correct_Depth_Matrix{27},'-r', 'linewidth', line_width)

plot(Correct_Temperature_Matrix{20}, Correct_Depth_Matrix{20},'-b', 'linewidth', line_width)
plot(Correct_Temperature_Matrix{21}, Correct_Depth_Matrix{21},'-b', 'linewidth', line_width)
plot(Correct_Temperature_Matrix{22}, Correct_Depth_Matrix{22},'-b', 'linewidth', line_width)
plot(Correct_Temperature_Matrix{23}, Correct_Depth_Matrix{23},'-b', 'linewidth', line_width)

plot(temp_auv_1_x0_t3,depth_auv_1_x0_t3,'.g', 'linewidth', line_width)
plot(temp_auv_2_x0_t3,depth_auv_2_x0_t3,'.g', 'linewidth', line_width)
plot(temp_auv_3_x0_t3,depth_auv_3_x0_t3,'.g', 'linewidth', line_width)
plot(temp_auv_4_x0_t3,depth_auv_4_x0_t3,'.g', 'linewidth', line_width)
plot(temp_auv_5_x0_t3,depth_auv_5_x0_t3,'.g', 'linewidth', line_width)
plot(temp_auv_6_x0_t3,depth_auv_6_x0_t3,'.g', 'linewidth', line_width)
plot(temp_auv_7_x0_t3,depth_auv_7_x0_t3,'.g', 'linewidth', line_width)
plot(temp_auv_8_x0_t3,depth_auv_8_x0_t3,'.g', 'linewidth', line_width)
plot(temp_auv_9_x0_t3,depth_auv_9_x0_t3,'.g', 'linewidth', line_width)
plot(temp_auv_10_x0_t3,depth_auv_10_x0_t3,'.g', 'linewidth', line_width)

hold off
xlim([min_temp max_temp])
ylim([max_depth 0])
% title('Corrected Manual casts, glider and AUV racetracks Temperature/Depth data over (100m) transit x0 t3')
legend('AUV Temperature (Deg C)','Corrected Manual Cast Temperature (Deg C)','Corrected Glider Yo-Yos Temperature (Deg C)','Location','Best')
set(gca,'FontSize',18,'fontWeight','bold')

xlabel('Water Temperature (Deg C)')
ylabel ('Lake Depth (m)')


%%
figure(13)

hold on
plot(temp_auv_1_x0_t0,depth_auv_1_x0_t0,'.k', 'linewidth', line_width)
plot(temp_auv_1_x1_t0,depth_auv_1_x1_t0,'.c', 'linewidth', line_width)
plot(temp_auv_1_x0_t3,depth_auv_1_x0_t3,'.m', 'linewidth', line_width)


plot(temp_auv_2_x0_t0,depth_auv_2_x0_t0,'.k', 'linewidth', line_width)
plot(temp_auv_3_x0_t0,depth_auv_3_x0_t0,'.k', 'linewidth', line_width)
plot(temp_auv_4_x0_t0,depth_auv_4_x0_t0,'.k', 'linewidth', line_width)
plot(temp_auv_5_x0_t0,depth_auv_5_x0_t0,'.k', 'linewidth', line_width)
plot(temp_auv_6_x0_t0,depth_auv_6_x0_t0,'.k', 'linewidth', line_width)
plot(temp_auv_7_x0_t0,depth_auv_7_x0_t0,'.k', 'linewidth', line_width)
plot(temp_auv_8_x0_t0,depth_auv_8_x0_t0,'.k', 'linewidth', line_width)
plot(temp_auv_9_x0_t0,depth_auv_9_x0_t0,'.k', 'linewidth', line_width)
plot(temp_auv_10_x0_t0,depth_auv_10_x0_t0,'.k', 'linewidth', line_width)



plot(temp_auv_2_x1_t0,depth_auv_2_x1_t0,'.c', 'linewidth', line_width)
plot(temp_auv_3_x1_t0,depth_auv_3_x1_t0,'.c', 'linewidth', line_width)
plot(temp_auv_4_x1_t0,depth_auv_4_x1_t0,'.c', 'linewidth', line_width)
plot(temp_auv_5_x1_t0,depth_auv_5_x1_t0,'.c', 'linewidth', line_width)
plot(temp_auv_6_x1_t0,depth_auv_6_x1_t0,'.c', 'linewidth', line_width)
plot(temp_auv_7_x1_t0,depth_auv_7_x1_t0,'.c', 'linewidth', line_width)
plot(temp_auv_8_x1_t0,depth_auv_8_x1_t0,'.c', 'linewidth', line_width)
plot(temp_auv_9_x1_t0,depth_auv_9_x1_t0,'.c', 'linewidth', line_width)
% plot(temp_auv_10_x1_t0,depth_auv_10_x1_t0,'.c', 'linewidth', line_width)
% plot(temp_auv_11_x1_t0,depth_auv_11_x1_t0,'.c', 'linewidth', line_width)



plot(temp_auv_2_x0_t3,depth_auv_2_x0_t3,'.m', 'linewidth', line_width)
plot(temp_auv_3_x0_t3,depth_auv_3_x0_t3,'.m', 'linewidth', line_width)
plot(temp_auv_4_x0_t3,depth_auv_4_x0_t3,'.m', 'linewidth', line_width)
plot(temp_auv_5_x0_t3,depth_auv_5_x0_t3,'.m', 'linewidth', line_width)
plot(temp_auv_6_x0_t3,depth_auv_6_x0_t3,'.m', 'linewidth', line_width)
plot(temp_auv_7_x0_t3,depth_auv_7_x0_t3,'.m', 'linewidth', line_width)
plot(temp_auv_8_x0_t3,depth_auv_8_x0_t3,'.m', 'linewidth', line_width)
plot(temp_auv_9_x0_t3,depth_auv_9_x0_t3,'.m', 'linewidth', line_width)
plot(temp_auv_10_x0_t3,depth_auv_10_x0_t3,'.m', 'linewidth', line_width)

plot(auv_x0_t0(:,2), auv_x0_t0(:,4),'--xk', 'linewidth', line_width)
plot(auv_x1_t0(:,2), auv_x1_t0(:,4),'--xc', 'linewidth', line_width)
plot(auv_x0_t3(:,2), auv_x0_t3(:,4),'--xm', 'linewidth', line_width)

hold off
grid on
grid minor
xlim([13 max_temp])
ylim([-22 0])
% title('AUV racetracks Temperature/Depth data over transits x0t0, x1t0 and x0t3')
legend('AUV x0t0 Temperature (Deg C) - Baseline','AUV x1t0 Temperature (Deg C) - 200m spatially distant from x0t0','AUV x0t3 Temperature (Deg C)- 3 hours temporally distant from x0t0','Location','Best')


xlabel('Water Temperature (Deg C)')
ylabel ('Lake Depth (m)')
set(gca,'FontSize',18,'fontWeight','bold')

%%
figure(14)
plot(Correct_Temperature_Matrix{2}, Correct_Depth_Matrix{2},'-k', 'linewidth', line_width)
hold on
plot(Correct_Temperature_Matrix{10}, Correct_Depth_Matrix{10},'-c', 'linewidth', line_width) 
plot(Correct_Temperature_Matrix{19}, Correct_Depth_Matrix{19},'-m', 'linewidth', line_width) 

plot(Correct_Temperature_Matrix{3}, Correct_Depth_Matrix{3},'-k', 'linewidth', line_width)
plot(Correct_Temperature_Matrix{4}, Correct_Depth_Matrix{4},'-k', 'linewidth', line_width)
plot(Correct_Temperature_Matrix{5}, Correct_Depth_Matrix{5},'-k', 'linewidth', line_width)

plot(Correct_Temperature_Matrix{11}, Correct_Depth_Matrix{11},'-c', 'linewidth', line_width)
plot(Correct_Temperature_Matrix{12}, Correct_Depth_Matrix{12},'-c', 'linewidth', line_width)
plot(Correct_Temperature_Matrix{13}, Correct_Depth_Matrix{13},'-c', 'linewidth', line_width)
plot(Correct_Temperature_Matrix{14}, Correct_Depth_Matrix{14},'-c', 'linewidth', line_width)

plot(Correct_Temperature_Matrix{20}, Correct_Depth_Matrix{20},'-m', 'linewidth', line_width)
plot(Correct_Temperature_Matrix{21}, Correct_Depth_Matrix{21},'-m', 'linewidth', line_width)
plot(Correct_Temperature_Matrix{22}, Correct_Depth_Matrix{22},'-m', 'linewidth', line_width)
plot(Correct_Temperature_Matrix{23}, Correct_Depth_Matrix{23},'-m', 'linewidth', line_width)

hold off
xlim([min_temp max_temp])
ylim([max_depth 0])
% title('Corrected Manual Temperature/Depth data over transits x0t0, x1t0 and x0t3')
legend('Manual x0t0 Temperature (Deg C) - Baseline','Manual x1t0 Temperature (Deg C) - 200m spatially distant from x0t0','Manual x0t3 Temperature (Deg C)- 3 hours temporally distant from x0t0','Location','Best')
set(gca,'FontSize',18,'fontWeight','bold')

xlabel('Water Temperature (Deg C)')
ylabel ('Lake Depth (m)')


%%
figure(15)

plot(Correct_Temperature_Matrix{6}, Correct_Depth_Matrix{6},'-k', 'linewidth', line_width)
hold on
plot(Correct_Temperature_Matrix{15}, Correct_Depth_Matrix{15},'-c', 'linewidth', line_width)
plot(Correct_Temperature_Matrix{24}, Correct_Depth_Matrix{24},'-m', 'linewidth', line_width)




plot(Correct_Temperature_Matrix{16}, Correct_Depth_Matrix{16},'-c', 'linewidth', line_width)
plot(Correct_Temperature_Matrix{17}, Correct_Depth_Matrix{17},'-c', 'linewidth', line_width)
plot(Correct_Temperature_Matrix{18}, Correct_Depth_Matrix{18},'-c', 'linewidth', line_width)



plot(Correct_Temperature_Matrix{25}, Correct_Depth_Matrix{25},'-m', 'linewidth', line_width)
plot(Correct_Temperature_Matrix{26}, Correct_Depth_Matrix{26},'-m', 'linewidth', line_width)
plot(Correct_Temperature_Matrix{27}, Correct_Depth_Matrix{27},'-m', 'linewidth', line_width)

plot(Correct_Temperature_Matrix{7}, Correct_Depth_Matrix{7},'-k', 'linewidth', line_width)
plot(Correct_Temperature_Matrix{8}, Correct_Depth_Matrix{8},'-k', 'linewidth', line_width)
plot(Correct_Temperature_Matrix{9}, Correct_Depth_Matrix{9},'-k', 'linewidth', line_width)
hold off
set(gca,'FontSize',18,'fontWeight','bold')


xlim([min_temp max_temp])
ylim([max_depth 0])
% title('Corrected Glider Temperature/Depth data over transits x0t0, x1t0 and x0t3')
legend('Glider x0t0 Temperature (Deg C) - Baseline','Glider x1t0 Temperature (Deg C) - 200m spatially distant from x0t0','Glider x0t3 Temperature (Deg C)- 3 hours temporally distant from x0t0','Location','Best')


xlabel('Water Temperature (Deg C)')
ylabel ('Lake Depth (m)')
