OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(4.050412701040483) q1; cx q0,q1; h q1; }
gate gate_P667 q0,q1,q2,q3,q4,q5,q6 { rzx(4.050412701040483) q1,q0; u1(5.659646022536583) q0; sxdg q1; sxdg q4; z q4; csx q5,q3; s q3; rxx(0.3570433944694286) q6,q2; cy q2,q5; sxdg q6; }
qreg q[7];
creg c[3];
ccx q[0],q[2],q[3];
gate_P667 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
