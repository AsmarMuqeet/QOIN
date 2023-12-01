OPENQASM 2.0;
include "qelib1.inc";
qreg q[7];
creg c[3];
ry(4.704548345449034) q[1];
tdg q[3];
cu3(5.5313999208154545,3.2454890070336586,1.6813809142739944) q[4],q[0];
cp(1.2691291235060413) q[3],q[4];
u(0.6391922442726544,0.5825422758915739,3.468248306905702) q[4];
z q[5];
ccx q[0],q[1],q[5];
cry(5.146976291848291) q[5],q[3];
cx q[6],q[2];
id q[2];
cx q[0],q[2];
h q[6];
csx q[6],q[1];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];