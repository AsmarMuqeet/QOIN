OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(2.5489996808932207) q1; cx q0,q1; h q1; }
gate gate_P486 q0,q1,q2,q3,q4 { z q0; u(4.713225155946213,5.573706028499519,2.9824214723724154) q1; z q2; cx q0,q2; z q3; h q3; u3(2.359035810511565,0.4208496755136595,4.38920567643539) q4; rzx(2.5489996808932207) q1,q4; }
qreg q[5];
creg c[3];
cx q[2],q[0];
gate_P486 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
