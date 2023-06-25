backpack_contents = readtable("backpack_contents.xlsx", ReadVariableNames=false);
duplicates = blanks(height(backpack_contents));
alphabet = 'abcdefghijklmnopqrstuvwxyz';
priorities = 0;

%find_duplicates
find_groups(backpack_contents, duplicates, alphabet, priorities)

%% part 1

function find_duplicates
backpack_contents = readtable("backpack_contents.xlsx", ReadVariableNames=false);
duplicates = blanks(height(backpack_contents));
alphabet = 'abcdefghijklmnopqrstuvwxyz';
priorities = 0;

for i = 1:height(backpack_contents)
    
    current_backpack = char(backpack_contents{i, 1});
    first_compartment = current_backpack(1 : (strlength(backpack_contents{i, 1})/2));
    second_compartment = current_backpack((strlength(backpack_contents{i, 1})/2) + 1 : end);
    
    for ii = 1:strlength(backpack_contents{i, 1})/2
        for jj = 1:strlength(backpack_contents{i, 1})/2
            if first_compartment(ii) == second_compartment(jj)
                duplicates(i) = first_compartment(ii);
                break
            end
        end
        if duplicates(i) ~= ' '
            break
        end
    end
end

for i = 1:strlength(duplicates)
    found = false;
    for j = 1:strlength(duplicates)
        if lower(duplicates(i)) == alphabet(j)
            if duplicates(i) == lower(duplicates(i))
                priorities = priorities + j;
                found = true;
            else 
                priorities = priorities + j + 26;
                found = true;
            end
        end
        if found
            break
        end
    end
end

disp(priorities)
end

%% part 2 

function find_groups(backpack_contents, duplicates, alphabet, priorities)
for i = 1:3:height(backpack_contents)
    first_backpack = char(backpack_contents{i, 1});
    second_backpack = char(backpack_contents{i+1, 1});
    if strlength(first_backpack) >= strlength(second_backpack)
        for ii = 1:strlength(first_backpack)
            for jj = 1:strlength(second_backpack)
                if first_backpack(ii) == second_backpack(jj)
                    duplicates(i) = first_backpack(ii);
                    break
                end
            end
            if duplicates(i) ~= ' '
                break
            end
        end
    else
        for ii = 1:strlength(second_backpack)
            for jj = 1:strlength(first_backpack)
                if second_backpack(ii) == first_backpack(jj)
                    duplicates(i) = second_backpack(ii);
                    break
                end
            end
            if duplicates(i) ~= ' '
                break
            end
        end
    end
end

duplicates = duplicates(1:3:strlength(duplicates));

for i = 1:strlength(duplicates)
    found = false;
    for j = 1:strlength(alphabet)
        if lower(duplicates(i)) == alphabet(j)
            if duplicates(i) == lower(duplicates(i))
                priorities = priorities + j;
                found = true;
            else 
                priorities = priorities + j + 26;
                found = true;
            end
        end
        if found
            break
        end
    end
end

disp(priorities)

end
