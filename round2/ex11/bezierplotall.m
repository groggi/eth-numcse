figure;
bezierplot([2 3 8 10;1 8 7 3], 2:0.001:10, 3); % lecture 19, slide 21

figure;
bezierplot([0 1/3 2/3 1;0 -1 -1 1], 0:0.001:1, 3); % lecture 19, slide 12

figure;
% exercise 11, problem 23d
bezierplot([0 1 2.5 3;0 2 0.5 1], 0:0.001:3, 3);
hold on;
bezierplot([3 4 4 4;1 1.5 1.6 1], 3:0.001:4, 3);
hold off;