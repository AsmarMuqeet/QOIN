OPENQASM 2.0;
include "qelib1.inc";
gate r(param0,param1) q0 { u3(5.617855478600885,3.9441978368246726,-3.9441978368246726) q0; }
gate iswap q0,q1 { s q0; s q1; h q0; cx q0,q1; cx q1,q0; h q1; }
gate gate_P546 q0,q1,q2,q3,q4,q5,q6 { ry(1.599336714605351) q0; sdg q0; s q2; iswap q3,q4; r(5.617855478600885,5.514994163619569) q3; rx(5.546065311721825) q4; cu3(3.392590327897171,4.908069905418638,0.142134287162965) q5,q1; sxdg q1; tdg q5; z q6; csx q6,q2; }
qreg q[7];
creg c[3];
cx q[0],q[2];
gate_P546 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
