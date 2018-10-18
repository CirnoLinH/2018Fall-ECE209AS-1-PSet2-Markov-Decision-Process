function policy_m_new = policy_update(value_res_pre,pe,action_space)


for x = 0:1:5
    for y = 0:1:5
        for h = 0:1:11
            
            policy_cal_value = zeros(12,1);
            
            for k = 1:1:13
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
                    value_temp(i) = value_res_pre(y_next+1,x_next+1,h_next+1);
                    policy_cal_value(k,i) = psa(pe,[y,x],[y_next,x_next],h,h_next,action_space(k,3)) * value_temp(i);
                end
            end
            
            max_val = max(max(policy_cal_value));
            [row,col] = find(max_val == policy_cal_value);
            policy_m_new(h+1,(5-y)*6+x+1,:) = action_space(row(1,1),:);
            
        end
    end
end

end