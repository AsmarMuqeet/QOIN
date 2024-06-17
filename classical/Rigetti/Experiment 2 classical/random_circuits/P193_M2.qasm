OPENQASM 2.0;
include "qelib1.inc";
gate gate_P193 q0,q1,q2,q3,q4 { cswap q2,q1,q3; y q1; u3(4.964751127063302,0.4034299895535302,3.186588504986507) q1; cu(3.1915246646987936,4.994397585108869,4.669112949003378,4.096633643706461) q0,q4; cx q2,q4; cu1(0.15454806303887172) q3,q0; s q0; cx q2,q3; sx q4; }
qreg q[5];
creg c[3];
cx q[2],q[0];
gate_P193 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
