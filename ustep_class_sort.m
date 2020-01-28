% delete repeats

clear

% read from csv of classes in google sheet from form

% pull names and top choices for each class

% classes 1 and 2 have 5 choices 

% classes 3 and 4 have 4 choices

% Ask Lily about priority time vs class choice

% LOGIC
% First Block
    % Assign all kids 1st pick if pick is full move to 2nd pick etc
    % Full when class roster == # 
    % Add names to class roster as they are assigned
% Second Block
    % Assign their 1st pickif full move to 2nd pick etc
    % Full when class roster == # 
% Repeat until all kids have 4 classes
% take kid bins and make schedules
% take class bins and make rosters
% END LOGIC

filename = 'USTEP_dummy_vars.xlsx';

form = readtable(filename);

firstname = form(:,'FirstName');
lastname = form(:,'LastName');

kid = [firstname,lastname];


% Try next time:
% convert to array instead table
% but table nice for readability
% try and set up loop for class block 1


