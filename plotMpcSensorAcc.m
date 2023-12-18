function plotMpcSensorAcc(logsout,default_spacing,time_gap)


%% Get the data from simulation
acceleration = logsout.getElement('acceleration'); % acceleration of ego car
ego_velocity = logsout.getElement('ego_velocity'); % velocity of host car
relative_velocity = logsout.getElement('lead_car_velocity'); % velocity of the lead car
lead_car_velocity = relative_velocity.Values.Data + ego_velocity.Values.Data;
driver_set_velocity = logsout.getElement('driver_set_velocity'); % driver-set velocity
relative_distance = logsout.getElement('relative_distance'); % actual distance
safe_distance = default_spacing + time_gap*ego_velocity.Values.Data; % safe distance
%relative_velocity_world = logsout.getElement('Relative_velocity_world');
%lead_car_velocity = relative_velocity_world.Values.Data + ego_velocity.Values.Data;

tmax = ego_velocity.Values.time(end);
%% Plot the results
figure('position',[100 100 720 600]);
% velocity
subplot(3,1,1);
plot(ego_velocity.Values.time,ego_velocity.Values.Data,'r');grid on;
hold on; 
plot(driver_set_velocity.Values.time,driver_set_velocity.Values.Data,'k--');
hold on;
plot(ego_velocity.Values.time,lead_car_velocity,'b');
xlim([0,tmax]);
legend('ego','set','lead','location','northeast');
title('Velocity')
xlabel('time (sec)')
ylabel('m/s')
% distance
subplot(3,1,2);
plot(relative_distance.Values.time,relative_distance.Values.Data,'r');grid on;
hold on;
plot(relative_distance.Values.time,safe_distance,'b');grid on;
xlim([0,tmax])
legend('actual','safe','location','northeast');
title('Distance between two cars')
xlabel('time (sec)')
ylabel('m')
% acceleration
subplot(3,1,3);
plot(acceleration.Values.time,acceleration.Values.Data,'r');grid on;
xlim([0,tmax])
ylim([-20,20]);
legend('ego','location','northeast');
title('Acceleration')
xlabel('time (sec)')
ylabel('$m/s^2$','Interpreter','latex')
