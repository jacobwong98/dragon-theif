function []=TheDragonThief ()
% Clear Command Window and Workspace
clc;clear;
% User decides which game mode they want to play.
i=1;
while i>0
    choice= menu('Choose Game mode', 'Fight against Daenerys Targaryen', 'Practice with Unsullied soldier');
    if choice ~=0 
        break 
    end % If statement
end % Break goes here.
if choice==1
    PvPMode()
else
    PlayerVsAIMode()
end
end 

function []= PvPMode()
% Player 1 inputs their Secret Code
j=0;
while j>=0
    Prompt= {'Enter the 5 secret digits to keep Rhaegal safe.'};
    Title= 'The Cage of Rhaegal';
    Numlines= 1;
    Defaults= {'0'};
    options.Resize= 'on';
    options.WindowStyle= 'normal';
    options.Interpreter= 'none';
    Player1Code= inputdlg(Prompt,Title,Numlines,Defaults,options);
    % Change to Array
    Digits_1= Player1Code{1} - '0';
    if length(Digits_1)~= 5
        fprintf('Invalid number of digits. Try again. \n');
        continue
    else
        break
    end
end % Break goes here
% Player 2 now tries to break Player 1's code
Attempts= 20;
while Attempts > 0
    Attempts= Attempts - 1;
    Prompt= {'Enter your 5 digit guess'};
    Title= 'Lock Breaker';
    Numlines= 1;
    Defaults= {'0'};
    options.Resize= 'on';
    options.WindowStyle= 'normal';
    options.Interpreter= 'none';
    Player2Guess= inputdlg(Prompt,Title,Numlines,Defaults,options);
    % Change to Array
    Digits_2= Player2Guess{1} - '0';
    if length(Digits_2) ~= 5
        fprintf('Invalid number of digits. %0.0f Attempts left. Try again.\n', Attempts);
    else
        Digits_3= sum(logical(Digits_1 - Digits_2));
        fprintf('The Thief from Kings Landing guessed %.0f%.0f%.0f%.0f%.0f.\n', Digits_2)
        switch Digits_3
            case 0
                fprintf('The thief has successfully stolen Rhaegal from Daenerys!!!\n')
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
        end % Switch Statement
    end % If statement for verifying Digits 2
end % While Loop
if Attempts == 0 && Digits_3~=0
    fprintf('Out of Attempts. Daenerys has successfully protected Rhaegal. Rhaegal burns you alive.\n')
end % If statement for printing Winner message
end % End of PvPMode function

function []= PlayerVsAIMode()
% Computer/AI generates Code to crack
CompCode= randi([0 9],1,5);

% Player's turn to crack the code
Attempts= 20;
while Attempts > 0
    Attempts= Attempts - 1;
    prompt={'Enter 5 digit guess.'};
    title= 'Practice Lock Breaker';
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
                fprintf('Congrats you have outwitted the Unsullied soldier !!!\n')
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
        end % Switch statement
    end % End of If statement for verifying the Player's guess
end % While Loop
if Digits~=0 && Attempts == 0 
    fprintf('Out of Attempts. The Unsullied soldier has outsmarted you.\n')
end % If statement 
end % End of PlayerVsAIMode function
