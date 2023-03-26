OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(2.94103655001391) q1; cx q0,q1; h q1; }
gate gate_P60 q0,q1,q2,q3,q4 { ry(0.5209920214692579) q0; rx(5.277287393091537) q0; csx q2,q3; y q2; rzx(2.94103655001391) q4,q1; sx q1; cu1(1.9987556951459293) q4,q3; }
qreg q[5];
creg c[3];
ccx q[2],q[1],q[0];
gate_P60 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
