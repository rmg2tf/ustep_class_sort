% delete repeats
clc
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

c1c1 = table2array(form(:, 'Class1_RankTheClassesInOrderOfPreference_1stChoice_'));
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
kid_schedule = [firstname, lastname];
kid = table2array(kid);
kid_schedule = table2array(kid_schedule);
siz = size(kid);
class_size = 2;
afternoon_class_size = 3;
% Block 1 loop

block1class1 = [];
block1class2 = [];
block1class3 = [];
block1class4 = [];
block1class5 = [];

block1_classes = ["a", "b", "c", "d", "e"];

%  Block 1 -------------------------------------------
for i = 1:siz(1,:)
    pick1 = kid(i,3);
    pick2 = kid(i, 4);
    pick3 = kid(i, 5);
    pick4 = kid(i, 6);
    pick5 = kid(i, 7);
    
    check_b1c1 = strcmp(pick1, block1_classes(1));
    check_b1c2 = strcmp(pick1, block1_classes(2));
    check_b1c3 = strcmp(pick1, block1_classes(3));
    check_b1c4 = strcmp(pick1, block1_classes(4));
    check_b1c5 = strcmp(pick1, block1_classes(5));
    
    

    if check_b1c1 == 1 % if first class is class 1
        if size(block1class1,1) < class_size
            block1class1 = [block1class1; kid(i,1) kid(i,2)];
            kid_schedule{i,3} = block1_classes(1);
        elseif (pick2 == block1_classes(2) && size(block1class2,1) < class_size) % try class 2
            block1class2 = [block1class2; kid(i,1) kid(i,2)];
            kid_schedule{i,3} = block1_classes(2);
        elseif pick2 == block1_classes(3) && size(block1class3,1) < class_size % try class 3
            block1class3 = [block1class3; kid(i,1) kid(i,2)];
            kid_schedule{i,3} = block1_classes(3);
        elseif pick2 == block1_classes(4) && size(block1class4,1) < class_size % try class 4
            block1class4 = [block1class4; kid(i,1) kid(i,2)];
            kid_schedule{i,3} = block1_classes(4);
        elseif pick2 == block1_classes(5) && size(block1class5,1) < class_size % try class 5
            block1class5 = [block1class5; kid(i,1) kid(i,2)];
            kid_schedule{i,3} = block1_classes(5);
        end
        
    elseif check_b1c2 == 1 % if first class is class 2
        if size(block1class2,1) < class_size
            block1class2 = [block1class2; kid(i,1) kid(i,2)];
            kid_schedule{i,3} = block1_classes(2);
        elseif (pick2 == block1_classes(1) && size(block1class1,1) < class_size)
            block1class1 = [block1class1; kid(i,1) kid(i,2)];
            kid_schedule{i,3} = block1_classes(1);
        elseif pick2 == block1_classes(3) && size(block1class3,1) < class_size
            block1class3 = [block1class3; kid(i,1) kid(i,2)];
            kid_schedule{i,3} = block1_classes(3);
        elseif pick2 == block1_classes(4) && size(block1class4,1) < class_size
            block1class4 = [block1class4; kid(i,1) kid(i,2)];
            kid_schedule{i,3} = block1_classes(4);
        elseif pick2 == block1_classes(5) && size(block1class5,1) < class_size
            block1class5 = [block1class5; kid(i,1) kid(i,2)];
            kid_schedule{i,3} = block1_classes(5);
        end
        
    elseif check_b1c3 == 1 % if first class is class 3
        if size(block1class3,1) < class_size
            block1class3 = [block1class3; kid(i,1) kid(i,2)];
            kid_schedule{i,3} = block1_classes(3);
        elseif (pick2 == block1_classes(2) && size(block1class2,1) < class_size)
            block1class2 = [block1class2; kid(i,1) kid(i,2)];
            kid_schedule{i,3} = block1_classes(2);
        elseif pick2 == block1_classes(1) && size(block1class1,1) < class_size
            block1class1 = [block1class1; kid(i,1) kid(i,2)];
            kid_schedule{i,3} = block1_classes(1);
        elseif pick2 == block1_classes(4) && size(block1class4,1) < class_size
            block1class4 = [block1class4; kid(i,1) kid(i,2)];
            kid_schedule{i,3} = block1_classes(4);
        elseif pick2 == block1_classes(5) && size(block1class5,1) < class_size
            block1class5 = [block1class5; kid(i,1) kid(i,2)];
            kid_schedule{i,3} = block1_classes(5);
        end
        
    elseif check_b1c4 == 1 % if first class is class 4
        if size(block1class4,1) < class_size
            block1class4 = [block1class4; kid(i,1) kid(i,2)];
            kid_schedule{i,3} = block1_classes(4);
        elseif (pick2 == block1_classes(2) && size(block1class2,1) < class_size)
            block1class2 = [block1class2; kid(i,1) kid(i,2)];
            kid_schedule{i,3} = block1_classes(2);
        elseif pick2 == block1_classes(3) && size(block1class3,1) < class_size
            block1class3 = [block1class3; kid(i,1) kid(i,2)];
            kid_schedule{i,3} = block1_classes(3);
        elseif pick2 == block1_classes(1) && size(block1class1,1) < class_size
            block1class1 = [block1class1; kid(i,1) kid(i,2)];
            kid_schedule{i,3} = block1_classes(1);
        elseif pick2 == block1_classes(5) && size(block1class5,1) < class_size
            block1class5 = [block1class5; kid(i,1) kid(i,2)];
            kid_schedule{i,3} = block1_classes(5);
        end
        
    elseif check_b1c5 == 1 % if first class is class 5
        if size(block1class5,1) < class_size
            block1class5 = [block1class5; kid(i,1) kid(i,2)];
            kid_schedule{i,3} = block1_classes(5);
        elseif (pick2 == block1_classes(2) && size(block1class2,1) < class_size)
            block1class2 = [block1class2; kid(i,1) kid(i,2)];
            kid_schedule{i,3} = block1_classes(2);
        elseif pick2 == block1_classes(3) && size(block1class3,1) < class_size
            block1class3 = [block1class3; kid(i,1) kid(i,2)];
            kid_schedule{i,3} = block1_classes(3);
        elseif pick2 == block1_classes(4) && size(block1class4,1) < class_size
            block1class4 = [block1class4; kid(i,1) kid(i,2)];
            kid_schedule{i,3} = block1_classes(4);
        elseif pick2 == block1_classes(1) && size(block1class1,1) < class_size
            block1class1 = [block1class1; kid(i,1) kid(i,2)];
            kid_schedule{i,3} = block1_classes(1);
        end
    end
