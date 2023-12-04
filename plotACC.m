function plotACC(logsout, default_safeD, timeGap, setVel, acc_plot, vel_plot, dist_plot)
    %% Get the data from simulation
    ec_acc = logsout.getElement('ec_acc');             % acceleration of ego car
    ec_vel = logsout.getElement('ec_vel');             % velocity of ego car
    lc_acc = logsout.getElement('lc_acc');           % acceleration of lead car
    lc_vel = logsout.getElement('lc_vel');           % velocity of lead car
    relativeD = logsout.getElement('relativeD');             % actual distance
    safeD = default_safeD + timeGap * ec_vel.Values.Data;  % safe distance required
    axes(acc_plot);
    cla(acc_plot); 
    hold(acc_plot, 'on'); 
    axes(vel_plot);
    cla(vel_plot); 
    hold(vel_plot, 'on');
    axes(dist_plot);
    cla(dist_plot); 
    hold(dist_plot, 'on'); 
    time = ec_vel.Values.time;
    ec_acc_data = ec_acc.Values.Data;
    lc_acc_data = lc_acc.Values.Data;
    ec_vel_data = ec_vel.Values.Data;
    lc_vel_data = lc_vel.Values.Data;
    setVel_data = setVel * ones(size(time));
    relativeD_data = relativeD.Values.Data;
    safeD_data = safeD;
    
    plot(acc_plot, ec_acc.Values.time,ec_acc_data,'r',...
        lc_acc.Values.time, lc_acc_data, 'b','LineWidth',2);
    plot(vel_plot, time, ec_vel_data, '.', 'Color', 'r');
    plot(vel_plot, time, lc_vel_data, '.', 'Color', 'b');
    plot(dist_plot, time, relativeD_data, '.', 'Color', 'r');
    plot(dist_plot, time, safeD_data, '.', 'Color', 'b');  
    grid(acc_plot, 'on');
    ylim(acc_plot, [-3, 2]); % y-axis limit from -10 to 10
    legend(acc_plot, 'ego', 'lead', 'set', 'location', 'SouthEast');
    title(acc_plot, 'Acceleration');
    xlabel(acc_plot, 'time (sec)');
    ylabel(acc_plot, '$m/s^2$', 'Interpreter', 'latex');
    grid(vel_plot, 'on');
    ylim(vel_plot, [15, 35]); % y-axis limit from 0 to 100
    legend(vel_plot, 'ego', 'lead', 'set', 'location', 'SouthEast');
    title(vel_plot, 'Velocity');
    xlabel(vel_plot, 'time (sec)');
    ylabel(vel_plot, '$m/s$', 'Interpreter', 'latex');
    grid(dist_plot, 'on');
    ylim(dist_plot, [35, 65]); % y-axis limit from 0 to 100
    legend(dist_plot, 'ego', 'lead', 'set', 'location', 'SouthEast');
    title(dist_plot, 'Distance');
    xlabel(dist_plot, 'time (sec)');
    ylabel(dist_plot, '$m$', 'Interpreter', 'latex');
end
