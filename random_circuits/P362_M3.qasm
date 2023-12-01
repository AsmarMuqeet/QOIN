OPENQASM 2.0;
include "qelib1.inc";
gate r(param0,param1) q0 { u3(4.000531063260817,0.25396602338080054,-0.25396602338080054) q0; }
gate gate_P362 q0,q1,q2,q3,q4 { sdg q0; cp(5.897796439929972) q2,q1; rxx(5.174790713490665) q0,q1; u2(4.572834819298981,6.109083126419888) q3; cx q3,q2; x q4; r(4.000531063260817,1.824762350175697) q4; }
qreg q[5];
creg c[3];
cx q[2],q[0];
gate_P362 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
