function value_res = value_update(policy_m,pe,lamda,value_previous)

% policy_m = init_policy();
% pe = 0.05;
% lamda = 0.9;
% value_previous = zeros(6,6,12);

flag = 1;

value_res = value_previous;
iter = 0;

while (flag)
    
    value_res_temp = zeros(6,6,12);
    
    for x = 0:1:5
        for y = 0:1:5
            for h = 0:1:11
                % state_now = [y,x,h];
                value_iter_temp = 0;
                
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
                    
                    [state_next_loc_temp,state_next_h_temp] = next_state(pe,[y,x],h,policy_m(h+1,(5-y)*6+x+1,:));
                    
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
                
                for i = 1:total_state
                    y_next = state_next(i,1);
                    x_next = state_next(i,2);
                    h_next = state_next(i,3);
                    psa_result = psa(pe,[y,x],[y_next,x_next],h,h_next,policy_m(h+1,(5-y)*6+x+1,3));
%                   value_iter_temp = value_iter_temp + psa_result*(reward_func([y,x])+lamda*value_res(y_next+1,x_next+1,h_next+1));
                    value_iter_temp = psa_result*(lamda*value_res(y_next+1,x_next+1,h_next+1));
                end
                value_iter_temp = value_iter_temp + reward_func([y,x],h);
                value_res_temp(y+1,x+1,h+1) = value_iter_temp;
                
            end
        end
    end
    
    iter = iter +1;
    if isequal(value_res,value_res_temp)|| iter>=3000
        flag = 0;
    else
        value_res = value_res_temp;
    end
    
end



end