function plotSnakeMonsterTest
    close all
    plt = SnakeMonsterPlotter();
    angles=[.1 -.3 1, 0 -.3 1, -.1 -.3 1, .1 .3 -1, 0 .3 -1, -.1 .3 ...
            -1];
    a = angles;
    t = 0;
    while true
        t = t + 0.1;
        a([2,8,11,17]) = angles([2,8,11,17]) + sin(t)*.3;
        a([5,14]) = angles([5,14]) - sin(t)*.3;
        plt.plot(a);
    end    
    
end
