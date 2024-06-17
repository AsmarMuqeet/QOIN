OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(0.8133209632074727) q1; cx q0,q1; h q1; }
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(4.123547862401432) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate r(param0,param1) q0 { u3(5.991892835438446,-0.9094141727974734,0.9094141727974734) q0; }
gate gate_P920 q0,q1,q2,q3,q4,q5,q6 { r(5.991892835438446,0.6613821539974232) q0; z q0; cx q1,q3; cp(1.4605813654930468) q1,q3; cu3(0.603527447354872,5.300271572569803,0.1457632125843718) q2,q4; rx(0.6969854533756349) q2; ryy(4.123547862401432) q6,q5; rzx(0.8133209632074727) q4,q5; p(4.963134936367806) q6; }
qreg q[7];
creg c[3];
cx q[2],q[0];
gate_P920 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
