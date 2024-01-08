function plotMpcSensorAcc(logsout,default_spacing,time_gap)


ec_acc = logsout.getElement('acceleration'); % acceleration of ego car
ec_vel = logsout.getElement('ego_velocity'); % velocity of host car
set_vel = logsout.getElement('driver_set_velocity'); % driver-set velocity
relative_distance = logsout.getElement('relative_distance'); % actual distance
relative_velocity = logsout.getElement('relative_velocity'); % relative velocity
safe_distance = (ec_vel.Values.Data*time_gap) + default_spacing;
lc_vel = relative_velocity.Values.Data + ec_vel.Values.Data; % lead velocity
tmax = ec_vel.Values.time(end);
%% Plot the spacing control results
figure('Name','Spacing Control Performance','position',[100 100 720 600])
% velocity
subplot(3,1,1)
plot(ec_vel.Values.time,ec_vel.Values.Data,'r')
hold on;
plot(set_vel.Values.time,set_vel.Values.Data,'k--')
hold on
plot(ec_vel.Values.time,lc_vel,'b')
hold on
xlim([0,tmax])
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
plot(ec_acc.Values.time,ec_acc.Values.Data,'r')
grid on
xlim([0,tmax])
ylim([-10,10])
legend('ego accleration','location','NorthEast')
title('Acceleration')
xlabel('time (sec)')
ylabel('$m/s^2$','Interpreter','latex')

drawnow