OPENQASM 2.0;
include "qelib1.inc";
gate r(param0,param1) q0 { u3(3.9919099042519743,3.1400382345265987,-3.1400382345265987) q0; }
qreg q[5];
creg c[3];
r(3.9919099042519743,4.710834561321495) q[0];
h q[0];
swap q[2],q[1];
cu1(5.915759532534876) q[4],q[3];
cswap q[2],q[3],q[1];
sx q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
