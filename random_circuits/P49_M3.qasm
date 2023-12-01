OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(3.937277184351206) q1; cx q0,q1; h q1; }
gate r(param0,param1) q0 { u3(5.274158276625099,-0.2925754929611579,0.2925754929611579) q0; }
gate gate_P49 q0,q1,q2,q3,q4,q5,q6 { t q1; cp(2.4143394086192935) q0,q2; csx q0,q1; r(5.274158276625099,1.2782208338337386) q2; sx q4; sxdg q4; h q5; tdg q5; rzx(3.937277184351206) q3,q6; cry(5.064684610493573) q6,q3; }
qreg q[7];
creg c[3];
ccx q[2],q[0],q[4];
gate_P49 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
