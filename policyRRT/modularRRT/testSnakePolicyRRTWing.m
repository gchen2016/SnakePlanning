clear all
close all
% [obs, worldMin, worldMax, start, goal] = narrowCorridorWorld();
% [obs, worldMin, worldMax, start, goal] = simpleLocalMin();
numLinks = 11;
numContacts = 16;
minConfig = -1.57*ones(1,numLinks);
maxConfig = 1.57*ones(1,numLinks);
start = [[1,.35,1,-1,0,0,0,0,0,0,0], [zeros(1,6) ones(1,7), zeros(1,3)]];
% goal = [0,.2,.30]';
goal = [-.3,-.2,.4]';

% world = loadWorld('worlds/wing_with_floor.stl');
world = loadWorld('worlds/block.stl');
% world = loadWorld('worlds/flat.stl');
showWorld(world);
scatter3(goal(1), goal(2), goal(3));
policy = SpecifiedContactsPolicy(world, getFodbotJointTypes());
policy.sphereModel.plot(policy.separateState(start));
% stepSize = .01;
maxSteps = 61;
extend = getSnakePolicyExtendFunc(maxSteps);
% sample = getSnakeSampling(20, minConfig, maxConfig);
sample = getSnakeContactSampling(minConfig, maxConfig, numContacts);
goalReached = @policy.reachedGoal;
core = getPolicyRrtCore(extend, sample, goalReached);


% plotWorld(obs, worldMin, worldMax, start, goal);
rng(0) %Seed random number generator
profile on


tree = core(start, goal, policy, 2);
profile viewer

[a, c] = policy.separateState(tree.points(end,:));
path = [a];
pathContact = [c];

parent = tree.parents(end);

while(parent >1)
    [a, c] = policy.separateState(tree.points(parent,:));
    path = [a; path];
    pathContact = [c; pathContact];
    parent = tree.parents(parent);
end

save('pathInWing', 'path')

while(true)
    for i=1:size(path,1)
        policy.sphereModel.plot(path(i,:), pathContact(i,:));
    end
    pause(1);
end

% profile viewer

% plotTree(tree)
% drawnow
% return


% policy = PotentialFieldPolicy();
% policy.setObstacles(obs);

% extend = getPolicyExtendFunc(stepSize, maxSteps);

% policyCore = getPolicyRrtCore(extend, sample);

% % profile on 
% plotWorld(obs, worldMin, worldMax, start, goal)
% rng(0) %Seed random number generator
% plotTree(policyCore(start, goal, policy, 0))

% profile viewer