# Adaptive-Cruise-Control-System

## How to Run the project
Follow the steps to run the project:

### For Straight road
1. Open `Adaptive-Cruise-Control-System` folder in matlab.
2. Double click pfc_subsystem_data.mat to load the pfc data
3. Open `setUpACCWorkspaceVarsNew.m` and hit the *run* button.
4. Open `simACCModelAndPlot.m` and hit *run* button. You will see various plot after this step.

### For Curved road
1. Open `Adaptive-Cruise-Control-System` folder in matlab.
2. Double click pfc_subsystem_data.mat to load the pfc data
3. Open `setUpACCWorkspaceVarsCurved.m` and hit the *run* button.
4. Open `simACCModelAndPlot.m` and hit *run* button. You will see various plot after this step.

### For Cut in on Straight road
1. Open `Adaptive-Cruise-Control-System` folder in matlab.
2. Double click pfc_subsystem_data.mat to load the pfc data
3. Open `setUpCutinWorkspaceVars.m` and hit the *run* button.
4. Open `simACCModelAndPlot.m` and hit *run* button. You will see various plot after this step.

### For Cut Out on Straight road
1. Open `Adaptive-Cruise-Control-System` folder in matlab.
2. Double click pfc_subsystem_data.mat to load the pfc data
3. Open `setUpCutoutWorkspaceVars.m` and hit the *run* button.
4. Open `simACCModelAndPlot.m` and hit *run* button. You will see various plot after this step.

### For Sudden Stop in Curved road
1. Open `Adaptive-Cruise-Control-System` folder in matlab.
2. Double click pfc_subsystem_data.mat to load the pfc data
3. Open `setUpSuddenStopWorkspaceVars.m` and hit the *run* button.
4. Open `simACCModelAndPlot.m` and hit *run* button. You will see various plot after this step.

### For Weather in Curved road
1. Open `Adaptive-Cruise-Control-System` folder in matlab.
2. Double click pfc_subsystem_data.mat to load the pfc data
3. Open `setUpACCWorkspaceVarsCurved.m` and hit the *run* button.
4. Open `accMainSensorFusionModel.slx` and under environment condition, change weather to `rainy` or `snow`
5. Open `simACCModelAndPlot.m` and hit *run* button. You will see various plot after this step.
