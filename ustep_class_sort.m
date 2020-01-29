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

% c1c1 = class 1 choice 1 etc adjust for # of classes

c1c1 = form(:, 'Class1_RankTheClassesInOrderOfPreference_1stChoice_');
c1c2 = form(:, 'Class1_RankTheClassesInOrderOfPreference_2ndChoice_');
c1c3 = form(:, 'Class1_RankTheClassesInOrderOfPreference_3rdChoice_');
c1c4 = form(:, 'Class1_RankTheClassesInOrderOfPreference_4thChoice_');
c1c5 = form(:, 'Class1_RankTheClassesInOrderOfPreference_5thChoice_');

c2c1 = form(:, 'Class2_RankTheClassesInOrderOfPreference_1stChoice_');
c2c2 = form(:, 'Class2_RankTheClassesInOrderOfPreference_2ndChoice_');
c2c3 = form(:, 'Class2_RankTheClassesInOrderOfPreference_3rdChoice_');
c2c4 = form(:, 'Class2_RankTheClassesInOrderOfPreference_4thChoice_');
c2c5 = form(:, 'Class2_RankTheClassesInOrderOfPreference_5thChoice_');

c3c1 = form(:, 'Class3_RankTheClassesInOrderOfPreference_1stChoice_');
c3c2 = form(:, 'Class3_RankTheClassesInOrderOfPreference_2ndChoice_');
c3c3 = form(:, 'Class3_RankTheClassesInOrderOfPreference_3rdChoice_');
c3c4 = form(:, 'Class3_RankTheClassesInOrderOfPreference_4thChoice_');

c4c1 = form(:, 'Class4_RankTheClassesInOrderOfPreference_1stChoice_');
c4c2 = form(:, 'Class4_RankTheClassesInOrderOfPreference_2ndChoice_');
c4c3 = form(:, 'Class4_RankTheClassesInOrderOfPreference_3rdChoice_');
c4c4 = form(:, 'Class4_RankTheClassesInOrderOfPreference_4thChoice_');

kid = [firstname,lastname, c1c1, c1c2, c1c3, c1c4, c1c5, c2c1, c2c2, c2c3, c2c4, c2c5, c3c1, c3c2, c3c3, c3c4, c4c1, c4c2, c4c3, c4c4];

kid = table2array(kid);

% Try next time:
% convert to array instead table 
% UPDATE: (done line 61)
% but table nice for readability 
% UPDATE: (can always convert back)

% try and set up loop for class block 1


