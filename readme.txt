
2018 Fall - ECE209AS-1 Problem Set 2

MATLAB code submission

Author: Hanren Lin, Chungyu Chen

Instructor: Ankur Mehta

Subject: Markov Decision Process

(If there's any problem happened when executing the code, please contact at cirnolinh@gmail.com.)

========================================================

pset2_main.m: The main function.

h_judge.m: The function for revising h's value when h goes above 11 or below 0.

psa.m: The function for psa(s') calculation.

next_state.m: The function for generating a possible next state for current state.

init_policy.m: The function for generating the initial policy based on the description in part 3.

reward_func.m: The function for calculating the reward according to the current state.

value_update.m: The function for value updating in policy iteration method.

policy_update.m: The function for policy updating in policy iteration method.

value_update_2.m: The function for value converging in value iteration method.

traj_draw.m: The function for trajectory drawing, with outputs of the robot's route (in the form of state sets).