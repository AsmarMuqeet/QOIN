OPENQASM 2.0;
include "qelib1.inc";
gate gate_P928 q0,q1,q2,q3,q4 { sxdg q0; p(3.4368478636859834) q0; rx(5.020381226599674) q1; ry(2.4325562834177683) q1; rxx(1.8104418836760452) q3,q2; sxdg q2; sdg q4; cu(3.5708166809395996,3.5561624356621864,3.275706831063337,5.97495168335589) q3,q4; }
qreg q[5];
creg c[3];
ccx q[1],q[0],q[4];
gate_P928 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
