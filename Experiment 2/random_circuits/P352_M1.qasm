OPENQASM 2.0;
include "qelib1.inc";
gate r(param0,param1) q0 { u3(6.083078307000404,-1.1026359295201105,1.1026359295201105) q0; }
gate gate_P352 q0,q1,q2,q3,q4 { u(3.2309368240287966,1.2870885652688802,4.987867062087236) q0; r(6.083078307000404,0.4681603972747861) q3; cswap q2,q4,q1; csx q0,q2; csx q3,q1; cu(2.5449473582402233,3.0903153705821635,1.6394205379723608,0.9168390065827785) q1,q3; sx q4; cswap q2,q4,q0; }
qreg q[5];
creg c[3];
cx q[1],q[2];
gate_P352 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
