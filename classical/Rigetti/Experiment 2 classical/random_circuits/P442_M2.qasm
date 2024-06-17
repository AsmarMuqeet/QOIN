OPENQASM 2.0;
include "qelib1.inc";
gate r(param0,param1) q0 { u3(3.544290018715036,0.21380817563208243,-0.21380817563208243) q0; }
gate gate_P442 q0,q1,q2,q3,q4 { cx q0,q3; csx q3,q0; r(3.544290018715036,1.784604502426979) q3; cswap q1,q2,q4; sxdg q1; u(6.026806905686316,1.1962830137652245,5.15707982823332) q1; sx q2; sx q2; sdg q4; cu1(1.7121556014812533) q4,q0; }
qreg q[5];
creg c[3];
ccx q[2],q[1],q[3];
gate_P442 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