end

block2class1 = [];
block2class2 = [];
block2class3 = [];
block2class4 = [];
block2class5 = [];

block2_classes = ["aa", "bb", "cc", "dd", "ee"];

% Block 2 ------------------------------------------------

for i = 1:siz(1,:)
    pick1 = kid(i,8);
    pick2 = kid(i, 9);
    pick3 = kid(i, 10);
    pick4 = kid(i, 11);
    pick5 = kid(i, 12);
    check_b2c1 = strcmp(kid(i,9), block2_classes(1));
    check_b2c2 = strcmp(kid(i,9), block2_classes(2));
    check_b2c3 = strcmp(kid(i,9), block2_classes(3));
    check_b2c4 = strcmp(kid(i,9), block2_classes(4));
    check_b2c5 = strcmp(kid(i,9), block2_classes(5));
    
    if check_b2c1 == 1
        if size(block2class1,1) < class_size
            block2class1 = [block2class1; kid(i,1) kid(i,2)];
            kid_schedule{i,4} = block2_classes(1);
        elseif (pick2 == block2_classes(2) && size(block2class2,1) < class_size) % try class 2
            block2class2 = [block2class2; kid(i,1) kid(i,2)];
            kid_schedule{i,4} = block2_classes(2);
        elseif pick2 == block2_classes(3) && size(block2class3,1) < class_size % try class 3
            block2class3 = [block2class3; kid(i,1) kid(i,2)];
            kid_schedule{i,4} = block2_classes(3);
        elseif pick2 == block2_classes(4) && size(block2class4,1) < class_size % try class 4
            block2class4 = [block2class4; kid(i,1) kid(i,2)];
            kid_schedule{i,4} = block2_classes(4);
        elseif pick2 == block2_classes(5) && size(block2class5,1) < class_size % try class 5
            block2class5 = [block2class5; kid(i,1) kid(i,2)];
            kid_schedule{i,4} = block2_classes(5);
        end
    elseif check_b2c2 == 1
        if size(block2class2,1) < class_size
            block2class2 = [block2class2; kid(i,1) kid(i,2)];
            kid_schedule{i,4} = block2_classes(2);
        elseif (pick2 == block2_classes(1) && size(block2class1,1) < class_size) % try class 2
            block2class1 = [block2class1; kid(i,1) kid(i,2)];
            kid_schedule{i,4} = block2_classes(1);
        elseif pick2 == block2_classes(3) && size(block2class3,1) < class_size % try class 3
            block2class3 = [block2class3; kid(i,1) kid(i,2)];
            kid_schedule{i,4} = block2_classes(3);
        elseif pick2 == block2_classes(4) && size(block2class4,1) < class_size % try class 4
            block2class4 = [block2class4; kid(i,1) kid(i,2)];
            kid_schedule{i,4} = block2_classes(4);
        elseif pick2 == block2_classes(5) && size(block2class5,1) < class_size % try class 5
            block2class5 = [block2class5; kid(i,1) kid(i,2)];
            kid_schedule{i,4} = block2_classes(5);
        end
    elseif check_b2c3 == 1
        if size(block2class3,1) < class_size
            block2class3 = [block2class3; kid(i,1) kid(i,2)];
            kid_schedule{i,4} = block2_classes(3);
        elseif (pick2 == block2_classes(2) && size(block2class2,1) < class_size) % try class 2
            block2class2 = [block2class2; kid(i,1) kid(i,2)];
            kid_schedule{i,4} = block2_classes(2);
        elseif pick2 == block2_classes(1) && size(block2class1,1) < class_size % try class 3
            block2class1 = [block2class1; kid(i,1) kid(i,2)];
            kid_schedule{i,4} = block2_classes(1);
        elseif pick2 == block2_classes(4) && size(block2class4,1) < class_size % try class 4
            block2class4 = [block2class4; kid(i,1) kid(i,2)];
            kid_schedule{i,4} = block2_classes(4);
        elseif pick2 == block2_classes(5) && size(block2class5,1) < class_size % try class 5
            block2class5 = [block2class5; kid(i,1) kid(i,2)];
            kid_schedule{i,4} = block2_classes(5);
        end
    elseif check_b2c4 == 1
        if size(block2class4,1) < class_size
            block2class4 = [block2class4; kid(i,1) kid(i,2)];
            kid_schedule{i,4} = block2_classes(4);
        elseif (pick2 == block2_classes(2) && size(block2class2,1) < class_size) % try class 2
            block2class2 = [block2class2; kid(i,1) kid(i,2)];
            kid_schedule{i,4} = block2_classes(2);
        elseif pick2 == block2_classes(3) && size(block2class3,1) < class_size % try class 3
            block2class3 = [block2class3; kid(i,1) kid(i,2)];
            kid_schedule{i,4} = block2_classes(3);
        elseif pick2 == block2_classes(1) && size(block2class1,1) < class_size % try class 4
            block2class1 = [block2class1; kid(i,1) kid(i,2)];
            kid_schedule{i,4} = block2_classes(1);
        elseif pick2 == block2_classes(5) && size(block2class5,1) < class_size % try class 5
            block2class5 = [block2class5; kid(i,1) kid(i,2)];
            kid_schedule{i,4} = block2_classes(5);
        end
    elseif check_b2c5 == 1
        if size(block2class5,1) < class_size
            block2class5 = [block2class5; kid(i,1) kid(i,2)];
            kid_schedule{i,4} = block2_classes(5);
        elseif (pick2 == block2_classes(2) && size(block2class2,1) < class_size) % try class 2
            block2class2 = [block2class2; kid(i,1) kid(i,2)];
            kid_schedule{i,4} = block2_classes(2);
        elseif pick2 == block2_classes(3) && size(block2class3,1) < class_size % try class 3
            block2class3 = [block2class3; kid(i,1) kid(i,2)];
            kid_schedule{i,4} = block2_classes(3);
        elseif pick2 == block2_classes(4) && size(block2class4,1) < class_size % try class 4
            block2class4 = [block2class4; kid(i,1) kid(i,2)];
            kid_schedule{i,4} = block2_classes(4);
        elseif pick2 == block2_classes(1) && size(block2class1,1) < class_size % try class 5
            block2class1 = [block2class1; kid(i,1) kid(i,2)];
            kid_schedule{i,4} = block2_classes(1);
        end
    end
