clear all; close all; clc;



Fig = figure();
% set(Fig, 'Name', 'Path Scoring Simulator', ... 
%     'NumberTitle', 'off', 'OuterPosition',get(0,'ScreenSize'), 'Resize', 'off');
% AXES = axes('Parent', Fig, ...
%     'Units','normalized',...
%     'Position',[0.045 0.045 0.512 0.946],...
%     'View',[30 10]);
set(Fig, 'Name', 'Path Scoring Simulator', ... 
    'NumberTitle', 'off', 'Position',[100 100 900 800]);
AXES = axes('Parent', Fig, ...
    'Units','normalized',...
    'Position',[0.1 0.1 0.85 0.85],...
    'View',[4 20]);






% Main_Grid_3D = 2*ones(10,10,10);     
Main_Grid_3D = 2*ones(30,30,30);

L1 = line('Parent',AXES,'XData',[],'YData',[],'ZData',[],'Marker','s','MarkerSize',10,'MarkerFaceColor','k','LineStyle','none');
xlabel('x-axis');ylabel('y-axis');zlabel('z-axis');
xlim([0 30]); ylim([0 30]); zlim([0 30]);
grid on;
hold on;
L2 = line('Parent',AXES,'XData',[],'YData',[],'ZData',[],'Marker','o','MarkerSize',15,'MarkerFaceColor','b');
L3 = line('Parent',AXES,'XData',[],'YData',[],'ZData',[],'Marker','s','MarkerSize',15,'MarkerFaceColor','r','MarkerEdgeColor','none','LineStyle','none');
L4 = line('Parent',AXES,'XData',[],'YData',[],'ZData',[],'Marker','s','MarkerSize',15,'MarkerFaceColor',[0.5 0.5 1.0],'MarkerEdgeColor','none','LineStyle','none');
L5 = line('Parent',AXES,'XData',[],'YData',[],'ZData',[],'Marker','o','MarkerSize',15,'MarkerFaceColor','g');
L6 = line('Parent',AXES,'XData',[],'YData',[],'ZData',[],'Marker','o','MarkerSize',15,'MarkerFaceColor','y');
L7 = line('Parent',AXES,'XData',[],'YData',[],'ZData',[],'Marker','d','MarkerSize',30,'MarkerFaceColor',[1.0 0.5 0.25]);

handles = struct('Fig',Fig,...
                 'AXES',AXES,...
                 'L1',L1,... %%... UserData reserved by handles
                 'L2',L2,...             
                 'L3',L3,...
                 'L4',L4,...
                 'L5',L5,...
                 'L6',L6,...
                 'L7',L7);
Main_Grid_3D(1:end,1:end,15) = 1;

% start_node = [20,20,2];
% dest_node =  [4,14,16];%[5,5,24]; %
% Main_Grid_3D(5,15,15) = 2;
% [Xhole,Yhole,Zhole] =  ind2sub(size(Main_Grid_3D),sub2ind(size(Main_Grid_3D),5,5,15));  set(handles.L7,'XData',Xhole,'YData',Yhole,'ZData',Zhole);

% start_node = [2,6,6];
% dest_node = [9,6,6];
% Main_Grid_3D(5,5,15) = 2;
% [Xhole,Yhole,Zhole] =  ind2sub(size(Main_Grid_3D),sub2ind(size(Main_Grid_3D),5,5,15));  set(handles.L7,'XData',Xhole,'YData',Yhole,'ZData',Zhole);

start_node = [randi(length(Main_Grid_3D)),randi(length(Main_Grid_3D)),2];
dest_node = [randi(length(Main_Grid_3D)),randi(length(Main_Grid_3D)),24];
Main_Grid_3D(randi(length(Main_Grid_3D)),randi(length(Main_Grid_3D)),15) = 2;



Main_Grid_3D(start_node(1,1),start_node(1,2),start_node(1,3)) = 5;
Main_Grid_3D(dest_node(1,1),dest_node(1,2),dest_node(1,3)) = 6;
[Xo,Yo,Zo] = ind2sub(size(Main_Grid_3D),find(Main_Grid_3D==1)); set(handles.L1,'XData',Xo,'YData',Yo,'ZData',Zo);
[Xs,Ys,Zs] = ind2sub(size(Main_Grid_3D),find(Main_Grid_3D==5)); set(handles.L5,'XData',Xs,'YData',Ys,'ZData',Zs);
[Xd,Yd,Zd] = ind2sub(size(Main_Grid_3D),find(Main_Grid_3D==6)); set(handles.L6,'XData',Xd,'YData',Yd,'ZData',Zd);
[Xhole,Yhole,Zhole] = ind2sub(size(Main_Grid_3D),find(Main_Grid_3D==6)); set(handles.L6,'XData',Xd,'YData',Yd,'ZData',Zd);
[route] = Scoring_3D(Main_Grid_3D,1);

[Xo,Yo,Zo] = ind2sub(size(Main_Grid_3D),find(Main_Grid_3D==1)); set(handles.L1,'XData',Xo,'YData',Yo,'ZData',Zo);
[Xp,Yp,Zp] = ind2sub(size(Main_Grid_3D),route); set(handles.L2,'XData',Xp,'YData',Yp,'ZData',Zp);
% [Xr,Yr,Zr] = ind2sub(size(Main_Grid_3D),find(Main_Grid_3D==3)); set(handles.L3,'XData',Xr,'YData',Yr,'ZData',Zr);
% [Xpp,Ypp,Zpp] = ind2sub(size(Main_Grid_3D),find(Main_Grid_3D==4)); set(handles.L4,'XData',Xpp,'YData',Ypp,'ZData',Zpp);
% [Xs,Ys,Zs] = ind2sub(size(Main_Grid_3D),find(Main_Grid_3D==5)); set(handles.L5,'XData',Xs,'YData',Ys,'ZData',Zs);
% [Xd,Yd,Zd] = ind2sub(size(Main_Grid_3D),find(Main_Grid_3D==6)); set(handles.L6,'XData',Xd,'YData',Yd,'ZData',Zd);
