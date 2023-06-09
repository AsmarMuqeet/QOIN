OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(4.851098963995963) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate r_139921335817648(param0,param1) q0 { u3(0.8363346267350731,-1.3709522355085872,1.3709522355085872) q0; }
gate r(param0,param1) q0 { u3(5.3481004480811425,4.07934533171862,-4.07934533171862) q0; }
gate gate_P729 q0,q1,q2,q3,q4 { tdg q1; id q1; r(5.3481004480811425,5.650141658513516) q2; t q2; cx q1,q2; r_139921335817648(0.8363346267350731,0.19984409128630923) q1; cswap q4,q3,q0; u1(3.1884086551056416) q0; s q0; ryy(4.851098963995963) q0,q2; x q3; ry(2.9205250927496773) q3; rx(4.2477609675707475) q3; x q4; id q4; u2(4.086629887241389,1.036302885054523) q4; }
qreg q[5];
creg c[3];
cx q[2],q[0];
gate_P729 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
