OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(2.300928235920151) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate gate_P197 q0,q1,q2,q3,q4 { ccx q3,q0,q1; csx q0,q1; p(1.311144961349012) q0; s q1; cu1(1.3819558775607654) q4,q2; u1(0.7017049118394639) q2; ryy(2.300928235920151) q4,q3; rzz(1.0191454696658775) q3,q2; y q4; }
qreg q[5];
creg c[3];
cx q[2],q[1];
gate_P197 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
