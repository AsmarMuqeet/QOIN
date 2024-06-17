OPENQASM 2.0;
include "qelib1.inc";
gate gate_P277 q0,q1,q2,q3,q4 { ccx q0,q1,q3; u3(5.081615893210706,0.6610370695029222,2.6380569378427747) q3; cu3(5.544604239849851,3.063288938070302,6.127367706755834) q2,q4; cz q2,q1; cx q4,q0; }
qreg q[5];
creg c[3];
ccx q[2],q[0],q[4];
gate_P277 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
