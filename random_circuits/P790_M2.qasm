OPENQASM 2.0;
include "qelib1.inc";
gate iswap q0,q1 { s q0; s q1; h q0; cx q0,q1; cx q1,q0; h q1; }
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(1.9082681843078457) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate gate_P790 q0,q1,q2,q3,q4,q5,q6 { tdg q0; p(2.555694116667435) q0; u3(2.5575890547987767,0.09070232475974448,5.425965875275019) q2; sx q2; x q3; sxdg q3; cu3(5.792414147244754,5.611223252386081,5.059271211115521) q5,q1; ryy(1.9082681843078457) q4,q6; iswap q5,q4; cu3(3.76448592899418,2.9745688383108346,4.231479525428342) q6,q1; }
qreg q[7];
creg c[3];
ccx q[2],q[1],q[4];
gate_P790 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
