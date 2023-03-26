OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(6.201080709091957) q1; cx q0,q1; h q1; }
gate gate_P773 q0,q1,q2,q3,q4,q5,q6 { tdg q0; tdg q1; rz(5.835715705024645) q1; rzx(6.201080709091957) q2,q3; u2(5.745828520409089,4.542205217778856) q2; sxdg q5; cp(5.075489137814696) q5,q0; csx q6,q4; cz q3,q6; u(1.4491055538491333,5.478815312464114,0.5285619164337019) q4; }
qreg q[7];
creg c[3];
ccx q[2],q[0],q[3];
gate_P773 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
