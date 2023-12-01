OPENQASM 2.0;
include "qelib1.inc";
gate ryy_139921317241760(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(5.466861292722735) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(3.859246426759953) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate gate_P314 q0,q1,q2,q3,q4 { t q0; x q0; sxdg q1; ryy(3.859246426759953) q2,q3; cu3(3.5998011306918642,0.6034032830065201,4.692837909544816) q1,q3; s q1; p(2.4982345350348196) q2; ryy_139921317241760(5.466861292722735) q0,q2; t q3; rz(4.137387327038625) q4; sxdg q4; ry(2.8787941432786837) q4; }
qreg q[5];
creg c[3];
cx q[2],q[0];
gate_P314 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
