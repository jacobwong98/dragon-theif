clc;clear;
for i=1:10
    Player1Code= input('Enter 5 digit Code: ', 's');
    % Change to Array
    Digits_1= Player1Code - '0';
    if length(Digits_1)~= 5
        fprintf('Invalid number of digits. Try again. \n');
        continue
    else
        break
    end
end