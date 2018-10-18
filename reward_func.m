function reward_res = reward_func(state_cur,h)
    if state_cur(1,1)==5 || state_cur(1,1)==0 || state_cur(1,2) ==5 || state_cur(1,2) == 0
        reward_res = -100;
    elseif isequal(state_cur,[4,4]) == 1 || isequal(state_cur,[3,4]) == 1 || isequal(state_cur,[2,4]) == 1 || ...
            isequal(state_cur,[4,2]) == 1 || isequal(state_cur,[3,2]) == 1 || isequal(state_cur,[2,2]) == 1
        reward_res = -10;
    elseif isequal(state_cur,[4,3]) == 1
    % Use the elseif below when constraints in h's direction are applied.
    % elseif isequal(state_cur,[4,3]) == 1 && ( h==5 || h==6 || h==7 )
        reward_res = 1;
    else
        reward_res = 0;
    end
end