end

block3class1 = [];
block3class2 = [];
block3class3 = [];
block3class4 = [];

block3_classes = ["aaa", "bbb", "ccc", "ddd"];
% Block 3
for i = 1:siz(1,:)
    pick1 = kid(i,13);
    pick2 = kid(i, 14);
    pick3 = kid(i, 15);
    pick4 = kid(i, 16);
    
    check_b3c1 = strcmp(pick1, block3_classes(1));
    check_b3c2 = strcmp(pick2, block3_classes(2));
    check_b3c3 = strcmp(pick3, block3_classes(3));
    check_b3c4 = strcmp(pick4, block3_classes(4));
    
    
    if check_b3c1 == 1
        if size(block3class1,1) < afternoon_class_size
            block3class1 = [block3class1; kid(i,1) kid(i,2)];
            kid_schedule{i,5} = block3_classes(1);
        elseif (pick2 == block3_classes(2) && size(block3class2,1) < afternoon_class_size) % try class 2
            block3class2 = [block3class2; kid(i,1) kid(i,2)];
            kid_schedule{i,5} = block3_classes(2);
        elseif pick2 == block3_classes(3) && size(block3class3,1) < afternoon_class_size % try class 3
            block3class3 = [block3class3; kid(i,1) kid(i,2)];
            kid_schedule{i,5} = block3_classes(3);
        elseif pick2 == block3_classes(4) && size(block3class4,1) < afternoon_class_size % try class 4
            block3class4 = [block3class4; kid(i,1) kid(i,2)];
            kid_schedule{i,5} = block3_classes(4);
        end
    elseif check_b3c2 == 1
        if size(block3class2,1) < afternoon_class_size
            block3class2 = [block3class2; kid(i,1) kid(i,2)];
            kid_schedule{i,5} = block3_classes(2);
        elseif (pick2 == block3_classes(1) && size(block3class1,1) < afternoon_class_size) % try class 2
            block3class1 = [block3class1; kid(i,1) kid(i,2)];
            kid_schedule{i,5} = block3_classes(1);
        elseif pick2 == block3_classes(3) && size(block3class3,1) < afternoon_class_size % try class 3
            block3class3 = [block3class3; kid(i,1) kid(i,2)];
            kid_schedule{i,5} = block3_classes(3);
        elseif pick2 == block3_classes(4) && size(block3class4,1) < afternoon_class_size % try class 4
            block3class4 = [block3class4; kid(i,1) kid(i,2)];
            kid_schedule{i,5} = block3_classes(4);
        end
    elseif check_b3c3 == 1
        if size(block3class3,1) < afternoon_class_size
            block3class3 = [block3class3; kid(i,1) kid(i,2)];
            kid_schedule{i,5} = block3_classes(3);
        elseif (pick2 == block3_classes(2) && size(block3class2,1) < afternoon_class_size) % try class 2
            block3class2 = [block3class2; kid(i,1) kid(i,2)];
            kid_schedule{i,5} = block3_classes(2);
        elseif pick2 == block3_classes(1) && size(block3class1,1) < afternoon_class_size % try class 3
            block3class1 = [block3class1; kid(i,1) kid(i,2)];
            kid_schedule{i,5} = block3_classes(1);
        elseif pick2 == block3_classes(4) && size(block3class4,1) < afternoon_class_size % try class 4
            block3class4 = [block3class4; kid(i,1) kid(i,2)];
            kid_schedule{i,5} = block3_classes(4);
        end
    elseif check_b3c4 == 1
        if size(block3class4,1) < afternoon_class_size
            block3class4 = [block3class4; kid(i,1) kid(i,2)];
            kid_schedule{i,5} = block3_classes(4);
        elseif (pick2 == block3_classes(2) && size(block3class2,1) < afternoon_class_size) % try class 2
            block3class2 = [block3class2; kid(i,1) kid(i,2)];
            kid_schedule{i,5} = block3_classes(2);
        elseif pick2 == block3_classes(3) && size(block3class3,1) < afternoon_class_size % try class 3
            block3class3 = [block3class3; kid(i,1) kid(i,2)];
            kid_schedule{i,5} = block3_classes(3);
        elseif pick2 == block3_classes(1) && size(block3class1,1) < afternoon_class_size % try class 4
            block3class1 = [block3class1; kid(i,1) kid(i,2)];
            kid_schedule{i,5} = block3_classes(1);

        end
    end
