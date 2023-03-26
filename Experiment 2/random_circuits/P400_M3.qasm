OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(4.725143132007959) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate gate_P400 q0,q1,q2,q3,q4 { sx q2; cu(3.0675211659339094,5.642155361058741,0.13352364096625882,2.7640434638462623) q0,q3; sx q0; rxx(1.276871937813459) q2,q3; ryy(4.725143132007959) q4,q1; y q1; u3(1.9519918178767337,5.411961386661885,5.675272597696511) q4; }
qreg q[5];
creg c[3];
cx q[0],q[1];
gate_P400 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
