OPENQASM 2.0;
include "qelib1.inc";
gate gate_P80 q0,q1,q2,q3,q4 { u2(3.8846381002688686,0.8561153539597818) q0; swap q2,q1; csx q2,q1; u2(3.0805811764651634,4.704672631266724) q3; t q3; h q4; cp(4.980037863184775) q4,q0; }
qreg q[5];
creg c[3];
cx q[2],q[1];
gate_P80 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
