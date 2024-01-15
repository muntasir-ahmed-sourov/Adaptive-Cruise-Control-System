function setUpSuddenStopWorkspaceVars(varargin)

assignin('base','Ts',0.1);              
assignin('base','time_gap',1.5);         
assignin('base','default_spacing',10);   
assignin('base','max_ac',2);             
assignin('base','min_ac',-3);            
assignin('base','max_steer',0.26);       
assignin('base','min_steer',-0.26);     
assignin('base','PredictionHorizon',30);     
rng(0);

[scenario, egoVehicle] = accSuddenStopScenario();
assignin('base','scenario',scenario);
assignin('base','egoID',egoVehicle.ActorID);
assignin('base','h',10);

v0_ego = norm(egoVehicle.Velocity);         % Initial speed of the ego car       (m/s)
x0_ego   = egoVehicle.Position(1);          % Initial x position of ego car      (m)
y0_ego   = egoVehicle.Position(2);          % Initial y position of ego car      (m)
yaw0_ego = deg2rad(egoVehicle.Yaw);         % Initial yaw angle of ego car        (rad)

assignin('base','v0_ego',v0_ego);
assignin('base','x0_ego',x0_ego);
assignin('base','y0_ego',-y0_ego);
assignin('base','yaw0_ego',-yaw0_ego);

v_set = 27;  % set velocity (m/s)
assignin('base','v_set',v_set);

assignin('base','assigThresh',50);   
assignin('base','M',2);               
assignin('base','N',3);               
assignin('base','numCoasts',5);       
assignin('base','numTracks',100);     
assignin('base','numSensors',2);      

assignin('base','posSelector',[1,0,0,0,0,0; 0,0,1,0,0,0]); % Position selector   (N/A)
assignin('base','velSelector',[0,1,0,0,0,0; 0,0,0,1,0,0]); % Velocity selector   (N/A)

assignin('base','m',1575);      % Total mass of vehicle                          (kg)
assignin('base','Iz',2875);     % Yaw moment of inertia of vehicle               (m*N*s^2)
assignin('base','lf',1.2);      % Longitudinal distance from c.g. to front tires (m)
assignin('base','lr',1.6);      % Longitudinal distance from c.g. to rear tires  (m)
assignin('base','Cf',19000);    % Cornering stiffness of front tires             (N/rad)
assignin('base','Cr',33000);    % Cornering stiffness of rear tires              (N/rad)
assignin('base','tau',0.5);     % time constant for longitudinal dynamics        (1/s/(tau*s+1))

modelName = 'Copy_2_of_mpcSensorFusionACCModel';
wasModelLoaded = bdIsLoaded(modelName);
if ~wasModelLoaded
    load_system(modelName)
end

evalin('base','accLaneSensorVars');

blk=find_system(modelName,'System','visionDetectionGenerator');
visionDetectionGenerator.createBus(blk{1});
blk=find_system(modelName,'System','drivingRadarDataGenerator');
drivingRadarDataGenerator.createBus(blk{1});

refModel = 'Copy_of_mpcACCWithSensorFusion';
wasReModelLoaded = bdIsLoaded(refModel);
if ~wasReModelLoaded
    load_system(refModel)
    blk=find_system(refModel,'System','multiObjectTracker');
    multiObjectTracker.createBus(blk{1});
    close_system(refModel)
else
    blk=find_system(refModel,'System','multiObjectTracker');
    multiObjectTracker.createBus(blk{1});
end