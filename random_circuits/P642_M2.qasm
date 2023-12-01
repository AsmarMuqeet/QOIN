OPENQASM 2.0;
include "qelib1.inc";
gate r(param0,param1) q0 { u3(3.9199595608427553,3.119397048525755,-3.119397048525755) q0; }
gate gate_P642 q0,q1,q2,q3,q4,q5,q6 { swap q2,q1; sdg q2; u1(6.27974063356816) q2; z q4; csx q0,q5; ccx q1,q4,q5; csx q4,q1; u3(3.742375389504668,4.031981149526664,3.567072327686214) q5; csx q3,q6; cx q3,q0; sxdg q3; r(3.9199595608427553,4.690193375320652) q6; rzz(6.141747072713517) q0,q6; }
qreg q[7];
creg c[3];
cx q[2],q[1];
gate_P642 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
