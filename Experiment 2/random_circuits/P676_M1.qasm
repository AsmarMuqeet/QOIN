OPENQASM 2.0;
include "qelib1.inc";
gate iswap q0,q1 { s q0; s q1; h q0; cx q0,q1; cx q1,q0; h q1; }
gate r(param0,param1) q0 { u3(3.7215403327681793,3.6287782285824335,-3.6287782285824335) q0; }
gate gate_P676 q0,q1,q2,q3,q4,q5,q6 { r(3.7215403327681793,5.19957455537733) q0; u3(0.826696449731001,4.304286764675614,4.3577330814453274) q2; t q3; rxx(3.222561292392845) q4,q1; cp(4.862946312468299) q1,q0; iswap q4,q3; sxdg q5; sxdg q5; h q6; rzz(2.344965264107867) q2,q6; }
qreg q[7];
creg c[3];
ccx q[2],q[1],q[4];
gate_P676 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
