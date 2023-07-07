assignment_pairs = readtable("assignment_pairs.xlsx");
total_overlaps = 0;
overlaps = 0; 

%% part 1

for i = 1:height(assignment_pairs)
    
    [elf1_assignments, elf2_assignments] = assignment_arrays(assignment_pairs, i);

    if length(elf1_assignments) >= length(elf2_assignments)
        if elf2_assignments(1) >= elf1_assignments(1)
            if elf2_assignments(end) <= elf1_assignments(end)
                total_overlaps = total_overlaps + 1;
            end
        end
    else
        if elf1_assignments(1) >= elf2_assignments(1)
            if elf1_assignments(end) <= elf2_assignments(end)
                total_overlaps = total_overlaps + 1;
            end
        end
    end

end

disp(total_overlaps)

%% part 2

for i = 1:height(assignment_pairs)
    
    [elf1_assignments, elf2_assignments] = assignment_arrays(assignment_pairs, i);

    if length(elf1_assignments) >= length(elf2_assignments)
        for ii = 1:length(elf1_assignments)
            if any(elf2_assignments(:) == elf1_assignments(ii))
                overlaps = overlaps +1;
                break
            end
        end
    else 
        for ii = 1:length(elf2_assignments)
            if any(elf1_assignments(:) == elf2_assignments(ii))
                overlaps = overlaps +1;
                break
            end
        end
    end

end

disp(overlaps)

%% functions

function [elf1_assignments, elf2_assignments] = assignment_arrays(assignment_pairs, i)
    
    temp = char(assignment_pairs{i, 1});
    separator = find(temp=='-');
    elf1_first = str2double(temp(1:separator-1));
    elf1_second = str2double(temp(separator+1:end));

    temp = char(assignment_pairs{i, 2});
    separator = find(temp=='-');
    elf2_first = str2double(temp(1:separator-1));
    elf2_second = str2double(temp(separator+1:end));

    elf1_assignments = elf1_first:elf1_second;
    elf2_assignments = elf2_first:elf2_second;
end