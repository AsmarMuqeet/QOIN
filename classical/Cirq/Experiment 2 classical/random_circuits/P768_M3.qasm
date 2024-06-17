OPENQASM 2.0;
include "qelib1.inc";
gate gate_P768 q0,q1,q2,q3,q4,q5,q6 { ry(4.704548345449034) q1; tdg q3; cu3(5.5313999208154545,3.2454890070336586,1.6813809142739944) q4,q0; cp(1.2691291235060413) q3,q4; u(0.6391922442726544,0.5825422758915739,3.468248306905702) q4; z q5; ccx q0,q1,q5; cry(5.146976291848291) q5,q3; cx q6,q2; id q2; cx q0,q2; h q6; csx q6,q1; }
qreg q[7];
creg c[3];
ccx q[2],q[0],q[1];
gate_P768 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
