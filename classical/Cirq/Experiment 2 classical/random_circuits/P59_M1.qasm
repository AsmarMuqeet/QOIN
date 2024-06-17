OPENQASM 2.0;
include "qelib1.inc";
gate r(param0,param1) q0 { u3(4.350413834402926,0.2417970962843634,-0.2417970962843634) q0; }
gate gate_P59 q0,q1,q2,q3,q4,q5,q6 { csx q3,q1; tdg q3; cx q4,q0; ry(1.5902123654150244) q0; cu1(0.9490825551183825) q1,q4; cy q2,q5; u1(3.1053723285895978) q2; sdg q5; s q6; r(4.350413834402926,1.81259342307926) q6; }
qreg q[7];
creg c[3];
ccx q[1],q[0],q[3];
gate_P59 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
