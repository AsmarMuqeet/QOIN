OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(3.5463605038074753) q1; cx q0,q1; h q1; }
qreg q[7];
creg c[3];
sxdg q[0];
rz(3.5180655719971043) q[0];
sx q[1];
cu(6.241618558550016,1.564554536712698,0.4039189032453502,3.950571982713967) q[2],q[3];
sdg q[2];
sxdg q[5];
rzx(3.5463605038074753) q[5],q[3];
csx q[4],q[6];
cswap q[1],q[6],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
