world = vrworld('ProjectScene.WRL', 'new');

%opening the world
open(world);
fig=vrfigure(world);
vrdrawnow;

man_node = vrnode(world, 'man');

left_thigh_node = vrnode(world, 'left_thigh');
left_leg_node = vrnode(world, 'left_leg');
left_foot_node = vrnode(world, 'left_foot');

right_thigh_node = vrnode(world, 'right_thigh');
right_leg_node = vrnode(world, 'right_leg');
right_foot_node = vrnode(world, 'right_foot');


%starting and ending point coordinates            
x = -25:1.0:10;
z = zeros(size(x));
y = zeros(size(x));

man_node.translation = [0.1 0 0];

%walk in a straight line
for i=1:length(x)   
    
    waist_and_groin_node.rotation = [1 0 0 -0.25];
    right_thigh_node.rotation = [1 0 0 -0.25];
    right_leg_node.rotation = [1 0 0 -0.25];
    right_foot_node.rotation = [1 0 0 -0.25];

    pause(0.1);

    waist_and_groin_node.rotation = [0 0 0 0];
    right_thigh_node.rotation = [0 0 0 0];
    right_leg_node.rotation = [0 0 0 0];
    right_foot_node.rotation = [0 0 0 0];

    pause(0.1);

    waist_and_groin_node.rotation = [1 0 0 -0.25];
    left_thigh_node.rotation = [1 0 0 -0.25];
    left_leg_node.rotation = [1 0 0 -0.25];
    left_foot_node.rotation = [1 0 0 -0.25];

    pause(0.1);

    waist_and_groin_node.rotation = [0 0 0 0];
    left_thigh_node.rotation = [0 0 0 0];
    left_leg_node.rotation = [0 0 0 0];
    left_foot_node.rotation = [0 0 0 0];

    pause(0.1);

    man_node.translation = [x(i) y(i) z(i)];
    vrdrawnow;
    pause(0.1);
end

%stop with body in original position
waist_and_groin_node.rotation = [0 0 0 0];
left_thigh_node.rotation = [0 0 0 0];
left_leg_node.rotation = [0 0 0 0];
left_foot_node.rotation = [0 0 0 0];

pause(0.15);

waist_and_groin_node.rotation = [0 0 0 0];
right_thigh_node.rotation = [0 0 0 0];
right_leg_node.rotation = [0 0 0 0];
right_foot_node.rotation = [0 0 0 0];

pause(0.15);


%call the bicycle
bike_node = vrnode(world, 'bike');

%view all translation fields
x = -145.0:35;
z = 85.7 + zeros(size(x));
y = -27.0 + zeros(size(x));

%moving bicycle along main_road
for i=1:length(x)
     bike_node.translation = [x(i) y(i) z(i)];
     vrdrawnow;
     pause(0.01);
end

%corner rotation
bike_node.rotation = [0, 1, 1, 0];
vrdrawnow;

arr_1 = [];

%moving bicycle along side_road
for i=85.7:-1:40
    arr_1 = [arr_1,i];
end

z2 = arr_1;
x2 = 35 + zeros(size(z2));
y2 = -27.0 + zeros(size(z2));

for i=1:length(z2)
     bike_node.translation = [x2(i) y2(i) z2(i)];
     vrdrawnow;
     pause(0.01);
end

%stoping