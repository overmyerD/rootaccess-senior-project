function [result] = remove_lead_trail_zeros(input)
%REMOVE_LEAD_TRAIL_ZEROS removes the leading and trailing zeros in a vector
    result = input(find(input,1,'first'):find(input,1,'last'));
end

