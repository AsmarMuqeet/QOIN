OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(2.656524602011422) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
qreg q[5];
creg c[3];
x q[2];
ryy(2.656524602011422) q[1],q[3];
h q[1];
u2(0.7938735067767786,0.3170361081046643) q[3];
cu(0.6633313534864085,5.951574686979489,0.803930291824823,0.7066157548146785) q[4],q[0];
rxx(1.886035068557184) q[0],q[2];
u3(4.987085512450965,3.3398179723742283,6.254421036933045) q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
