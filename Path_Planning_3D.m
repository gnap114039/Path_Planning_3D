function [route] = Path_Planning_3D(Grid_Size_X,Grid_Size_Y,Grid_Size_Z,Occupy_idx,Start_Node,End_Node,Eight_Direction_Flag)

%%%% Grid Value Defination %%%%%%
%%% Occuppy = 1;
%%% Empty = 2;
%%% Red = 3;
%%% Purple = 4;
%%% Start_Node = 5;
%%% End_Node = 6;



Main_Grid_3D = 2*ones(Grid_Size_X,Grid_Size_Y,Grid_Size_Z); 

% [X_occu,Y_occu,Z_occu] = ind2sub(size(Main_Grid_3D),Occupy_idx);
% [X_start,Y_start,Z_start] = ind2sub(size(Main_Grid_3D),Start_Node);
% [X_end,Y_end,Z_end] = ind2sub(size(Main_Grid_3D),End_Node);

Main_Grid_3D(Occupy_idx) = 1;
Main_Grid_3D(Start_Node) = 5;
Main_Grid_3D(End_Node) = 6;

[route] = Scoring_3D(Main_Grid_3D,Eight_Direction_Flag);










