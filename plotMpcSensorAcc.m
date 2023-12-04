function plotMpcSensorAcc(logsout,default_spacing,time_gap)


%% Get the data from simulation
acceleration = logsout.getElement('acceleration'); % acceleration of ego car
ego_velocity = logsout.getElement('ego_velocity'); % velocity of host car
lead_car_velocity = logsout.getElement('lead_car_velocity'); % velocity of the lead car
lc_vel = lead_car_velocity.Values.Data + ego_velocity.Values.Data;
driver_set_velocity = logsout.getElement('driver_set_velocity'); % driver-set velocity
relative_distance = logsout.getElement('relative_distance'); % actual distance
safe_distance = default_spacing + time_gap*ego_velocity.Values.Data; % safe distance
%% Plot the results
figure('position',[100 100 720 600]);
% velocity
subplot(3,1,1);
plot(ego_velocity.Values.time,ego_velocity.Values.Data,'r');grid on;
hold on; 
plot(driver_set_velocity.Values.time,driver_set_velocity.Values.Data,'k--');
hold on;
plot(ego_velocity.Values.time,lc_vel,'b');
ylim([14,38]);
legend('ego','set','lead','location','NorthEast');
title('Velocity')
xlabel('time (sec)')
ylabel('m/s')
% distance
subplot(3,1,2);
plot(relative_distance.Values.time,relative_distance.Values.Data,'r');grid on;
hold on;
plot(relative_distance.Values.time,safe_distance,'b');grid on;
legend('actual','safe','location','NorthEast');
title('Distance between two cars')
xlabel('time (sec)')
ylabel('m')
% acceleration
subplot(3,1,3);
plot(acceleration.Values.time,acceleration.Values.Data,'r');grid on;
ylim([-3.2,2.2]);
legend('ego','location','NorthEast');
title('Acceleration')
xlabel('time (sec)')
ylabel('$m/s^2$','Interpreter','latex')
