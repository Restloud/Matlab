elves_calories = readtable('elves_food.xlsx');
elves_calories = table2array(elves_calories);
y = 1;
elves = zeros(1000, 1);

for x = 1:length(elves_calories)
    if   ~isnan(elves_calories(x))
        elves(y) = elves(y) + elves_calories(x);
    else
        y = y + 1;
    end 
end 

biggest_elf = max(elves);
disp(biggest_elf)

elves = sort(elves, 'descend');
fprintf('The sum of the top three elves is %d', sum(elves(1:3)))




