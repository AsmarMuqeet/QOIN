OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(5.31551195889247) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate iswap q0,q1 { s q0; s q1; h q0; cx q0,q1; cx q1,q0; h q1; }
gate gate_P75 q0,q1,q2,q3,q4,q5,q6 { p(1.264940816392935) q2; z q2; ry(4.522112471045802) q2; id q2; id q2; ccx q5,q0,q1; cswap q5,q0,q1; cp(3.6506977468873214) q1,q0; z q0; p(0.35031402486459695) q0; y q1; u(0.5146393827931453,5.452692508134663,1.8731276429341417) q1; cswap q4,q3,q6; p(1.4094412548138193) q4; csx q6,q3; cx q3,q4; iswap q3,q4; sdg q3; ryy(5.31551195889247) q5,q6; cu1(3.6234818044942383) q6,q5; csx q5,q4; ry(5.164184046879026) q6; }
qreg q[7];
creg c[3];
ccx q[0],q[1],q[3];
gate_P75 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
