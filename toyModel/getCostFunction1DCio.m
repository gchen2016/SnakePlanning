function costFun = getCostFunction1DCio(snake, world, theta);
    goalX = .1;
    
    function cost = costFunction(c)
        state = [theta; 0; 0; c];
        fk = snake.getKin().getFK('EndEffector', [theta, 0]);
        pointErr = fk(1,4) - goalX;
        cPh = costPhysicsStatic(snake, world, state(1:2), state(3:4));
        cCi = .5*costContactInvariance(snake, world, state);
        cObstacle = costObjectViolation(snake, world, state(1:2));
        cTask = pointErr;
        % cost = [cPh; cCi; cObstacle(2)];
        cost = [cPh; cCi; cObstacle(2); cTask];
    end
    
    costFun=@costFunction;
end
