OPENQASM 2.0;
include "qelib1.inc";
gate dcx q0,q1 { cx q0,q1; cx q1,q0; }
gate gate_P371 q0,q1,q2,q3,q4,q5,q6 { p(0.23064790907961824) q0; u3(2.280465311874209,5.875997776500978,3.81407498462894) q0; cu3(3.7195820789232066,0.8059551744875879,5.894744041229015) q2,q1; cu3(2.748961279097222,0.0337630508732891,0.9447222099167146) q1,q2; x q3; sxdg q4; tdg q5; dcx q5,q3; sxdg q6; ch q4,q6; }
qreg q[7];
creg c[3];
ccx q[0],q[2],q[1];
gate_P371 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
