OPENQASM 2.0;
include "qelib1.inc";
gate r(param0,param1) q0 { u3(0.3041166326604945,4.317656262110108,-4.317656262110108) q0; }
qreg q[5];
creg c[3];
rxx(1.0060175461316678) q[1],q[0];
sdg q[0];
x q[2];
csx q[2],q[1];
h q[2];
cz q[3],q[4];
cu3(4.789636702709613,4.559720470291905,2.5954755288548723) q[4],q[3];
cp(1.833163531515424) q[0],q[4];
cu1(0.20606466026312587) q[0],q[2];
cz q[1],q[3];
tdg q[1];
x q[3];
r(0.3041166326604945,5.888452588905005) q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];