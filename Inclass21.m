%In class 21

%GB comments
1 100
2 100
overall 100

function inclass21
sim1;
sim2;
end

% 1. Consider the system we discussed in class for a gene which is produced
% and degraded: dx/dt = k - d*x. Now consider that this gene turns on a
% second gene y, which also degrades so that its equation is 
% dy/dt = k2*x - d2*y. Choose some values for k,d,k2, and d2 and run a
% numerical simulation of this system for the case where both genes start
% out off ( x(0) = 0 and y(0) = 0). Plot the value of x and y in time and 
% explain your results. 
function sim1
    k = 1;
    d = 5;
    k2 = 2;
    d2 = 4;
    dt = 0.01;
    interval = [0 10];
    nstep = (interval(2) - interval(1))/dt;
    solx(1) = 0;
    soly(1) = 0;
    for ii = 2:nstep
        solx(ii) = solx(ii-1) + eqnx(solx(ii-1),k,d)*dt;
        soly(ii) = soly(ii-1) + eqny(solx(ii-1),soly(ii-1),k2,d2)*dt;
    end
    tt = linspace(interval(1), interval(2), nstep);
    figure(1)
    plot(tt,solx,'g.-');
    hold on
    plot(tt,soly,'r.-');
end
function dx = eqnx(x,k,d)
    dx = k-d*x;
end
function dy = eqny(x,y,k2,d2)
    dy = k2*x-d2*y;
end
% If we change the ratio of k:d, we find that the asymptotic line changes
% on the graphs. k/d and k2*k/(d2*d) are the horizontal asymptotes for 
% x and y, respectively. The slope of the curve, is determined by d. 
% For x, if d and k both gets larger and under the same ratio (i.e. same
% horizontal asymptote, slope increases faster. In other words, the larger
% k and d are, the faster x approaches the horizontal asymptote. It is the
% same idea for y. With the same horizontal asymptote (i.e. same ratio of 
% k2*k/(d2*d), the higher k2 and d2 are, the faster that y approaches the
% horizontal asymptote (steeper curve)

% 2. Consider the following model: 
% dx/dt = y
% dy/dt = (1-x^2)*y - x
% write code that simulates this system for several different starting
% values of x and y. Plot the results and comment on them.

function sim2
    figure(2)
    dt = 0.01;
    interval = [0 10];
    nstep = (interval(2) - interval(1))/dt;
    for i = 0:5
        solx(1) = i;
        soly(1) = i+2;
        for ii = 2:nstep
            solx(ii) = solx(ii-1) + eqnx2(soly(ii-1))*dt;
            soly(ii) = soly(ii-1) + eqny2(solx(ii-1),soly(ii-1))*dt;
        end
        tt = linspace(interval(1), interval(2), nstep);
        plot(tt,solx,'g.-');
        hold on 
        plot(tt,soly,'r.-');
    end
end
function dx = eqnx2(y)
    dx = y;
end
function dy = eqny2(x,y)
    dy = (1-x^2)*y - x;
end
% With higher starting values, not only do the curves start from higher on 
% y axis, but they also get horizontally stretched. 
