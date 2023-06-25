strategy_guide = readtable("strategy_guide.xlsx", ReadVariableNames=false);
points = 0;
function guessed_strategy

for i = 1:height(strategy_guide)
    if strcmp(strategy_guide.Var1(i), 'A')
        if strcmp(strategy_guide.Var2(i), 'X')
            points = points + 1 + 3;
        elseif strcmp(strategy_guide.Var2(i), 'Y')
            points = points + 2 + 6;
        else
            points = points + 3 + 0;
        end 
    elseif strcmp(strategy_guide.Var1(i), 'B')
        if strcmp(strategy_guide.Var2(i), 'X')
            points = points + 1 + 0;
        elseif strcmp(strategy_guide.Var2(i), 'Y')
            points = points + 2 + 3;
        else
            points = points + 3 + 6;
        end 
    else
        if strcmp(strategy_guide.Var2(i), 'X')
            points = points + 1 + 6;
        elseif strcmp(strategy_guide.Var2(i), 'Y')
            points = points + 2 + 0;
        else
            points = points + 3 + 3;
        end
    end 
end

disp(points)
end

function right_strategy

for i = 1:height(strategy_guide)
    if strcmp(strategy_guide.Var1(i), 'A')
        if strcmp(strategy_guide.Var2(i), 'X')
            points = points + 3 + 0;
        elseif strcmp(strategy_guide.Var2(i), 'Y')
            points = points + 1 + 3;
        else
            points = points + 2 + 6;
        end 
    elseif strcmp(strategy_guide.Var1(i), 'B')
        if strcmp(strategy_guide.Var2(i), 'X')
            points = points + 1 + 0;
        elseif strcmp(strategy_guide.Var2(i), 'Y')
            points = points + 2 + 3;
        else
            points = points + 3 + 6;
        end 
    else
        if strcmp(strategy_guide.Var2(i), 'X')
            points = points + 2 + 0;
        elseif strcmp(strategy_guide.Var2(i), 'Y')
            points = points + 3 + 3;
        else
            points = points + 1 + 6;
        end
    end 
end

disp(points)
end 