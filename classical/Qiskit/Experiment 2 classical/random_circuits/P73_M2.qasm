OPENQASM 2.0;
include "qelib1.inc";
gate gate_P73 q0,q1,q2,q3,q4 { y q0; tdg q0; y q1; u(4.928794756570467,4.374327218981235,2.409953522727117) q1; y q2; u3(1.8716707131436614,5.176488165586423,2.228847239635164) q3; x q4; ccx q2,q4,q3; }
qreg q[5];
creg c[3];
cx q[0],q[1];
gate_P73 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
