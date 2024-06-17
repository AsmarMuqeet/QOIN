OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(3.7612047871025855) q1; cx q0,q1; h q1; }
gate gate_P651 q0,q1,q2,q3,q4 { s q2; rz(4.468110148918584) q2; x q2; rzx(3.7612047871025855) q0,q3; rx(5.716834207291609) q3; u2(4.0055155487368,3.792665346398875) q3; rzz(5.461618797521712) q1,q4; csx q1,q0; csx q0,q1; y q4; ry(5.324838016933715) q4; }
qreg q[5];
creg c[3];
cx q[0],q[1];
gate_P651 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
