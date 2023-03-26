OPENQASM 2.0;
include "qelib1.inc";
gate gate_P129 q0,q1,q2,q3,q4,q5,q6 { ry(4.861884853199227) q0; id q0; p(1.9819889485557425) q1; rx(0.13507274229735677) q1; rz(2.8563190430705885) q2; id q3; sdg q4; rzz(0.43581528765099564) q2,q4; cu1(0.5350873113600497) q5,q6; crz(3.9436156991707825) q3,q5; p(4.631167989873332) q6; }
qreg q[7];
creg c[3];
cx q[0],q[2];
gate_P129 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
