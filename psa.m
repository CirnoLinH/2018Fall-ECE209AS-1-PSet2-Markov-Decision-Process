function psa_result = psa(pe,state_pre,state_cur,h_1,h_2,action_2)
    if norm(state_pre-state_cur,2)>1
        psa_result = 0;
    elseif isequal(state_pre,state_cur) ==1 && h_1 == h_2 && abs(action_2) == 0
        psa_result = 1;
    elseif isequal(state_pre,state_cur) ==1 && h_1 == h_2 && abs(action_2) == 1
        psa_result = pe;
    elseif isequal(state_pre,state_cur) ==1 && abs(h_1 - h_2) == 1 && abs(action_2) == 1
        psa_result = 1-2*pe;
    elseif isequal(state_pre,state_cur) ==1 && abs(h_1 - h_2) == 1 && abs(action_2) == 0
        psa_result = pe;
    elseif abs(h_1-h_2)==2
        psa_result = pe;
    elseif abs(h_1-h_2)==1 && abs(action_2) == 1
        psa_result = 1 - 2*pe;
    elseif abs(h_2-h_1)==1 && action_2 == 0
        psa_result = pe;
    elseif abs(h_2-h_1)==0 && abs(action_2) == 1
        psa_result = pe;
    else
        psa_result = 0;
    end
end