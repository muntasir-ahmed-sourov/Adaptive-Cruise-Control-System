function [scenario, egoVehicle] = accDrivingScenario()

scenario = drivingScenario;

% Add all road segments
roadCenters = [
     -500 -600 0;
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
    -500 -600 0;
    -500 -500 0;];
speed = 20;
trajectory(egoVehicle, waypoints, speed);


% Add the non-ego actors

leadCar = vehicle(scenario, ...
    'ClassID', 1, ...
    'Position', [-500 -960 0], ...
    'FrontOverhang', 0.9, ...
    'Mesh', driving.scenario.carMesh, ...
    'Name', 'leadCar');


waypoints = [

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

    
speed = [10;30;30;30;30;25;25;25;25;25;25;25;25;25;15;15;15;15;0.1;];

trajectory(leadCar, waypoints, speed);

% [10;30;30;30;30;25;25;25;25;25;25;25;25;25;15;15;15;15;0.1;];
% waypoints = [ 
%     -500 -600 0;
%     -500 -500 0;];
% waypoints = [
% 
%     -500 -500 0;
%     -476.97 -350  0;
%     0 0 0;
%     154.508497187474 -24.4717418524232 0;
%     293.892626146237 -95.4915028125263 0;
%     404.508497187474 -206.107373853763 0;
%     475.528258147577 -345.491502812526 0;
%     500 -500 0;
% 
% 
%     500 -510 0;  
%     500 -550 0;     
%     500 -600 0;     
%     500 -660 0;     
%     500 -710 0; 
%     500 -800 0;
%     500 -900 0; 
%     500 -950 0;
%     500 -1000 0;
%     750 -1450 0;
%     1000 -1200 0;
%     ];
% % roadCenters = [
%     -500 -600 0;
%     -500 -500 0;
%     -476.97 -350  0;
%     0 0 0;
%     154.508497187474 -24.4717418524232 0;
%     293.892626146237 -95.4915028125263 0;
%     404.508497187474 -206.107373853763 0;
%     475.528258147577 -345.491502812526 0;
%     500 -500 0;
% 
% 
%     500 -510 0;  
%     500 -550 0;     
%     500 -600 0;     
%     500 -660 0;     
%     500 -710 0; 
%     500 -800 0;
%     500 -900 0; 
%     500 -950 0;
%     500 -1000 0;
%     750 -1450 0;
%     1000 -1200 0;
%     ];
% scenario = drivingScenario('StopTime', 34, ...
%     'SampleTime', 0.1);
% 
% % Add all road segments
% roadCenters = [0 -760 0;
%     3.99933 -759.989 0;
%     7.99855 -759.958 0;
%     11.9975 -759.905 0;
%     15.9962 -759.832 0;
%     19.9944 -759.737 0;
%     23.9921 -759.621 0;
%     27.9891 -759.484 0;
%     31.9853 -759.327 0;
%     35.9807 -759.148 0;
%     39.975 -758.948 0;
%     43.9683 -758.727 0;
%     47.9603 -758.485 0;
%     51.951 -758.222 0;
%     55.9402 -757.938 0;
%     59.9279 -757.634 0;
%     63.914 -757.308 0;
%     67.8983 -756.961 0;
%     71.8807 -756.593 0;
%     75.8611 -756.204 0;
%     79.8394 -755.795 0;
%     83.8155 -755.364 0;
%     87.7892 -754.913 0;
%     91.7606 -754.44 0;
%     95.7294 -753.947 0;
%     99.6955 -753.433 0;
%     103.659 -752.898 0;
%     107.619 -752.342 0;
%     111.577 -751.765 0;
%     115.531 -751.167 0;
%     119.483 -750.549 0;
%     123.431 -749.91 0;
%     127.375 -749.25 0;
%     131.316 -748.569 0;
%     135.253 -747.868 0;
%     139.187 -747.146 0;
%     143.117 -746.403 0;
%     147.043 -745.64 0;
%     150.964 -744.856 0;
%     154.882 -744.051 0;
%     158.795 -743.225 0;
%     162.704 -742.38 0;
%     166.608 -741.513 0;
%     170.508 -740.626 0;
%     174.403 -739.719 0;
%     178.293 -738.791 0;
%     182.179 -737.842 0;
%     186.059 -736.873 0;
%     189.934 -735.884 0;
%     193.804 -734.874 0;
%     197.668 -733.844 0;
%     201.527 -732.794 0;
%     205.38 -731.723 0;
%     209.228 -730.632 0;
%     213.07 -729.521 0;
%     216.906 -728.39 0;
%     220.736 -727.238 0;
%     224.56 -726.067 0;
%     228.377 -724.875 0;
%     232.189 -723.663 0;
%     235.994 -722.431 0;
%     239.792 -721.179 0;
%     243.584 -719.908 0;
%     247.369 -718.616 0;
%     251.147 -717.304 0;
%     254.918 -715.973 0;
%     258.682 -714.621 0;
%     262.439 -713.25 0;
%     266.189 -711.859 0;
%     269.931 -710.449 0;
%     273.666 -709.018 0;
%     277.393 -707.568 0;
%     281.113 -706.099 0;
%     284.825 -704.61 0;
%     288.529 -703.101 0;
%     292.224 -701.573 0;
%     295.912 -700.026 0;
%     299.592 -698.459 0;
%     303.263 -696.873 0;
%     306.926 -695.267 0;
%     310.581 -693.642 0;
%     314.226 -691.998 0;
%     317.864 -690.335 0;
%     321.492 -688.653 0;
%     325.111 -686.952 0;
%     328.722 -685.231 0;
%     332.323 -683.492 0;
%     335.915 -681.734 0;
%     339.498 -679.957 0;
%     343.071 -678.161 0;
%     346.635 -676.346 0;
%     350.19 -674.513 0;
%     353.734 -672.66 0;
%     357.269 -670.79 0;
%     360.794 -668.9 0;
%     364.309 -666.992 0;
%     367.814 -665.066 0;
%     371.309 -663.121 0;
%     374.793 -661.158 0;
%     378.267 -659.177 0;
%     381.73 -657.177 0;
%     385.183 -655.159 0;
%     388.626 -653.123 0;
%     392.057 -651.069 0;
%     395.478 -648.997 0;
%     398.888 -646.907 0;
%     402.286 -644.799 0;
%     405.674 -642.673 0;
%     409.05 -640.529 0;
%     412.415 -638.368 0;
%     415.769 -636.189 0;
%     419.111 -633.992 0;
%     422.441 -631.778 0;
%     425.76 -629.546 0;
%     429.067 -627.297 0;
%     432.362 -625.031 0;
%     435.645 -622.747 0;
%     438.916 -620.446 0;
%     442.175 -618.127 0;
%     445.422 -615.792 0;
%     448.656 -613.439 0;
%     451.878 -611.07 0;
%     455.087 -608.684 0;
%     458.284 -606.28 0;
%     461.468 -603.86 0;
%     464.639 -601.424 0;
%     467.798 -598.97 0;
%     470.943 -596.5 0;
%     474.076 -594.014 0;
%     477.195 -591.511 0;
%     480.301 -588.992 0;
%     483.394 -586.456 0;
%     486.473 -583.904 0;
%     489.539 -581.336 0;
%     492.591 -578.752 0;
%     495.63 -576.152 0;
%     498.655 -573.536 0;
%     501.666 -570.904 0;
%     504.664 -568.256 0;
%     507.647 -565.592 0;
%     510.616 -562.913 0;
%     513.571 -560.218 0;
%     516.512 -557.508 0;
%     519.439 -554.782 0;
%     522.351 -552.041 0;
%     525.249 -549.285 0;
%     528.132 -546.513 0;
%     531.001 -543.726 0;
%     533.855 -540.924 0;
%     536.694 -538.108 0;
%     539.518 -535.276 0;
%     542.327 -532.429 0;
%     545.122 -529.568 0;
%     547.901 -526.692 0;
%     550.665 -523.802 0;
%     553.413 -520.897 0;
%     556.147 -517.977 0;
%     558.865 -515.044 0;
%     561.568 -512.096 0;
%     564.255 -509.133 0;
%     566.926 -506.157 0;
%     569.582 -503.167 0;
%     572.222 -500.162 0;
%     574.846 -497.144 0;
%     577.454 -494.113 0;
%     580.046 -491.067 0;
%     582.622 -488.008 0;
%     585.182 -484.935 0;
%     587.726 -481.849 0;
%     590.253 -478.75 0;
%     592.764 -475.637 0;
%     595.259 -472.511 0;
%     597.737 -469.372 0;
%     600.199 -466.22 0;
%     602.644 -463.055 0;
%     605.072 -459.878 0;
%     607.484 -456.687 0;
%     609.879 -453.484 0;
%     612.257 -450.268 0;
%     614.618 -447.04 0;
%     616.962 -443.8 0;
%     619.289 -440.547 0;
%     621.598 -437.282 0;
%     623.891 -434.005 0;
%     626.166 -430.716 0;
%     628.424 -427.415 0;
%     630.664 -424.102 0;
%     632.887 -420.777 0;
%     635.093 -417.441 0;
%     637.281 -414.093 0;
%     639.451 -410.734 0;
%     641.603 -407.363 0;
%     643.738 -403.981 0;
%     645.855 -400.588 0;
%     647.954 -397.184 0;
%     650.035 -393.769 0;
%     652.099 -390.343 0;
%     654.144 -386.906 0;
%     656.171 -383.458 0;
%     658.179 -380 0];
% roadWidth = 7.2;
% road(scenario, roadCenters, roadWidth, 'Name', 'Road');
% 
% % Add the ego vehicle
% egoVehicle = vehicle(scenario, ...
%     'ClassID', 1, ...
%     'Mesh', driving.scenario.carMesh);
% 
% % Add the non-ego actors
% lead_car = vehicle(scenario, ...
%     'ClassID', 1, ...
%     'Mesh', driving.scenario.carMesh);
% 
% speed = [2;3;4;5;6;7;8;9;10;11;12;13;14;15;16;17;18;
%     19;20;21;22;23;24;25;25;25;25;25;25;25;25;25;25;25;
%     25;25;25;25;25;25;25;25;25;25;25;25;25;25;25;25;25;
%     25;25;25;25;25;25;25;25;25;25;25;25;25;25;25;25;25;
%     24;23;22;21;20;20;20;20;20;20;20;20;20;20;20;20;20;
%     20;20;20;20;20;20;20;20;20;20;20;20;20;20;20;20;20;
%     20;20;20;20;20;20;20;20;20;20;20;20;20;20;20;20;20;
%     20;20;20;20;20;20;20;20;20;20;20;20;20;20;20;20;20;
%     21;22;23;24;25;25;25;25;25;25;25;25;25;25;25;25;25;
%     25;25;25;25;25;25;25;
%     25;25;25;25;25;25;25;25;25;25;24;23;22;21;20;19;18;
%     17;16;15;14;13;12;11;10;9;8;7;6;5;4;3;2;1];
% 
% trajectory(lead_car, roadCenters(round(0.035*200):end,:) +[0,2,0], speed);
% 
%  % 2;25;25;25;25;25;25;25;25;25;25;25;25;25;25;25;25;
%  %    25;25;25;25;25;25;25;25;25;25;25;25;25;25;25;25;25;
%  %    25;25;25;25;25;25;25;25;25;25;25;25;25;25;25;25;25;
%  %    25;25;25;25;25;25;25;25;25;25;25;25;25;25;25;25;25;
%  %    25;25;25;25;25;25;25;25;25;25;25;25;25;25;25;25;25;
%  %    20;20;20;20;20;20;20;20;20;20;20;20;20;20;20;20;20;
%  %    20;20;20;20;20;20;20;20;20;20;20;20;20;20;20;20;20;
%  %    20;20;20;20;20;20;20;20;20;20;20;20;20;20;20;20;20;
%  %    25;25;25;25;25;25;25;25;25;25;25;25;25;25;25;25;25;
%  %    25;25;25;25;25;25;25;
%  %    25;25;25;25;25;25;25;25;25;25;25;25;25;25;25;25;25;
%  %    25;25;25;25;25;25;25;25;25;25;25;25;25;25;25;25;2
% % waypoints = [115.53142278746 -749.167418322111 0;
% %     119.482672655111 -748.549059645798 0;
% %     123.430613840908 -747.909916967936 0;
% %     127.375137019533 -747.250007987491 0;
% %     131.316132960316 -746.569350978484 0;
% %     135.253492530264 -745.867964789485 0;
% %     139.18710669708 -745.14586884309 0;
% %     143.116866532186 -744.403083135385 0;
% %     147.042663213734 -743.639628235391 0;
% %     150.964388029625 -742.855525284495 0;
% %     154.881932380516 -742.050795995863 0;
% %     158.795187782828 -741.225462653841 0;
% %     162.704045871751 -740.379548113337 0;
% %     166.608398404245 -739.513075799188 0;
% %     170.508137262035 -738.62606970551 0;
% %     174.403154454608 -737.718554395036 0;
% %     178.2933421222 -736.790554998435 0;
% %     182.178592538788 -735.842097213615 0;
% %     186.058798115067 -734.873207305013 0;
% %     189.933851401434 -733.883912102865 0;
% %     193.803645090963 -732.874239002468 0;
% %     197.668072022371 -731.844215963415 0;
% %     201.527025182996 -730.793871508825 0;
% %     205.380397711748 -729.723234724554 0;
% %     209.228082902079 -728.632335258385 0;
% %     213.069974204931 -727.521203319211 0;
% %     216.905965231689 -726.389869676198 0;
% %     220.735949757127 -725.238365657931 0;
% %     224.559821722349 -724.066723151548 0;
% %     228.377475237728 -722.874974601856 0;
% %     232.188804585835 -721.663153010433 0;
% %     235.993704224368 -720.431291934715 0;
% %     239.792068789076 -719.179425487066 0;
% %     243.583793096675 -717.907588333833 0;
% %     247.368772147761 -716.615815694387 0;
% %     251.146901129717 -715.304143340146 0;
% %     254.918075419618 -713.972607593585 0;
% %     258.682190587126 -712.621245327233 0;
% %     262.439142397381 -711.250093962649 0;
% %     266.188826813889 -709.859191469384 0;
% %     269.931140001406 -708.448576363935 0;
% %     273.665978328804 -707.018287708673 0;
% %     277.393238371953 -705.568365110765 0;
% %     281.112816916576 -704.098848721075 0;
% %     284.824610961108 -702.609779233054 0;
% %     288.528517719553 -701.101197881612 0;
% %     292.224434624328 -699.573146441974 0;
% %     295.912259329101 -698.025667228529 0;
% %     299.591889711628 -696.458803093651 0;
% %     303.263223876579 -694.87259742652 0;
% %     306.926160158362 -693.267094151912 0;
% %     310.580597123936 -691.642337728991 0;
% %     314.226433575622 -689.998373150071 0;
% %     317.863568553901 -688.335245939376 0;
% %     321.491901340217 -686.653002151774 0;
% %     325.111331459759 -684.951688371506 0;
% %     328.721758684247 -683.231351710891 0;
% %     332.323083034708 -681.492039809029 0;
% %     335.91520478424 -679.733800830472 0;
% %     339.498024460781 -677.956683463901 0;
% %     343.071442849857 -676.160736920767 0;
% %     346.635360997332 -674.346010933937 0;
% %     350.18968021215 -672.512555756312 0;
% %     353.734302069063 -670.660422159438 0;
% %     357.269128411362 -668.789661432096 0;
% %     360.794061353593 -666.900325378886 0;
% %     364.309003284265 -664.992466318792 0;
% %     367.813856868557 -663.066137083731 0;
% %     371.308525051013 -661.121391017091 0;
% %     374.792911058225 -659.158281972253 0;
% %     378.266918401519 -657.176864311103 0;
% %     381.730450879624 -655.177192902523 0;
% %     385.183412581334 -653.159323120871 0;
% %     388.625707888168 -651.123310844453 0;
% %     392.057241477016 -649.06921245397 0;
% %     395.477918322778 -646.997084830958 0;
% %     398.887643700996 -644.906985356216 0;
% %     402.286323190476 -642.798971908212 0;
% %     405.673862675907 -640.673102861486 0;
% %     409.050168350459 -638.529437085026 0;
% %     412.415146718391 -636.368033940648 0;
% %     415.768704597631 -634.188953281341 0;
% %     419.110749122362 -631.992255449617 0;
% %     422.44118774559 -629.77800127584 0;
% %     425.75992824171 -627.546252076537 0;
% %     429.066878709058 -625.297069652702 0;
% %     432.361947572456 -623.030516288087 0;
% %     435.645043585748 -620.746654747476 0;
% %     438.916075834327 -618.445548274943 0;
% %     442.174953737654 -616.127260592108 0;
% %     445.421587051763 -613.791855896364 0;
% %     448.655885871761 -611.439398859109 0;
% %     451.877760634322 -609.069954623945 0;
% %     455.087122120161 -606.683588804881 0;
% %     458.283881456507 -604.280367484515 0;
% %     461.467950119566 -601.8603572122 0;
% %     464.639239936969 -599.423625002208 0;
% %     467.797663090216 -596.970238331866 0;
% %     470.943132117109 -594.500265139696 0;
% %     474.075559914168 -592.013773823527 0;
% %     477.194859739052 -589.510833238603 0;
% %     480.300945212953 -586.991512695678 0;
% %     483.393730322993 -584.455881959097 0;
% %     486.473129424601 -581.904011244858 0;
% %     489.539057243893 -579.335971218675 0;
% %     492.591428880023 -576.751832994019 0;
% %     495.630159807542 -574.151668130147 0;
% %     498.655165878735 -571.535548630119 0;
% %     501.666363325952 -568.90354693881 0;
% %     504.663668763928 -566.255735940899 0;
% %     507.646999192091 -563.592188958851 0;
% %     510.616271996862 -560.91297975089 0;
% %     513.571404953943 -558.218182508952 0;
% %     516.512316230589 -555.507871856633 0;
% %     519.438924387882 -552.782122847123 0;
% %     522.35114838298 -550.041010961126 0;
% %     525.248907571364 -547.284612104771 0;
% %     528.13212170907 -544.51300260751 0;
% %     531.000710954913 -541.726259220002 0;
% %     533.854595872694 -538.924459111993 0;
% %     536.693697433405 -536.107679870173 0;
% %     539.517937017413 -533.275999496031 0;
% %     542.327236416639 -530.429496403694 0;
% %     545.121517836725 -527.568249417755 0;
% %     547.900703899184 -524.692337771092 0;
% %     550.664717643549 -521.801841102673 0;
% %     553.413482529498 -518.89683945535 0;
% %     556.146922438978 -515.977413273642 0;
% %     558.86496167831 -513.043643401509 0;
% %     561.567524980286 -510.095611080114 0;
% %     564.254537506255 -507.13339794557 0;
% %     566.925924848192 -504.157086026682 0;
% %     569.581613030762 -501.166757742674 0;
% %     572.221528513367 -498.162495900909 0;
% %     574.845598192179 -495.144383694592 0;
% %     577.453749402172 -492.112504700472 0;
% %     580.045909919128 -489.066942876519 0;
% %     582.622007961639 -486.00778255961 0;
% %     585.181972193094 -482.935108463184 0;
% %     587.725731723658 -479.849005674901 0;
% %     590.253216112228 -476.749559654285 0;
% %     592.76435536839 -473.636856230356 0;
% %     595.259079954357 -470.510981599256 0;
% %     597.737320786888 -467.37202232186 0;
% %     600.19900923921 -464.220065321379 0;
% %     602.644077142912 -461.055197880953 0;
% %     605.072456789834 -457.877507641236 0;
% %     607.484080933944 -454.687082597966 0;
% %     609.878882793199 -451.484011099531 0;
% %     612.256796051394 -448.26838184452 0;
% %     614.617754859997 -445.040283879269 0;
% %     616.961693839976 -441.799806595393 0;
% %     619.288548083606 -438.547039727313 0;
% %     621.59825315627 -435.28207334977 0;
% %     623.890745098239 -432.004997875328 0;
% %     626.165960426447 -428.715904051876 0;
% %     628.423836136246 -425.414882960111 0;
% %     630.664309703152 -422.102026011015 0;
% %     632.887319084577 -418.777424943326 0;
% %     635.092802721548 -415.441171821 0;
% %     637.280699540407 -412.093359030654 0;
% %     639.450948954508 -408.734079279014 0;
% %     641.603490865891 -405.363425590348 0;
% %     643.738265666947 -401.981491303885 0;
% %     645.855214242071 -398.588370071235 0;
% %     647.954277969294 -395.184155853793 0;
% %     650.035398721913 -391.768942920139 0;
% %     652.098518870093 -388.342825843425 0;
% %     654.143581282471 -384.905899498759 0;
% %     656.17052932773 -381.458259060575 0;
% %     658.179306876173 -378 0];
% % speed = [8;8;8;8;8;8;8;8;8;8;8;8;8;8;8;8;8;
% %     8;8;8;8;8;8;8;8;8;8;8;8;8;8;8;8;8;
% %     8;8;8;8;8;8;8;8;8;8;8;8;8;8;8;8;8;
% %     15;15;15;15;15;15;15;15;15;15;15;15;15;15;15;15;15;
% %     15;15;15;15;15;15;15;15;15;15;15;15;15;15;15;15;15;
% %     12;12;12;12;12;12;12;12;12;12;12;12;12;12;12;12;12;
% %     5;5;5;5;5;5;5;5;5;5;5;5;5;5;5;5;5;
% %     15;15;15;15;15;15;15;15;15;15;15;15;15;15;15;15;15;
% %     15;15;15;15;15;15;15;15;15;15;15;15;15;15;15;15;15;
% %     8;8;8;8;8;8;8;8;8;8;8;8;8;8;8;8;8;8];
% % 20.53142278746 -773.167418322111 0;
% %     24.53142278746 -772.167418322111 0;
% %     26.53142278746 -771.167418322111 0;
% %     30.53142278746 -770.167418322111 0;
% %     34.53142278746 -769.167418322111 0;
% %     38.53142278746 -768.167418322111 0;
% %     42.53142278746 -767.167418322111 0;
% %     46.53142278746 -766.167418322111 0;
% %     50.53142278746 -765.167418322111 0;
% %     54.53142278746 -764.167418322111 0;
% %     58.53142278746 -763.167418322111 0;
% %     62.53142278746 -762.167418322111 0;
% %     66.53142278746 -761.167418322111 0;
% %     71.53142278746 -760.167418322111 0;
% %     75.53142278746 -759.167418322111 0;
% %     79.53142278746 -758.167418322111 0;
% %     83.53142278746 -757.167418322111 0;
% %     87.53142278746 -756.167418322111 0;
% %     91.53142278746 -755.167418322111 0;
% %     95.53142278746 -754.167418322111 0;
% %     99.53142278746 -753.167418322111 0;
% %     103.53142278746 -752.167418322111 0;
% %     107.53142278746 -751.167418322111 0;
% %     111.53142278746 -750.167418322111 0;
% %     115.53142278746 -749.167418322111 0;
% %     119.482672655111 -748.549059645798 0;
% %     166.608398404245 -739.513075799188 0;
% %     201.527025182996 -730.793871508825 0;
% %     258.682190587126 -712.621245327233 0;
% %     295.912259329101 -698.025667228529 0;
% %     350.18968021215 -672.512555756312 0;
% %     398.887643700996 -644.906985356216 0;
% %     451.877760634322 -609.069954623945 0;
% %     495.630159807542 -574.151668130147 0;
% %     550.664717643549 -521.801841102673 0;
% %     600.19900923921 -464.220065321379 0;
% %     658.179306876173 -378 0
% 
% % 115.53142278746 -749.167418322111 0;
% %     147.042663213734 -743.639628235391 0;
% %     178.2933421222 -736.790554998435 0;
% %     216.905965231689 -726.389869676198 0;
% %     254.918075419618 -713.972607593585 0;
% %     325.111331459759 -684.951688371506 0;
% %     357.269128411362 -668.789661432096 0;
% %     392.057241477016 -649.06921245397 0;
% %     415.768704597631 -634.188953281341 0;
% %     501.666363325952 -568.90354693881 0;
% %     628.423836136246 -425.414882960111 0;
% %     658.179306876173 -378 0];
% % 
% % 
