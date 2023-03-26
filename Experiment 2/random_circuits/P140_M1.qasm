OPENQASM 2.0;
include "qelib1.inc";
gate gate_P140 q0,q1,q2,q3,q4 { id q0; id q0; u2(0.676655705108078,4.185736897716846) q3; ccx q2,q1,q4; cu(2.378397330751929,0.6277330130373523,5.3288533890440615,4.072319844414853) q2,q4; cz q3,q1; }
qreg q[5];
creg c[3];
cx q[0],q[2];
gate_P140 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
