function h_output = h_judge(h_input)

    % If h = 12 or -1, revise the value of h
    if h_input == 12
        h_output = 0;
    elseif h_input == -1
        h_output = 11;
    else
        h_output = h_input;
    end
    
end