OPENQASM 2.0;
include "qelib1.inc";
gate xx_minus_yy(param0,param1) q0,q1 { rz(-2.7295447510010113) q1; rz(-pi/2) q0; sx q0; rz(pi/2) q0; s q1; cx q0,q1; ry(1.1897243835253553) q0; ry(-1.1897243835253553) q1; cx q0,q1; sdg q1; rz(-pi/2) q0; sxdg q0; rz(pi/2) q0; rz(2.7295447510010113) q1; }
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(3.2417058933867415) q1; cx q0,q1; h q1; }
gate gate_P4 q0,q1,q2,q3,q4 { rz(2.181015117753745) q1; sdg q2; cz q2,q1; s q1; h q2; rzx(3.2417058933867415) q1,q2; cswap q0,q4,q3; ccx q0,q3,q4; t q0; sdg q0; xx_minus_yy(2.3794487670507105,2.7295447510010113) q4,q3; s q3; u3(0.8395587283523901,1.0145801794512985,5.992223750399061) q4; }
qreg q[5];
creg c[3];
cx q[2],q[0];
gate_P4 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
