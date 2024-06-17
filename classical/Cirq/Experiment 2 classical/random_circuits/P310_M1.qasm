OPENQASM 2.0;
include "qelib1.inc";
gate gate_P310 q0,q1,q2,q3,q4 { h q0; id q1; p(4.963815902270396) q2; cu(0.5556923104798067,4.458152502450218,4.732040617156989,5.7597215837690605) q2,q0; sx q3; u3(5.690141269092616,1.3283445249200634,2.2340760456069946) q3; tdg q4; swap q4,q1; }
qreg q[5];
creg c[3];
ccx q[2],q[1],q[4];
gate_P310 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
