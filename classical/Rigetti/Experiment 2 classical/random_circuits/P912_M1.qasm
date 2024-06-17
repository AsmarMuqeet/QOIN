OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(4.698456655749392) q1; cx q0,q1; h q1; }
gate gate_P912 q0,q1,q2,q3,q4,q5,q6 { rz(3.2441827359375495) q2; z q2; csx q3,q1; sx q4; cswap q0,q6,q5; cp(3.5733867250126057) q0,q1; rzx(4.698456655749392) q3,q6; rzz(3.9764566695361108) q4,q5; }
qreg q[7];
creg c[3];
ccx q[0],q[2],q[1];
gate_P912 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
