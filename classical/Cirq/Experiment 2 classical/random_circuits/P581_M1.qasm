OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(2.697086061923389) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate gate_P581 q0,q1,q2,q3,q4,q5,q6 { ryy(2.697086061923389) q0,q1; sdg q1; id q2; rxx(2.2288711132040646) q0,q2; y q3; t q3; sx q4; t q4; h q5; s q6; cu3(5.315328544834259,3.941734456200525,5.115504464220521) q6,q5; }
qreg q[7];
creg c[3];
ccx q[2],q[0],q[1];
gate_P581 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
