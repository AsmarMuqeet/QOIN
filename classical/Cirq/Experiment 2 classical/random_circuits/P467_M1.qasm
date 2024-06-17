OPENQASM 2.0;
include "qelib1.inc";
gate iswap q0,q1 { s q0; s q1; h q0; cx q0,q1; cx q1,q0; h q1; }
gate rzx_139921317534016(param0) q0,q1 { h q1; cx q0,q1; rz(4.474568421060854) q1; cx q0,q1; h q1; }
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(3.4350339027216044) q1; cx q0,q1; h q1; }
gate gate_P467 q0,q1,q2,q3,q4 { u1(2.2465374018818873) q0; z q1; ry(6.267793032354879) q2; sdg q2; cy q4,q3; swap q0,q3; tdg q0; cu(1.1961654191369404,1.6039614632076657,3.7981922600636966,6.028136820662898) q1,q4; tdg q1; rx(1.0053237167393554) q1; sx q3; u2(5.592734805150985,1.5712931248091586) q3; rzx(3.4350339027216044) q4,q2; t q2; s q2; rzz(2.73280990464437) q4,q0; rzx_139921317534016(4.474568421060854) q0,q1; iswap q3,q4; }
qreg q[5];
creg c[3];
cx q[2],q[1];
gate_P467 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
