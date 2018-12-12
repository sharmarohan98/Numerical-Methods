% BISECTION METHOD

f=@(x) x.^2-10;        %Objective function whose roots have to be found
a= 1;              %Lower bound of Search Region
b= 5;               %Upper bound of Search Region
accuracy= 1e-3;     %Accuracy of search
max_iter= 1000;     %Maximum iterations

xlim=[a b];

%Generation of X vector and Y limits
x = linspace(xlim(1),xlim(2),1000);
ylim = [min(f(x)),max(f(x))];
ylim = ylim + 0.1*diff(ylim)*[-1,1];

% Plot function
figure(); axes(); title(func2str(f)); hold on;
plot(x,f(x),'k-','linew',2);
plot(x,0*x,'k--'); plot([0,0],ylim,'k--');
set(gca,'xlim',xlim,'ylim',ylim);
fprintf('Press any key to continue\n'); pause;

%Check if the functional value at end points have different signs
if f(a)*f(b) > 0
    error('Endpoints have the same sign!');
end;

% Plot circle at current interval extents
obj=plot([a,b],[f(a),f(b)],'ko','markerfacecolor','b');
fprintf('Press any key to continue\n'); pause;

for i = 1:max_iter
    % Bisect
    x_half = 0.5*(b+a);
    if f(x_half)*f(a) > 0
        a = x_half;
    elseif f(x_half)*f(b) > 0
        b = x_half;
    end
    
    % Plot new point
    newobj1 = plot(x_half,f(x_half),'ko','markerfacecolor','r');
    newobj2 = plot([x_half,x_half],ylim,'r--');
    fprintf('Press any key to continue\n'); pause;
    
    % Plot new interval
    delete(newobj1); delete(newobj2);
    set(obj,'markerfacecolor','w');
    obj=plot([a,b],[f(a),f(b)],'ko','markerfacecolor','b');
    fprintf('Press any key to continue\n'); pause;
    
    if abs(f(x_half)) < accuracy
        fprintf('Converged!\n');
        fprintf('Value of the root= %f\n',x_half);
        fprintf('Iteration Count= %d\n',i);
        break;
    end
end
