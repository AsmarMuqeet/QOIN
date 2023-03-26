OPENQASM 2.0;
include "qelib1.inc";
gate r(param0,param1) q0 { u3(2.191082273889799,1.730951518709015,-1.730951518709015) q0; }
gate gate_P390 q0,q1,q2,q3,q4 { p(3.871913219744207) q0; r(2.191082273889799,3.3017478455039115) q0; p(5.003286125907654) q2; cx q3,q1; rzz(3.6541405897811567) q2,q1; x q4; csx q4,q3; }
qreg q[5];
creg c[3];
ccx q[2],q[1],q[4];
gate_P390 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
