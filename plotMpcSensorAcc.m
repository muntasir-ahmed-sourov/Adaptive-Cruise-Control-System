function plotMpcSensorACC(logsout,time_gap,default_spacing)


ego_acceleration = logsout.getElement('acceleration'); % acceleration of ego car
ego_velocity = logsout.getElement('ego_velocity'); % velocity of host car
driver_set_velocity = logsout.getElement('driver_set_velocity'); % driver-set velocity

relative_distance = logsout.getElement('relative_distance'); % actual distance
relative_velocity = logsout.getElement('relative_velocity'); % relative velocity
safe_distance = (ego_velocity.Values.Data*time_gap) + default_spacing;

lead_velocity = relative_velocity.Values.Data + ego_velocity.Values.Data; % lead velocity


tmax = ego_velocity.Values.time(end);


%% Plot the spacing control results
figure('Name','Plots','position',[100 100 720 600])

% velocity
subplot(3,1,1)
plot(ego_velocity.Values.time,ego_velocity.Values.Data,'r')
hold on;
plot(driver_set_velocity.Values.time,driver_set_velocity.Values.Data,'k--')
hold on
plot(ego_velocity.Values.time,lead_velocity,'b')
hold on
xlim([0,tmax])
ylim([0,35])
grid on
legend('ego velocity','set velocity','lead velocity','location','northeast')
title('Velocity')
xlabel('time (sec)')
ylabel('m/s')

% distance
subplot(3,1,2)
plot(relative_distance.Values.time,relative_distance.Values.Data,'r')
hold on
plot(relative_distance.Values.time,safe_distance,'b')
grid on
xlim([0,tmax])
legend('actual distance','safe distance','location','NorthEast')
title('Distance')
xlabel('time (sec)')
ylabel('m')

% acceleration
subplot(3,1,3)
plot(ego_acceleration.Values.time,ego_acceleration.Values.Data,'r')
grid on
xlim([0,tmax])
ylim([-10,10])
legend('ego acceleration','location','NorthEast')
title('Acceleration')
xlabel('time (sec)')
ylabel('$m/s^2$','Interpreter','latex')

drawnow
