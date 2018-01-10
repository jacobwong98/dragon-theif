% Clear Command and Workspace Window
clc;clear;
% Player_1 Inputs code
i=0;
while i >= 0
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
% Clear Command Window so Player 2 does not see code
clc;
Attempts= 0;
while Attempts < 10
    Attempts= Attempts + 1;
    Player2Guess= input(' Enter 5 digit Guess: ', 's');
    Digits_2= Player2Guess - '0';
    if length(Digits_2) ~= 5
        fprintf('Invalid number of digits. Attempt %0.0f used. Try again.\n', Attempts);
    else
        Digits_3= Digits_1 - Digits_2;
        if Digits_3(1) ~= 0
            Verification_1= 1;
        else
            Verification_1= 0;
        end
        if Digits_3(2) ~= 0
            Verification_2= 1;
        else
            Verification_2= 0;
        end
        if Digits_3(3) ~=0
            Verification_3= 1;
        else
            Verification_3= 0;
        end
        if Digits_3(4) ~= 0
            Verification_4= 1;
        else
            Verification_4= 0;
        end
        if Digits_3(5) ~= 0
            Verification_5= 1;
        else
            Verification_5= 0;
        end
        Total= Verification_1 + Verification_2 + Verification_3 + Verification_4 + Verification_5;
        switch Total
            case 0
                fprintf('Congrats you have cracked the Code!!! \n')
                break
            case 1
                fprintf('4 digits are correct. Attempt %.0f used. \n', Attempts)
            case 2
                fprintf('3 digits are correct. Attempt %.0f used. \n', Attempts)
            case 3
        end
    end
end
    