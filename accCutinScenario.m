function [scenario, egoVehicle] = accCutinScenario()
% createDrivingScenario Returns the drivingScenario defined in the Designer

% Generated by MATLAB(R) 9.9 (R2020b) and Automated Driving Toolbox 3.2 (R2020b).
% Generated on: 30-Nov-2020 12:51:49

% Construct a drivingScenario object.
scenario = drivingScenario;
% Add all road segments
roadCenters = [
    -500 -1000 0;
    -500 -900 0;
    -500 -700 0;
    -500 -500 0;
    -476.97 -350  0;
    0 0 0;
    154.508497187474 -24.4717418524232 0;
    293.892626146237 -95.4915028125263 0;
    404.508497187474 -206.107373853763 0;
    475.528258147577 -345.491502812526 0;
    500 -500 0;
  
   
    500 -510 0;  
    500 -550 0;     
    500 -600 0;     
    500 -660 0;     
    500 -710 0; 
    500 -800 0;
    500 -900 0; 
    500 -950 0;
    500 -1000 0;
    750 -1450 0;
    1000 -1200 0;
    ];



laneSpecification = lanespec(3);
road(scenario, roadCenters, 'Lanes', laneSpecification);

% Add the ego vehicle
egoVehicle = vehicle(scenario, ...
    'ClassID', 1, ...
    'FrontOverhang', 0.9, ...
    'Mesh', driving.scenario.carMesh, ...
    'Name', 'egoCar');
waypoints = [ 
    -500 -1000 0;
    -500 -700 0;];
speed = 25;
trajectory(egoVehicle, waypoints, speed);


% Add the non-ego actors

leadCar = vehicle(scenario, ...
    'ClassID', 1, ...
    'Position', [-498 -1000 0;], ...
    'FrontOverhang', 0.9, ...
    'Mesh', driving.scenario.carMesh, ...
    'Name', 'leadCar');


waypoints = [
    -496 -1000 0;
    -496 -900 0;
    -496 -750 0;
    -500 -500 0;
    -476.97 -350  0;
    0 0 0;
    154.508497187474 -24.4717418524232 0;
    293.892626146237 -95.4915028125263 0;
    404.508497187474 -206.107373853763 0;
    475.528258147577 -345.491502812526 0;
    500 -500 0;
  
   
    500 -510 0;  
    500 -550 0;     
    500 -600 0;     
    500 -660 0;     
    500 -710 0; 
    500 -800 0;
    500 -900 0; 
    500 -950 0;
    500 -1000 0;
    750 -1450 0;
    1000 -1200 0;
    ];

    
speed = [30;30;30;25;25;25;25;25;25;20;20;20;25;25;25;25;25;25;25;25;15;0.1;];
trajectory(leadCar, waypoints, speed);






