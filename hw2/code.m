
% How to get transformation to Principal Axes using eigenvalue/eigenvector
% decomposition of an inertia matrix
% P. Axelrad 11/8/2020
% Example from class

Ig = [783.5  351.7  40.27;
      351.7  783.5 -80.27;
      40.27 -80.27  783.5]
  
[evec,eval]=eig(Ig)
% Look at these; they are not necessarily in any particular order
% The eigenvectors will be used as the basis (unit vectors) of the principal axis
% frame.  You can choose them in any order that creates a right-handed set 

p1 = evec(:,1);
p2 = evec(:,2);
p3 = cross(p1,p2); 

% Instead of choosing evec(:,3), use the cross product of 1 and2 to be sure that p's are RH
C = [p1';p2';p3']
                  %Construct the transformation matrix from B-frame to P-frame
                  % using "Method 3" that is, each row is a unit vector
                  % of the new frame (P) expressed in the old frame (B)
                  % To be really careful we should make sure that this
                  % matrix is properly orthonormal, but for now go with
                  % it
% Check that C converts Ig to the principal frame:
Ip = C*Ig*C'
% Check that C' converts the principal inertias back to the original Ig
C'*Ip*C
