OPENQASM 2.0;
include "qelib1.inc";
gate gate_P906 q0,q1,q2,q3,q4 { tdg q0; u3(5.238523304178329,2.5284151237967114,0.8954874443984898) q0; ry(1.2984275701999028) q1; ry(4.116942918874559) q1; y q1; sx q3; rxx(4.455925698465639) q4,q2; ccx q3,q2,q4; ccx q2,q0,q3; ry(3.429467002630642) q4; }
qreg q[5];
creg c[3];
cx q[1],q[0];
gate_P906 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
