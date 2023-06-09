OPENQASM 2.0;
include "qelib1.inc";
gate r(param0,param1) q0 { u3(4.436522663895024,-1.3737585281952462,1.3737585281952462) q0; }
gate gate_P638 q0,q1,q2,q3,q4 { u2(4.073665637658629,1.7819540837363859) q0; r(4.436522663895024,0.19703779859965037) q0; tdg q2; u(2.561393444292221,4.58415775116764,3.808786109021239) q2; rx(2.1102272348477906) q3; p(5.914915597358274) q3; cz q1,q4; tdg q1; sxdg q4; }
qreg q[5];
creg c[3];
ccx q[1],q[0],q[2];
gate_P638 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
