OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(0.33043056293670625) q1; cx q0,q1; h q1; }
gate gate_P991 q0,q1,q2,q3,q4 { x q0; y q0; rzx(0.33043056293670625) q3,q2; u3(1.9793689249736175,5.22429863737089,6.124583104181602) q2; rz(4.839206949252805) q3; cu1(0.7521506698480848) q1,q4; y q1; s q4; }
qreg q[5];
creg c[3];
cx q[2],q[0];
gate_P991 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
