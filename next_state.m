function [next_state_res,h_2] = next_state(pe,state_cur,h_1,action)

    % If "keep still" action is taken, no state change would happen.
    if action(1,1) == 0 && action(1,2) == 0
        
        next_state_res = state_cur;
        h_2 = h_1;
        action_fin = action;
    else
        
        rand_judge = rand();
        
        % pre-rotation with possibility of pe
        if rand_judge <=pe
            h_temp = h_1 + 1;
            h_temp = h_judge(h_temp);
        elseif rand_judge <=2*pe
            h_temp = h_1 - 1;
            h_temp = h_judge(h_temp);
        else
            % No pre-rotation happens
            h_temp = h_1;
        end
        action_fact = [0,0];
        % To justify if the cardinal direction has been changed due to pre-rotation.
        % If so, the action would be taken in another direction instead.
        if h_1 == 1 && h_temp == 2
            action_fact(1,1) = action(1,2);
        elseif h_1 == 2 && h_temp == 1
            action_fact(1,2) = action(1,1);
        elseif h_1 == 4 && h_temp == 5
            action_fact(1,1) = action(1,2);
        elseif h_1 == 5 && h_temp == 4
            action_fact(1,2) = action(1,1);
        elseif h_1 == 7 && h_temp == 8
            action_fact(1,1) = action(1,2);
        elseif h_1 == 8 && h_temp == 7
            action_fact(1,2) = action(1,1);
        elseif h_1 == 10 && h_temp == 11
            action_fact(1,1) = action(1,2);
        elseif h_1 == 11 && h_temp == 10
            action_fact(1,2) = action(1,1);
        else
            action_fact = action(1,1:2);
        end
        % state change in x and y direction
        next_state_res = state_cur + [action_fact(1,1) action_fact(1,2)];
        
        % Boundary Analysis - The case on the grid edges
        if next_state_res(1,1)>5 || next_state_res(1,1)<0
            next_state_res(1,1) = state_cur(1,1);

        elseif next_state_res(1,2)>5 || next_state_res(1,2)<0
            next_state_res(1,2) = state_cur(1,2);

        end
        
        % state change in h
        h_2 = h_temp + action(1,3);
        h_2 = h_judge(h_2);

    end
end