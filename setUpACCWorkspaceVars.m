Ts = 0.1;               % Simulation sample time               
[scenario,egoVehicle] = accDrivingScenario;
R           = 760;      % Radius of curvature for the road     
clusterSize = 4;        
assigThresh = 50;       
M           = 2;       
N           = 3;       
numCoasts   = 5;        
numTracks   = 20;      
numSensors  = 2;
posSelector = [1,0,0,0,0,0; 0,0,1,0,0,0];
velSelector = [0,1,0,0,0,0; 0,0,0,1,0,0];
m       = 1575;     
Iz      = 2875;     
lf      = 1.2;     
lr      = 1.6;      
Cf      = 19000;    
Cr      = 33000;    
tau     = 0.5;

v0_ego = norm(egoVehicle.Velocity);         % Initial speed of the ego car       (m/s)
x0_ego   = egoVehicle.Position(1);          % Initial x position of ego car      (m)
y0_ego   = egoVehicle.Position(2);
egoID = egoVehicle.ActorID;
yaw0_ego = deg2rad(egoVehicle.Yaw);
%G = accLinearModel(m,Iz,lf,lr,Cf,Cr,tau,v0_ego);
assignin('base','v0_ego',v0_ego);
assignin('base','x0_ego',x0_ego);
assignin('base','y0_ego',-y0_ego);
assignin('base','yaw0_ego',-yaw0_ego);


v_set           = 30; % set velocity
time_gap        = 1.5; 
default_spacing = 10;    % safe distance
verr_gain       = 0.5;  
xerr_gain       = 0.2;  
vx_gain         = 0.4;  
max_ac          = 3;    
min_ac          = -3; 
assignin('base','max_steer',0.26);
assignin('base','min_steer',-0.26);
assignin('base','PredictionHorizon',30);
driver_P        = 0.2;  
driver_I        = 0.1; 
yawerr_gain     = 2;    
controller_type = 2;    

modelName = 'Copy_2_of_mpcSensorFusionACCModel';
wasModelLoaded = bdIsLoaded(modelName);
if ~wasModelLoaded
    load_system(modelName)
end
%blk=find_system(modelName,'System','driving.scenario.internal.ScenarioReader');
%s = get_param(blk{1},'PortHandles');
%get(s.Outport(1),'SignalHierarchy');

evalin('base','createLaneSensorBuses');

% Create bus for detections 
blk=find_system(modelName,'System','visionDetectionGenerator');
visionDetectionGenerator.createBus(blk{1});
blk=find_system(modelName,'System','drivingRadarDataGenerator');
radarDetectionGenerator.createBus(blk{1});

% Create the bus of tracks 
refModel = 'Copy_of_mpcACCWithSensorFusion';
wasReModelLoaded = bdIsLoaded(refModel);
if ~wasReModelLoaded
    load_system(refModel)
    blk=find_system(refModel,'MatchFilter', @Simulink.match.allVariants,'System','multiObjectTracker');
    multiObjectTracker.createBus(blk{1});
    close_system(refModel)
else
    blk=find_system(refModel,'MatchFilter', @Simulink.match.allVariants,'System','multiObjectTracker');
    multiObjectTracker.createBus(blk{1});
end

