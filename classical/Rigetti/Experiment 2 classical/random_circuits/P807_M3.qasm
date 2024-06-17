OPENQASM 2.0;
include "qelib1.inc";
gate gate_P807 q0,q1,q2,q3,q4 { sx q0; u(2.135579263112694,6.212177486279083,5.201114064791244) q1; cz q0,q1; x q3; rxx(0.006741553094879452) q4,q2; u(4.379746418234262,1.7716959124117275,0.17760576006773335) q2; ch q4,q3; }
qreg q[5];
creg c[3];
cx q[0],q[1];
gate_P807 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
