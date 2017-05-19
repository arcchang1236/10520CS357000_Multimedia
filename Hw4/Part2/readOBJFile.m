clear all
close all
%% Cylinder
numOFVert = 60;
vertsPolarAngle = linspace(0, 2*pi, numOFVert+1)';
vertsX = cos(vertsPolarAngle);
vertsY = sin(vertsPolarAngle);

% Define Vertices
topVerts = [];
topVertIndex = [];
botVerts = [];
botVertIndex = [];

top_mid = numOFVert+1;
bot_mid = numOFVert*2+2;

for i = 1 : numOFVert;
    topVerts = [topVerts; vertsX(i), vertsY(i), 0.5];
    topVertIndex = [topVertIndex; i];
    botVerts = [botVerts; vertsX(i), vertsY(i), -0.5];
    botVertIndex = [botVertIndex; top_mid+i];
end

topVerts = [topVerts; 0, 0, 0.5];
topVertIndex = [topVertIndex; top_mid];

botVerts = [botVerts; 0, 0, -0.5];
botVertIndex = [botVertIndex; bot_mid];

verts = [ topVerts; botVerts ];

% Define Colors
topColor = [];
botColor = [];

for i = 1 : numOFVert;
    topColor = [topColor; vertsPolarAngle(i)/(2*pi), 1, 1];
end
topColor = [topColor; 0, 0, 1];
for i = 1 : numOFVert;
    botColor = [botColor; vertsPolarAngle(i)/(2*pi), 1, 0];
end
botColor = [botColor; 0, 0, 0];
vertColors = [ topColor; botColor ];
vertColors = hsv2rgb(vertColors);

% Empty faces list
faces = [];

% Top faces
for i = 1 : numOFVert;
    if(i == numOFVert)
        faces = [faces; i, 1, top_mid];
    else
        faces = [faces; i, i+1, top_mid];
    end
end

% Side faces
for vertI = 1 : numOFVert;
	faceVert1 = topVertIndex( mod(vertI,numOFVert)+1 );
	faceVert2 = topVertIndex( vertI );
	faceVert3 = botVertIndex( vertI );
    faces = [ faces ; faceVert1, faceVert2, faceVert3];
end
for vertI = 1 : numOFVert;
	faceVert1 = topVertIndex( mod(vertI,numOFVert)+1 );
	faceVert2 = botVertIndex( vertI );
	faceVert3 = botVertIndex( mod(vertI,numOFVert)+1 );
    faces = [ faces ; faceVert1, faceVert2, faceVert3];
end
% Bottom faces
for i = 1 : numOFVert;
    if(i == numOFVert)
        faces = [faces; top_mid+i, top_mid+1, bot_mid];
    else
        faces = [faces; top_mid+i, top_mid+i+1, bot_mid];
    end
end

% Show RGB Cube in 3D figure
trisurf(faces,verts(:,1),verts(:,2),verts(:,3),'FaceVertexCData', vertColors,'FaceColor','interp', 'EdgeAlpha', 0);

%% show the obj file at 3D figure
al = fopen('al7KC.obj');

vertex_al = fscanf(al,'v %f %f %f %f %f %f\n',[6, Inf])';
faces_al = fscanf(al,'f %f %f %f\n',[3, Inf])';

vertexOBJ = vertex_al(:,1:3);
facesOBJ = faces_al;
colorsOBJ = vertex_al(:,4:6);
OBJnumVer = size(vertexOBJ(:,1));
OBJmax_x = -Inf;
OBJmax_y = -Inf;
OBJmax_z = -Inf;
OBJmin_x = Inf;
OBJmin_y = Inf;
OBJmin_z = Inf;
for i = 1 : OBJnumVer;
    if(vertexOBJ(i,1) > OBJmax_x)
        OBJmax_x = vertexOBJ(i,1);
    end
    if(vertexOBJ(i,1) < OBJmin_x)
        OBJmin_x = vertexOBJ(i,1);
    end
    
    if(vertexOBJ(i,2) > OBJmax_y)
        OBJmax_y = vertexOBJ(i,2);
    end
    if(vertexOBJ(i,2) < OBJmin_y)
        OBJmin_y = vertexOBJ(i,2);
    end
    
    if(vertexOBJ(i,3) > OBJmax_z)
        OBJmax_z = vertexOBJ(i,3);
    end
    if(vertexOBJ(i,3) < OBJmin_z)
        OBJmin_z = vertexOBJ(i,3);
    end
end

OBJmid_x = (OBJmax_x+OBJmin_x)/2;
OBJmid_y = (OBJmax_y+OBJmin_y)/2;
OBJmid_z = (OBJmax_z+OBJmin_z)/2;

for i = 1 : OBJnumVer;
    vertexOBJ(i,1) = vertexOBJ(i,1) - OBJmid_x;
    vertexOBJ(i,2) = vertexOBJ(i,2) - OBJmid_y;
    vertexOBJ(i,3) = vertexOBJ(i,3) - OBJmid_z;
end

%% Adding the HSV color cylinder onto the same world space as al7KC.obj, and then do some transformation
% (Hint) You can try to combine 2 objects' vertices, faces together
v(:, 1) = verts(:,1);
v(:, 2) = verts(:,2)+2.5;
v(:, 3) = verts(:,3)-2.5;

faces = faces + size(vertexOBJ,1);
BindF = [facesOBJ; faces];
BindV = [vertexOBJ; v];
BindC = [colorsOBJ; vertColors];

figure;
trisurf(BindF,BindV(:,1),BindV(:,2),BindV(:,3),'FaceVertexCData', BindC,'FaceColor','interp', 'EdgeAlpha', 0);

%% (d) Lighting Style
% Point light
figure;
trisurf(BindF,BindV(:,1),BindV(:,2),BindV(:,3),'FaceVertexCData', BindC,'FaceColor','interp', 'EdgeAlpha', 0);  
light('Position',[0.0,0.0,3.5], 'Style', 'local');
lighting phong;

% Directional light
figure;
trisurf(BindF,BindV(:,1),BindV(:,2),BindV(:,3),'FaceVertexCData', BindC,'FaceColor','interp', 'EdgeAlpha', 0);  
light('Position',[0.0,0.0,3.5], 'Style', 'infinite');
lighting phong;

%% (e) Lighting Material
figure;
trisurf(BindF,BindV(:,1),BindV(:,2),BindV(:,3),'FaceVertexCData', BindC,'FaceColor','interp', 'EdgeAlpha', 0);  
material([1.0 0.0 0.0]);
light('Position',[0.0,0.0,3.5]);
lighting phong;

figure;
trisurf(BindF,BindV(:,1),BindV(:,2),BindV(:,3),'FaceVertexCData', BindC,'FaceColor','interp', 'EdgeAlpha', 0);  
material([0.1 1.0 0.0]);
light('Position',[0.0,0.0,3.5]);
lighting phong;

figure;
trisurf(BindF,BindV(:,1),BindV(:,2),BindV(:,3),'FaceVertexCData', BindC,'FaceColor','interp', 'EdgeAlpha', 0);  
material([0.1 0.1 1.0]);
light('Position',[0.0,0.0,3.5]);
lighting phong;

figure;
trisurf(BindF,BindV(:,1),BindV(:,2),BindV(:,3),'FaceVertexCData', BindC,'FaceColor','interp', 'EdgeAlpha', 0);  
material([0.1 0.8 1.0]);
light('Position',[0.0,0.0,3.5]);
lighting phong;