OPENQASM 2.0;
include "qelib1.inc";
gate gate_P851 q0,q1,q2,q3,q4 { sx q0; x q2; s q2; cu3(2.367438136665342,0.25397531174368104,1.5885067451307293) q3,q1; ry(0.24321688866115584) q1; cu1(5.005553417166303) q1,q2; ry(1.4903758315616702) q1; id q2; tdg q4; cswap q3,q4,q0; sx q0; rx(2.5895918878227704) q0; tdg q3; rz(3.047459346380291) q3; t q4; h q4; }
qreg q[5];
creg c[3];
cx q[0],q[1];
gate_P851 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
