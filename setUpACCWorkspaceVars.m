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

v0_ego = 15;  % Initial speed of the ego car           (m/s)
x0_ego = 0;   % Initial x position of ego car          (m)
y0_ego = -R+2.2; % Initial y position of ego car          (m)
egoID = egoVehicle.ActorID;
G = accLinearModel(m,Iz,lf,lr,Cf,Cr,tau,v0_ego);     

v_set           = 21.5; % set velocity
time_gap        = 1.5; 
default_spacing = 10;    % safe distance
verr_gain       = 0.5;  
xerr_gain       = 0.2;  
vx_gain         = 0.4;  
max_ac          = 2;    
min_ac          = -3;   
driver_P        = 0.2;  
driver_I        = 0.1; 
yawerr_gain     = 2;    
controller_type = 2;    

hasMPCLicense = license('checkout','MPC_Toolbox');
if ~hasMPCLicense
   disp('Note: a license to the Model Predictive Control product is required to run the MPC controller variant (controller_type == 2) but no license was not detected.')
end

modelName = 'mpcSensorFusionACCModel';
wasModelLoaded = bdIsLoaded(modelName);
if ~wasModelLoaded
    load_system(modelName)
end
blk=find_system(modelName,'System','driving.scenario.internal.ScenarioReader');
s = get_param(blk{1},'PortHandles');
get(s.Outport(1),'SignalHierarchy');

% Create bus for detections 
blk=find_system(modelName,'System','visionDetectionGenerator');
visionDetectionGenerator.createBus(blk{1});
blk=find_system(modelName,'System','drivingRadarDataGenerator');
radarDetectionGenerator.createBus(blk{1});

% Create the bus of tracks 
refModel = 'mpcACCWithSensorFusion';
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

if ~wasModelLoaded
    close_system(modelName)
end