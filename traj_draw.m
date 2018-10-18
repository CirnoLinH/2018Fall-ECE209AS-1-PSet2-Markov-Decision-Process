function [state_plotted,h_set] = traj_draw(state_init,h0,policy_m,pe)

% 
    state_cur = state_init;
    h1 = h0;
    
    
%     state_cur = [4,3];
%     h1 = 6;
%     policy_m = policy_m_new;
%     pe = 0;
    
    flag = 1;
    i = 1;
    state_set(1,:,:) = state_cur;
    h_set(1) = 6;
    while(flag)
        i = i+1;
        [state_later,h2] = next_state(pe,state_cur,h1,policy_m(h1+1,(5-state_cur(1,1))*6+state_cur(1,2)+1,:));
        state_set(i,:,:) = state_later;
        h_set(i) = h2;
        if isequal(state_cur,[4,3])
            state_plotted = zeros(i,2);
            for j = 1:1:i-1
                a = state_set(j,:,:);
                state_plotted(j,1) = a(1,1);
                state_plotted(j,2) = a(1,2);
            end
            state_plotted(i,:) = [];
            h_set(i) = [];
            figure(1)
            plot(state_plotted(:,2),state_plotted(:,1));
            xlim([0,5]);
            ylim([0,5]);
            flag = 0;
        end
        state_cur = state_later;
        h1 = h2;
    end
end