end
block4class1 = [];
block4class2 = [];
block4class3 = [];
block4class4 = [];
block4_classes = ["aaaa", "bbbb", "cccc", "dddd"];
% Block 4
for i = 1:siz(1,:)
    pick1 = kid(i,17);
    pick2 = kid(i, 18);
    pick3 = kid(i, 19);
    pick4 = kid(i, 20);
    
    check_b4c1 = strcmp(pick1, block4_classes(1));
    check_b4c2 = strcmp(pick2, block4_classes(2));
    check_b4c3 = strcmp(pick3, block4_classes(3));
    check_b4c4 = strcmp(pick4, block4_classes(4));
    
    
    if check_b4c1 == 1
        if size(block4class1,1) < afternoon_class_size
            block4class1 = [block4class1; kid(i,1) kid(i,2)];
            kid_schedule{i,6} = block4_classes(1);
        elseif (pick2 == block4_classes(2) && size(block4class2,1) < afternoon_class_size) % try class 2
            block4class2 = [block4class2; kid(i,1) kid(i,2)];
            kid_schedule{i,6} = block4_classes(2);
        elseif pick2 == block4_classes(3) && size(block4class3,1) < afternoon_class_size % try class 3
            block4class3 = [block4class3; kid(i,1) kid(i,2)];
            kid_schedule{i,6} = block4_classes(3);
        elseif pick2 == block4_classes(4) && size(block4class4,1) < afternoon_class_size % try class 4
            block4class4 = [block4class4; kid(i,1) kid(i,2)];
            kid_schedule{i,6} = block4_classes(4);
        end
    elseif check_b4c2 == 1
        if size(block4class2,1) < afternoon_class_size
            block4class2 = [block4class2; kid(i,1) kid(i,2)];
            kid_schedule{i,6} = block4_classes(2);
        elseif (pick2 == block4_classes(1) && size(block4class1,1) < afternoon_class_size) % try class 2
            block4class1 = [block4class1; kid(i,1) kid(i,2)];
            kid_schedule{i,6} = block4_classes(1);
        elseif pick2 == block4_classes(3) && size(block4class3,1) < afternoon_class_size % try class 3
            block4class3 = [block4class3; kid(i,1) kid(i,2)];
            kid_schedule{i,6} = block4_classes(3);
        elseif pick2 == block4_classes(4) && size(block4class4,1) < afternoon_class_size % try class 4
            block4class4 = [block4class4; kid(i,1) kid(i,2)];
            kid_schedule{i,6} = block4_classes(4);
        end
    elseif check_b4c3 == 1
        if size(block4class3,1) < afternoon_class_size
            block4class3 = [block4class3; kid(i,1) kid(i,2)];
            kid_schedule{i,6} = block4_classes(3);
        elseif (pick2 == block4_classes(2) && size(block4class2,1) < afternoon_class_size) % try class 2
            block4class2 = [block4class2; kid(i,1) kid(i,2)];
            kid_schedule{i,6} = block4_classes(2);
        elseif pick2 == block4_classes(1) && size(block4class1,1) < afternoon_class_size % try class 3
            block4class1 = [block4class1; kid(i,1) kid(i,2)];
            kid_schedule{i,6} = block4_classes(1);
        elseif pick2 == block4_classes(4) && size(block4class4,1) < afternoon_class_size % try class 4
            block4class4 = [block4class4; kid(i,1) kid(i,2)];
            kid_schedule{i,6} = block4_classes(4);
        end
    elseif check_b4c4 == 1
        if size(block4class4,1) < afternoon_class_size
            block4class4 = [block4class4; kid(i,1) kid(i,2)];
            kid_schedule{i,6} = block4_classes(4);
        elseif (pick2 == block4_classes(2) && size(block4class2,1) < afternoon_class_size) % try class 2
            block4class2 = [block4class2; kid(i,1) kid(i,2)];
            kid_schedule{i,6} = block4_classes(2);
        elseif pick2 == block4_classes(3) && size(block4class3,1) < afternoon_class_size % try class 3
            block4class3 = [block4class3; kid(i,1) kid(i,2)];
            kid_schedule{i,6} = block4_classes(3);
        elseif pick2 == block4_classes(1) && size(block4class1,1) < afternoon_class_size % try class 4
            block4class1 = [block4class1; kid(i,1) kid(i,2)];
            kid_schedule{i,6} = block4_classes(1);
        end
    end
end

% Try next time:
% convert to array instead table 
% UPDATE: (done line 61)
% but table nice for readability 
% UPDATE: (can always convert back)

% try and set up loop for class block 1



