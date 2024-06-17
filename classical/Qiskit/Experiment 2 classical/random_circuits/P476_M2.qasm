OPENQASM 2.0;
include "qelib1.inc";
gate r(param0,param1) q0 { u3(2.9948468715269696,2.2004819288866546,-2.2004819288866546) q0; }
gate gate_P476 q0,q1,q2,q3,q4,q5,q6 { u(0.6985075149510324,3.6858197492064027,3.376316174361561) q0; u3(4.293894263865931,2.70269854582921,0.6229416823207152) q1; z q1; sdg q2; t q2; ry(1.6017795486924877) q3; cp(4.852558015884013) q3,q0; cswap q5,q6,q4; r(2.9948468715269696,3.771278255681551) q4; ch q5,q6; }
qreg q[7];
creg c[3];
cx q[2],q[1];
gate_P476 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];