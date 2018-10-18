%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%  ECE 209AS-1 Problem Set 2
%  Hanren Lin
%  Chungyu Chen
%  University of California, Los Angeles

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% Notes:
%%% (1) Please comment one of Part 3/Part 4 when executing this code.
%%% (2) It's HIGHLY recommended to use Part 4 when using pe with a non-zero value.

clear;
clc;

% Size of state space: 36
% If h is taken into consideration, the size would be 6x6x12 = 432.
state_space = [[5,0];[5,1];[5,2];[5,3];[5,4];[5,5];...
               [4,0];[4,1];[4,2];[4,3];[4,4];[4,5];...
               [3,0];[3,1];[3,2];[3,3];[3,4];[3,5];...
               [2,0];[2,1];[2,2];[2,3];[2,4];[2,5];...
               [1,0];[1,1];[1,2];[1,3];[1,4];[1,5];...
               [0,0];[0,1];[0,2];[0,3];[0,4];[0,5]];


% Action
% Size of action space: 13
action_space = [[1,0,0];[1,0,1];[1,0,-1];...
                [-1,0,0];[-1,0,1];[-1,0,-1];
                [0,1,0];[0,1,1];[0,1,-1];
                [0,-1,0];[0,-1,1];[0,-1,-1];
                [0,0,0]];

% Initial Setup

value_init = zeros(6,6,12);
pe = 0.25;
lamda = 0.9;

policy_m = init_policy();

flag = 1;
iter = 0;

%%% Part 3: Policy Evaluation %%%

% ---------Start of computation time----------
% tic
% 
while(flag)
    % Value update until static
    value_res = value_update(policy_m,pe,lamda,value_init);
    
    % Policy update
    policy_m_new = policy_update(value_res,pe,action_space);
    
    % Policy would be updated until static
    if isequal(policy_m_new,policy_m)
        
        % policy_m_final is the optimal policy we obtained.
        policy_m_final = policy_m_new;
        % value_optimal is the optimal value matrix.
        value_optimal = value_res;
        flag = 0;
    end
    
    policy_m = policy_m_new;
    iter = iter + 1;
end
traj_draw([4,1],6,policy_m,0);
% 
% toc
% ---------End of computation time----------


%%% Part 4: Value Evaluation %%%


% ---------Start of computation time----------
% tic
% 
[value_res,policy_optimal] = value_update_2(pe,lamda,action_space);
traj_draw([4,1],6,policy_optimal,0);
% 
% toc
% ---------End of computation time----------





