function [] = plotScatter (Xtest, Ytest, w, bias)
  
    Xtest_positive = [];
    Xtest_negative = [];w
    
    % Logic to seperate positive and negative datapoints incase if we plot
    for i = 1 : size(Xtest,1)
        if(Ytest(i) == 1)
            Xtest_positive = [Xtest_positive; Xtest(i,:)];
        else
            Xtest_negative = [Xtest_negative; Xtest(i,:)];
        end
    end
    
    %Logic to plot ######
    
    X_w   = w(1);
    Y_W   = w(2);
      
    figure = 1;
    clf;      
    Xmin = -4;
    Xmax =  10;
    Ymin = -5;
    Ymax =  20;
    
    hAx = subplot( 1, 1, 1 );
    axis('equal');
    set( hAx,                                  ...                      ...
        'NextPlot', 'add',                     ...
        'xgrid',    'on',                      ...
        'ygrid',    'on' );
    
    % plotting the positive words
    plot(Xtest_positive(:,1), Xtest_positive(:,2), 'r.')
    % plotting the negative words
    plot(Xtest_negative(:,1), Xtest_negative(:,2), 'b.')
    
    % This will calculate the start and end point for the hyper plane
    y_start = ( (X_w * Xmin) + bias ) ./ -Y_W;
    y_end = ( (X_w * Xmax) + bias ) ./ -Y_W;
    
    % draws a line from y_start to y_end
    plot( hAx, [Xmin; Xmax], [y_start, y_end], 'k-', 'linewidth', 2 );
 end