OPENQASM 2.0;
include "qelib1.inc";
gate gate_P18 q0,q1,q2,q3,q4 { u1(5.978478352212307) q0; y q0; sxdg q1; u3(1.1832439848471898,4.541086420838051,1.417290982271543) q1; z q1; rx(4.092173872569128) q2; t q3; sxdg q3; id q4; cu(0.18345186904120883,1.8130613728487015,1.550797274171233,1.9899524073355706) q4,q2; u(5.7386870786263335,3.509512703556187,5.760407623290613) q2; cswap q4,q3,q0; }
qreg q[5];
creg c[3];
ccx q[2],q[0],q[4];
gate_P18 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];