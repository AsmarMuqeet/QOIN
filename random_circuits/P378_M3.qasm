OPENQASM 2.0;
include "qelib1.inc";
gate gate_P378 q0,q1,q2,q3,q4 { y q0; sxdg q0; sxdg q1; ry(1.4445156973928412) q1; rx(6.194071765553132) q3; rzz(1.4741224000133257) q4,q2; rxx(3.1223066515618307) q2,q3; p(3.6716554527532543) q4; }
qreg q[5];
creg c[3];
ccx q[2],q[1],q[4];
gate_P378 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
