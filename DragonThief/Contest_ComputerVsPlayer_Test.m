% Clear Command Window and Workspace Window
clc;clear;
% Computer/AI generates Code to crack
CompCode= randi([0 9],1,5);

% Player's turn to crack the code
Attempts= 20;
while Attempts > 0
    Attempts= Attempts - 1;
    prompt={'Enter 5 digit guess.'};
    title= 'Player Code Breaker';
    numlines= 1;
    defaults= {'0'};
    options.Resize= 'on';
    options.WindowStyle= 'normal';
    options.Interpreter= 'none';
    PlayerGuess= inputdlg(prompt, title, numlines, defaults, options);
    % Change guess to Array
    PlayerGuessArray= PlayerGuess{1} - '0';
    if length(PlayerGuessArray)~=5
        fprintf('Invalid number of digits. %.0f Attempts left.\n', Attempts)
    else
        fprintf('Your guess is %.0f%.0f%.0f%.0f%.0f.\n', PlayerGuessArray)
        Digits= sum(logical(CompCode-PlayerGuessArray));
        switch Digits
            case 0
                fprintf('Congrats you have cracked the code!!!\n')
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
        end
    end
end
if Digits~=0 && Attempts == 0 
    fprintf('Out of Attempts. AI WINS!!!!!. \n')
end