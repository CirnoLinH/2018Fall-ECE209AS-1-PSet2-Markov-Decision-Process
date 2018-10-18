
function policy_init_m = init_policy(~)


h = zeros(12,36,3);

% h = 0 okay
for x = 1:6
    for y = 1:6
        locjudge = (x-1)*6 + y;
        if locjudge == 4
            h(1,locjudge,:) = [-1,0,0];
        elseif locjudge == 16||locjudge == 22||locjudge == 28||locjudge == 34
            h(1,locjudge,:) = [1,0,0];
        elseif locjudge == 1||locjudge == 2||locjudge == 3||locjudge == 5||locjudge == 6
            h(1,locjudge,:) = [-1,0,1];
        else
            h(1,locjudge,:) = [1,0,1];
        end
    end
end

% h = 1 okay
for x = 1:6
    for y = 1:6
        locjudge = (x-1)*6 + y;
        if locjudge == 4
            h(2,locjudge,:) = [-1,0,0];
        elseif locjudge == 13||locjudge == 14||locjudge == 15||locjudge == 17||locjudge == 18
            h(2,locjudge,:) = [1,0,1];
        elseif locjudge == 1||locjudge == 2||locjudge == 3||locjudge == 5||locjudge == 6
            h(2,locjudge,:) = [-1,0,1];
        else
            h(2,locjudge,:) = [1,0,0];
        end
    end
end

% h = 2 okay
for x = 1:6
    for y = 1:6
        locjudge = (x-1)*6 + y;
        if locjudge == 11||mod(locjudge,6)==0
            h(3,locjudge,:) = [0,-1,0];
        elseif locjudge == 3||locjudge == 15||locjudge == 21||locjudge == 27||locjudge == 33
            h(3,locjudge,:) = [0,1,-1];
        elseif locjudge == 5||locjudge == 17||locjudge == 23||locjudge == 29||locjudge == 35
            h(3,locjudge,:) = [0,-1,-1];
        else
            h(3,locjudge,:) = [0,1,0];
        end
    end
end

% h = 3 okay
for x = 1:6
    for y = 1:6
        locjudge = (x-1)*6 + y;
        if locjudge == 11||locjudge == 12
            h(4,locjudge,:) = [0,-1,0];
        elseif mod(locjudge,6)==5 || mod(locjudge,6)==0
            h(4,locjudge,:) = [0,-1,1];
        elseif locjudge == 7 || locjudge ==8 || locjudge==9
            h(4,locjudge,:) = [0,1,0];
        else
            h(4,locjudge,:) = [0,1,1];
        end
    end
end

% h = 4 okay
for x = 1:6
    for y = 1:6
        locjudge = (x-1)*6 + y;
        if locjudge == 11||mod(locjudge,6)==0
            h(5,locjudge,:) = [0,-1,0];
        elseif mod(locjudge,6)==5
            h(5,locjudge,:) = [0,-1,1];
        elseif locjudge == 3 || locjudge ==15 || locjudge==21 || locjudge==27 || locjudge == 33
            h(5,locjudge,:) = [0,1,1];
        else
            h(5,locjudge,:) = [0,1,0];
        end
    end
end

% h = 5 okay
for x = 1:6
    for y = 1:6
        locjudge = (x-1)*6 + y;
        if locjudge == 4 || locjudge == 7 || locjudge == 8 || locjudge==9 || locjudge==11 || locjudge==12
            h(6,locjudge,:) = [-1,0,0];
        elseif locjudge == 1 || locjudge == 2 || locjudge == 3 || locjudge==5 || locjudge==6
            h(6,locjudge,:) = [-1,0,-1];
        elseif locjudge == 13 || locjudge ==14 || locjudge==15 || locjudge==17 || locjudge == 18
            h(6,locjudge,:) = [1,0,-1];
        else
            h(6,locjudge,:) = [1,0,0];
        end
    end
end

