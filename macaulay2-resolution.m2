-- ============================================================
-- Minimal graded free resolution for a Q-Fano 3-fold example
-- ============================================================

-- Weighted polynomial ring
R = QQ[
  p111,p112,p121,p122,p211,p212,p221,p222,
  u1,u2,u3,
  x11,x12,x13,x21,x22,x23,
  Degrees => {
    1,1,1,1,1,1,1,1,
    2,2,2,
    1,1,1,1,1,1
  }
];

-- Define the ideal
I = ideal(
 -u1*x11 + p122*x12*x13 - p112*x13*x22 - p121*x12*x23 + p111*x22*x23,

 p222*x12*x13 - u1*x21 - p212*x13*x22 - p221*x12*x23 + p211*x22*x23,

 -u2*x12 + p212*x11*x13 - p112*x13*x21 - p211*x11*x23 + p111*x21*x23,

 p222*x11*x13 - p122*x13*x21 - u2*x22 - p221*x11*x23 + p121*x21*x23,

 p221*x11*x12 - u3*x13 - p121*x12*x21 - p211*x11*x22 + p111*x21*x22,

 p222*x11*x12 - p122*x12*x21 - p212*x11*x22 + p112*x21*x22 - u3*x23,

 u2*u3 - p212*p221*x11^2 + p211*p222*x11^2 - p122*p211*x11*x21
 + p121*p212*x11*x21 + p112*p221*x11*x21 - p111*p222*x11*x21
 - p112*p121*x21^2 + p111*p122*x21^2,

 u1*u3 - p122*p221*x12^2 + p121*p222*x12^2 + p122*p211*x12*x22
 - p121*p212*x12*x22 + p112*p221*x12*x22 - p111*p222*x12*x22
 - p112*p211*x22^2 + p111*p212*x22^2,

 u1*u2 - p122*p212*x13^2 + p112*p222*x13^2 + p122*p211*x13*x23
 + p121*p212*x13*x23 - p112*p221*x13*x23 - p111*p222*x13*x23
 - p121*p211*x23^2 + p111*p221*x23^2
);

-- Check weighted homogeneity
print "Degrees of generators:";
degrees gens I

-- Compute minimal graded free resolution
print "Computing resolution...";
F = res I;

-- Betti table
print "Betti table:";
betti F

-- Display resolution
print "Resolution:";
F