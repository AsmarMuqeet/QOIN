OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(4.2228563247812625) q1; cx q0,q1; h q1; }
gate gate_P774 q0,q1,q2,q3,q4 { sx q1; cu1(4.201067634718754) q0,q2; h q0; s q0; rzx(4.2228563247812625) q2,q1; ry(2.159627658186997) q1; sxdg q2; x q3; ry(4.827076945256186) q4; crz(3.362637990795237) q3,q4; sdg q3; rx(5.028274504890382) q4; }
qreg q[5];
creg c[3];
cx q[0],q[1];
gate_P774 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
