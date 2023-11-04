function main
    clc;
    clearvars;
    default_safeD = 15;
    model = 'mpcACCsystem';
    simDuration = 50;
    Ts = 0.1;
    timeGap = 1.4;
    lc_pos = 50;
    lc_vel = 25;
    ec_pos = 10;
    ec_vel = 20;
    setVel = 30;
    assignin('base', 'default_safeD', default_safeD);
    assignin('base', 'model', model);
    assignin('base', 'simDuration', simDuration);
    assignin('base', 'timeGap', timeGap);
    assignin('base', 'Ts', Ts);
    assignin('base', 'lc_pos', lc_pos);
    assignin('base', 'lc_vel', lc_vel);
    assignin('base', 'ec_pos', ec_pos);
    assignin('base', 'ec_vel', ec_vel);
    assignin('base', 'setVel', setVel);
    figure = uifigure('Position', [300, 100, 1500, 950]);
    handles.safeDistance = default_safeD;
    handles.velocity = setVel;
    handles.figure = figure;
    handles.vel_plot = axes('Parent', handles.figure, 'Position', [0.4, 0.39, 0.5, 0.25], 'XLim', [0, 100]);
    handles.safeD_plot = axes('Parent', handles.figure, 'Position', [0.4, 0.72, 0.5, 0.25], 'XLim', [0, 100]);
    handles.acc_plot = axes('Parent', handles.figure, 'Position', [0.4, 0.05, 0.5, 0.25], 'XLim', [0, 100]);
    handles.knob_vel = uiknob(handles.figure, 'Position', [100, 700, 100, 100], 'ValueChangedFcn', @(knob_vel, event) changeVel(knob_vel, handles));
    handles.knob_dist = uiknob(handles.figure, 'Position', [300, 700, 100, 100], 'ValueChangedFcn', @(knob_dist, event) changeDist(knob_dist, handles));
    handles.knob_vel.Limits = [0 100]; % For Cruising Speed knob
    handles.knob_vel.Value = handles.velocity;
    handles.knob_dist.Limits = [0 100]; % For Safe Distance knob
    handles.knob_dist.Value = handles.safeDistance;
    handles.speedLabel = uicontrol('Parent', handles.figure,'Style', 'text', 'Position', [100, 600, 100, 100], 'String', 'Set Crusing Speed');
    handles.speedLabel = uicontrol('Parent', handles.figure,'Style', 'text', 'Position', [300, 600, 100, 100], 'String', 'Set Safe Distance');
    set(handles.figure, 'UserData', handles);
    plotGraphs(handles);
end

function changeVel(knob_vel, handles)
    handles = get(handles.figure, 'UserData');
    handles.velocity = knob_vel.Value;
    evalin('base', ['setVel =' num2str(handles.velocity) ';']);
    plotGraphs(handles);
end

function changeDist(knob_dist, handles)
    handles = get(handles.figure, 'UserData');
    handles.safeDistance = knob_dist.Value;
    evalin('base', ['default_safeD =' num2str(handles.safeDistance) ';']);
    plotGraphs(handles);
end

function simulate(velocity, acc_plot, vel_plot, safeD_plot, safeDistance)
    model = evalin('base', 'model');
    %simDuration = evalin('base', 'simDuration');
    %Ts = evalin('base', 'Ts');
    timeGap = evalin('base', 'timeGap');
    %lc_pos = evalin('base', 'lc_pos');
    assignin('base', 'ec_vel', velocity);
    assignin('base', 'default_safeD', safeDistance);
    %ec_vel = evalin('base', 'ec_vel');
    %ec_pos = evalin('base', 'ec_pos');
    setVel = evalin('base', 'setVel');
    sim(model);
    plotACC(logsout, safeDistance, timeGap, setVel, acc_plot, vel_plot, safeD_plot);
end

function plotGraphs(handles)
    cla(handles.acc_plot);
    cla(handles.vel_plot);
    cla(handles.safeD_plot);
    simulate(handles.velocity, handles.acc_plot, handles.vel_plot, handles.safeD_plot, handles.safeDistance);
end


