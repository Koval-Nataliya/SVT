// Gmsh project created on Thu May 18 14:37:32 2023
SetFactory("OpenCASCADE");
//+
Point(1) = {0, 0, 0, 1.0};
//+
Point(2) = {1, 0, 0, 1.0};
//+
Point(3) = {1, 1, 0, 1.0};
//+
Point(4) = {0, 1, 0, 1.0};
//+
Line(1) = {4, 3};
//+
Line(2) = {3, 2};
//+
Line(3) = {2, 1};
//+
Line(4) = {1, 4};
//+
Line(5) = {4, 2};
//+
Curve Loop(1) = {4, 5, 3};
//+
Plane Surface(1) = {1};
//+
Curve Loop(2) = {5, -2, -1};
//+
Plane Surface(2) = {2};
//+
Line(6) = {4, 2};
//+
Curve Loop(3) = {4, 6, 3};
//+
Plane Surface(3) = {3};
//+
Curve Loop(4) = {6, -2, -1};
//+
Plane Surface(4) = {4};
//+
Transfinite Curve {6} = 10 Using Progression 1;
//+
Transfinite Curve {1} = 20 Using Progression 0.5;
//+
Transfinite Curve {3} = 20 Using Progression 0.5;
//+
Transfinite Curve {2} = 20 Using Progression 1.5;
//+
Transfinite Curve {4} = 20 Using Progression 1.5;
//+
Transfinite Curve {6} = 40 Using Progression 1;
//+
Transfinite Curve {6} = 40 Using Progression 1;
//+
Transfinite Curve {1} = 20 Using Progression 0.5;
//+
Transfinite Curve {3} = 20 Using Progression 0.5;
//+
Transfinite Curve {2} = 20 Using Progression 1.5;
//+
Transfinite Curve {4} = 20 Using Progression 1.5;
//+
Transfinite Curve {1} = 20 Using Progression 1.5;
//+
Transfinite Curve {3} = 20 Using Progression 1.5;
//+
Transfinite Curve {4} = 20 Using Progression 0.5;
//+
Transfinite Curve {2} = 20 Using Progression 0.5;
//+
Transfinite Curve {6} = 40 Using Progression 1;
