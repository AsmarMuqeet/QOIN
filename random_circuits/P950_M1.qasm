OPENQASM 2.0;
include "qelib1.inc";
gate gate_P950 q0,q1,q2,q3,q4,q5,q6 { z q3; y q4; sxdg q4; s q4; csx q5,q0; z q0; cswap q6,q2,q1; cswap q1,q2,q3; u2(1.8991779949999064,0.3664875426025711) q3; cu3(0.058984045457076,5.145125922371041,4.253835220233417) q6,q5; cu1(5.6845504121469075) q1,q5; cswap q6,q2,q0; }
qreg q[7];
creg c[3];
cx q[0],q[1];
gate_P950 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
