function [value_res,policy_optimal] = value_update_2(pe,lamda,action_space)

% pe = 0;
% lamda = 0.9;
% action_space = [[1,0,0];[1,0,1];[1,0,-1];...
%                 [-1,0,0];[-1,0,1];[-1,0,-1];
%                 [0,1,0];[0,1,1];[0,1,-1];
%                 [0,-1,0];[0,-1,1];[0,-1,-1];
%                 [0,0,0]];


flag = 1;
iter = 0;
val_res_temp = zeros(6,6,12);
value_res = ones(6,6,12);
while (flag)

    for x = 0:1:5
        for y = 0:1:5
            for h = 0:1:11
                policy_cal_value = zeros(12,1);
                
                % We decide to give up "no motion" here - this action would not
                % result in better value.
                for k = 1:1:12
                    % state_now = [y,x,h];
                    
                    % Extract all possible states corresponding to each state with each action.
                    state_complete = 0;
                    state_next = zeros(1,3);
                    % (This temp2 var only for first input in state set.)
                    state_next_temp2 = [-1,-1,-10];
                    total_state = 1;
                    if isequal([4,3],[y,x])
                    state_next = [4,3,h];
                    else
                    while(~state_complete)
                        
                        [state_next_loc_temp,state_next_h_temp] = next_state(pe,[y,x],h,action_space(k,:));
                        
                        state_next_temp(1,1) = state_next_loc_temp(1,1);
                        state_next_temp(1,2) = state_next_loc_temp(1,2);
                        state_next_temp(1,3) = state_next_h_temp;
                        % When pe = 0, the next state could be confirmed.
                        if(pe == 0)
                            state_next = state_next_temp;
                            state_complete = 1;
                            
                        elseif isequal(state_next_temp2,state_next_temp)== 0
                            
                            if total_state ==1
                                state_next(total_state,:) = state_next_temp;
                                state_next_temp2 = state_next_temp;
                                total_state = total_state + 1;
                            elseif total_state ==2
                                state_next(total_state,:) = state_next_temp;
                                state_next_temp3 = state_next_temp;
                                total_state = total_state + 1;
                            elseif total_state == 3
                                if isequal(state_next_temp3,state_next_temp)== 0
                                    state_next(total_state,:) = state_next_temp;
                                    state_complete = 1;
                                end
                            end
                        end
                    end
                    end
                    for i = 1:1:total_state
                        y_next = state_next(i,1);
                        x_next = state_next(i,2);
                        h_next = state_next(i,3);
                        value_temp(i) = val_res_temp(y_next+1,x_next+1,h_next+1);
                        policy_cal_value(k,i) = lamda*psa(pe,[y,x],[y_next,x_next],h,h_next,action_space(k,3)) * value_temp(i);
                    end
                end
                
                max_val = max(max(policy_cal_value));
                [row,col] = find(max_val == policy_cal_value);
                policy_temp(h+1,(5-y)*6+x+1,:) = action_space(row(1,1),:);
                val_res_temp(y+1,x+1,h+1) = reward_func([y,x],h) + max_val;
                
            end
        end
    end
    
    iter = iter +1;
    if isequal(value_res,val_res_temp) || iter>=2500
        policy_optimal = policy_temp;
        flag = 0;
    else
        value_res = val_res_temp;
    end
    
end



end