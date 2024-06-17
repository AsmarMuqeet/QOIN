OPENQASM 2.0;
include "qelib1.inc";
gate gate_P108 q0,q1,q2,q3,q4 { id q0; z q0; sxdg q1; u(3.3920037863413,1.8010116721857607,0.7314849377667488) q3; rxx(4.590871038698669) q4,q2; cp(3.5452112004554497) q1,q2; crx(5.393516210387468) q4,q3; }
qreg q[5];
creg c[3];
ccx q[1],q[2],q[0];
gate_P108 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
