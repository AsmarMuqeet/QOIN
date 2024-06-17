OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(3.5463605038074753) q1; cx q0,q1; h q1; }
gate gate_P398 q0,q1,q2,q3,q4,q5,q6 { sxdg q0; rz(3.5180655719971043) q0; sx q1; cu(6.241618558550016,1.564554536712698,0.4039189032453502,3.950571982713967) q2,q3; sdg q2; sxdg q5; rzx(3.5463605038074753) q5,q3; csx q4,q6; cswap q1,q6,q4; }
qreg q[7];
creg c[3];
cx q[1],q[2];
gate_P398 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
