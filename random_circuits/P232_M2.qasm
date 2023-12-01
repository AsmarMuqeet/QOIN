OPENQASM 2.0;
include "qelib1.inc";
gate xx_minus_yy(param0,param1) q0,q1 { rz(-3.018813447095631) q1; rz(-pi/2) q0; sx q0; rz(pi/2) q0; s q1; cx q0,q1; ry(2.6606651376638064) q0; ry(-2.6606651376638064) q1; cx q0,q1; sdg q1; rz(-pi/2) q0; sxdg q0; rz(pi/2) q0; rz(3.018813447095631) q1; }
gate ryy_139921317473248(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(0.7110304963751816) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(3.82709932843551) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate gate_P232 q0,q1,q2,q3,q4,q5,q6 { z q1; ryy(3.82709932843551) q0,q2; cu3(0.6043406462222788,5.15608009000365,3.5032066607854246) q0,q1; id q0; z q1; u2(0.5387501974294732,0.3220882359180273) q2; rxx(4.504721683271219) q4,q3; x q4; ryy_139921317473248(0.7110304963751816) q4,q2; rz(2.2408541977003993) q5; rz(4.289622601598422) q5; s q5; x q6; xx_minus_yy(5.321330275327613,3.018813447095631) q6,q3; sxdg q3; rx(3.660624655300574) q6; }
qreg q[7];
creg c[3];
ccx q[2],q[0],q[3];
gate_P232 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
