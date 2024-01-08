function [scenario, egoVehicle] = accSuddenStopScenario()
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
    500 -1200 0; 
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
    -500 -900 0;];
speed = 25;
trajectory(egoVehicle, waypoints, speed);

% Add the non-ego actors

leadCar = vehicle(scenario, ...
    'ClassID', 1, ...
    'Position', [-500 -960 0;], ...
    'FrontOverhang', 0.9, ...
    'Mesh', driving.scenario.carMesh, ...
    'Name', 'leadCar');


waypoints = [
   -500 -960 0;
   -500 -940 0;
    -500 -900 0;
    -500 -780 0;
    ];

    
speed = [30;25;15;0;];
trajectory(leadCar, waypoints, speed);



