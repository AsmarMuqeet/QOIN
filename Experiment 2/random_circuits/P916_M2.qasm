OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(0.5839429217198983) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate gate_P916 q0,q1,q2,q3,q4 { u(1.8066665133117157,0.3409594754502148,0.3395244461376484) q1; rz(3.513068026296933) q1; id q1; h q2; s q2; u(3.4051446176912346,1.0118023415616395,1.8296142023450255) q3; csx q0,q4; sxdg q0; cz q0,q2; cu3(4.588241232245813,5.419259729862925,4.424900620510443) q3,q4; ryy(0.5839429217198983) q4,q3; }
qreg q[5];
creg c[3];
cx q[2],q[1];
gate_P916 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
