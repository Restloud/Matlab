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

