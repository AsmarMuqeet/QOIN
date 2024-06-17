OPENQASM 2.0;
include "qelib1.inc";
gate gate_P917 q0,q1,q2,q3,q4 { rz(3.4753268093897534) q0; x q0; cu1(2.1902954406421546) q2,q1; u2(3.831218286586828,6.2088581852810005) q1; tdg q2; ry(5.724927594826295) q3; u3(3.033817860030755,4.369492754997234,3.687720678783527) q3; sxdg q4; id q4; }
qreg q[5];
creg c[3];
cx q[0],q[1];
gate_P917 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