% h = 6 okay
for x = 1:6
    for y = 1:6
        locjudge = (x-1)*6 + y;
        if locjudge == 4
            h(7,locjudge,:) = [-1,0,0];
        elseif locjudge == 1 || locjudge == 2 || locjudge == 3 || locjudge==5 || locjudge==6 || ...
                locjudge == 7 || locjudge ==8 || locjudge ==9 ||locjudge ==11 ||locjudge == 12
            h(7,locjudge,:) = [-1,0,-1];
        elseif locjudge == 16 || locjudge ==22 || locjudge==28 || locjudge==34
            h(7,locjudge,:) = [1,0,0];
        else
            h(7,locjudge,:) = [1,0,-1];
        end
    end
end

% h = 7 okay
for x = 1:6
    for y = 1:6
        locjudge = (x-1)*6 + y;
        if locjudge == 4 || locjudge == 7 || locjudge == 8 || locjudge==9 || locjudge==11 || locjudge==12
            h(8,locjudge,:) = [-1,0,0];
        elseif locjudge == 13||locjudge == 14||locjudge == 15||locjudge == 17||locjudge == 18
            h(8,locjudge,:) = [-1,0,1];
        elseif locjudge == 1||locjudge == 2||locjudge == 3||locjudge == 5||locjudge == 6
            h(8,locjudge,:) = [1,0,1];
        else
            h(8,locjudge,:) = [1,0,0];
        end
    end
end

% h = 8 okay
for x = 1:6
    for y = 1:6
        locjudge = (x-1)*6 + y;
        if locjudge == 11||mod(locjudge,6)==0||mod(locjudge,6)==4
            h(9,locjudge,:) = [0,-1,0];
        elseif locjudge == 3||locjudge == 15||locjudge == 21||locjudge == 27||locjudge == 33
            h(9,locjudge,:) = [0,1,-1];
        elseif locjudge == 5||locjudge == 17||locjudge == 23||locjudge == 29||locjudge == 35
            h(9,locjudge,:) = [0,-1,-1];
        else
            h(9,locjudge,:) = [0,1,0];
        end
    end
end

% h = 9 okay
for x = 1:6
    for y = 1:6
        locjudge = (x-1)*6 + y;
        if locjudge == 11||locjudge == 12
            h(10,locjudge,:) = [0,-1,0];
        elseif mod(locjudge,6)==5 || mod(locjudge,6)==0 ||mod(locjudge,6)==4
            h(10,locjudge,:) = [0,-1,-1];
        elseif locjudge == 7 || locjudge ==8 || locjudge==9
            h(10,locjudge,:) = [0,1,0];
        else
            h(10,locjudge,:) = [0,1,-1];
        end
    end
end

% h = 10 okay
for x = 1:6
    for y = 1:6
        locjudge = (x-1)*6 + y;
        if locjudge == 11||mod(locjudge,6)==0||mod(locjudge,6)==4
            h(11,locjudge,:) = [0,-1,0];
        elseif locjudge == 3||locjudge == 15||locjudge == 21||locjudge == 27||locjudge == 33
            h(11,locjudge,:) = [0,1,1];
        elseif locjudge == 5||locjudge == 17||locjudge == 23||locjudge == 29||locjudge == 35
            h(11,locjudge,:) = [0,-1,1];
        else
            h(11,locjudge,:) = [0,1,0];
        end
    end
end

% h = 11
for x = 1:6
    for y = 1:6
        locjudge = (x-1)*6 + y;
        if locjudge == 4
            h(12,locjudge,:) = [-1,0,0];
        elseif locjudge == 13||locjudge == 14||locjudge == 15||locjudge == 17||locjudge == 18
            h(12,locjudge,:) = [1,0,-1];
        elseif locjudge == 1||locjudge == 2||locjudge == 3||locjudge == 5||locjudge == 6
            h(12,locjudge,:) = [-1,0,-1];
        else
            h(12,locjudge,:) = [1,0,0];
        end
    end
end

% No action taken at goal
for num = 1:12
    h(num,10,:) = [0,0,0];
end

policy_init_m = h;

end