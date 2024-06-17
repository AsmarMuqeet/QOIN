OPENQASM 2.0;
include "qelib1.inc";
gate gate_P632 q0,q1,q2,q3,q4,q5,q6 { rx(4.820474279593775) q1; rz(5.3073489635332685) q2; x q2; cy q3,q0; rxx(1.4662868445182273) q4,q5; cu3(1.9910836632449656,3.560165351021422,5.225769091030201) q0,q4; rzz(0.5677453594420354) q5,q3; rx(0.47441919706642316) q6; swap q6,q1; }
qreg q[7];
creg c[3];
ccx q[1],q[0],q[3];
gate_P632 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
