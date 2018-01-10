% Clear Command and Workspace Window
clc;clear;
% Player 1 Inputs code
i=0;
while i >= 0 % Allows infinite entries until an acceptable code is given
    Player1Code= input('Enter 5 digit Code: ', 's');
    % Change to Array
    Digits_1= Player1Code - '0';
    if length(Digits_1)~= 5
        fprintf('Invalid number of digits. Try again. \n');
        continue
    else
        break
    end
end % Break goes here
% Clear Command Window so Player 2 does not see code
clc;
Attempts= 20;
while Attempts > 0
    Attempts= Attempts - 1;
    Player2Guess= input(' Enter 5 digit Guess: ', 's');
    % Change to Array
    Digits_2= Player2Guess - '0';
    if length(Digits_2) ~= 5
        fprintf('Invalid number of digits. %0.0f Attempts left. Try again.\n', Attempts);
    else
        Digits_3= sum(logical(Digits_1 - Digits_2));
        switch Digits_3
            case 0
                fprintf('Congrats you have cracked the Code!!! \n')
                break
            case 1
                fprintf('4 digits are correct. %0.0f Attempts left. \n', Attempts)
            case 2
                fprintf('3 digits are correct. %0.0f Attempts left. \n', Attempts)
            case 3
                fprintf('2 digits are correct. %0.0f Attempts left. \n', Attempts)
            case 4
                fprintf('1 digits are correct. %0.0f Attempts left. \n', Attempts)
            case 5
                fprintf('All digits are incorrect. %0.0f Attempts left. \n', Attempts)
            % No otherwise statement because the logical will only give
            % values from 0 to 5 so there are no other possible cases
        end
    end
end
if Attempts == 0 && Digits_3~=0
    fprintf('Out of Attempts. Player 1 WINS!!!!!. \n')
end
    