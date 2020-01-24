x = [1 1 3 3 1 1 3];
y = [4 2 2 4 4 4 2];

plot(x,y)


% to set both axis from 0 to 5
xlim([0,5])
ylim([0,5])
% to set the increment in each axis to 1

% or replace these lines:
% x = [1 1 3 3 1 1 3];
% y = [4 2 2 4 4 4 2];
% plot(x,y,'r', 'LineWidth',1)
% by 
% rectangle('Position',[1 2 2 2]);
% for simplicity