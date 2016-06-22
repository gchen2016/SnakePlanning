
g = HebiLookup.newConnectedGroupFromName('SEA-Snake', 'SA013');

gains = g.getGains;
gains.controlStrategy(:) = 3;
gains.positionKp(:) = 5;
gains.positionKi(:) = .002;
gains.positionIClamp(:) = .5;

g.set('gains', gains);


kin = kinMaker('numJoints', n);
baseFrame = [0  0 1 0;
    0 -1 0 0;
    1  0 0 0;
    0 0 0 1;];

kin.setBaseFrame(baseFrame);
fbk = g.getNextFeedback;

goal = kin.getFK('EndEffector', fbk.position);

holdPosition(g, goal, baseFrame, inf, ...
    'numControllableModules', 8,'display','on')


