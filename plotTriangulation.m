function plotTriangulation(mesh, h_ax)
%PLOTTRIANGULATION Plots a triangulated mesh
%
%   INPUTS:
%
%   mesh: mesh structure containing 'vertices' and 'faces' fields in
%       standard Matlab syntax
%   h_ax: axes handle to plot on (e.g. for subplots), gca is the default
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Archontis Politis, 1/11/2015
%   archontis.politis@aalto.fi
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if nargin<2
    h_ax = gca;
end

Nvert = size(mesh.vert,1);

ptch = patch('vertices', mesh.vert, 'faces', mesh.faces, ...
    'facecolor',[140, 201, 227]./255, 'facealpha', 0.7, ...
    'edgecolor', 0.3*[1 1 1], 'edgealpha', 0.8);
ptch.Annotation.LegendInformation.IconDisplayStyle = 'off'; 
axis equal
% number vertices
for i = 1:Nvert
    if Nvert<10
        temps(i,:) = sprintf('%i', i);
    elseif Nvert<100
        temps(i,:) = sprintf('%2i', i);
    elseif Nvert<1000
        temps(i,:) = sprintf('%3i', i);
    else
        temps(i,:) = sprintf('%5i', i);
    end
end
txtmesh = mesh.vert * 1.02; % text offset outward from origin
text(txtmesh(:,1), txtmesh(:,2), txtmesh(:,3)+max(abs(mesh.vert(:)))*0.02*sign(txtmesh(:,3)), temps, 'FontSize', 6);
% indicate cartesian axes
line([0;1.5], [0;0], [0;0], 'color', 'r', 'displayname', 'x', 'linewidth', 1.5)
line([0;-1.5], [0;0], [0;0], 'color', 'r', 'linestyle', ':', 'displayname', '-x', 'linewidth', 1.5)
line([0;0], [0;1.5], [0;0], 'color', 'g', 'displayname', 'y', 'linewidth', 1.5)
line([0;0], [0;-1.5], [0;0], 'color', 'g', 'linestyle', ':', 'displayname', '-y', 'linewidth', 1.5)
line([0;0], [0;0], [0;1.5], 'color', 'b', 'displayname', 'z', 'linewidth', 1.5)
line([0;0], [0;0], [0;-1.5], 'color', 'b', 'linestyle', ':', 'displayname', '-z', 'linewidth', 1.5)
set(gca,'visible','off')
set(findall(h_ax, 'type', 'text'), 'visible', 'on')
lighting gouraud
end

