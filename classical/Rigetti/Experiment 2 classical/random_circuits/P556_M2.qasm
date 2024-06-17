OPENQASM 2.0;
include "qelib1.inc";
gate gate_P556 q0,q1,q2,q3,q4 { x q2; u(5.261060066420061,4.433483243792905,5.651557722957148) q2; sx q2; s q3; cswap q4,q1,q0; x q0; ry(2.127611156960477) q0; cx q3,q1; u(3.6638995990477436,5.6250857757944255,4.73481002234637) q1; ry(5.4449622401443225) q3; id q4; p(5.011360123446629) q4; }
qreg q[5];
creg c[3];
cx q[0],q[1];
gate_P556 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];