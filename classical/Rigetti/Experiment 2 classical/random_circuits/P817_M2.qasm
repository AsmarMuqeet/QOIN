OPENQASM 2.0;
include "qelib1.inc";
gate gate_P817 q0,q1,q2,q3,q4 { swap q1,q2; rx(3.306692699635329) q2; cz q3,q0; z q0; rxx(1.1035372336032134) q0,q2; cp(5.100535697305929) q3,q1; u3(5.471451330593957,0.2859773462365144,1.3250526740532949) q1; sx q3; ry(4.112305806637682) q4; x q4; sx q4; }
qreg q[5];
creg c[3];
cx q[0],q[1];
gate_P817 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
