OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(0.9430383264321522) q1; cx q0,q1; h q1; }
gate rzx_139921317956384(param0) q0,q1 { h q1; cx q0,q1; rz(5.733717690142625) q1; cx q0,q1; h q1; }
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(1.5779675078547513) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
qreg q[7];
creg c[3];
z q[0];
x q[1];
rxx(3.2065663731120106) q[1],q[0];
sdg q[0];
s q[1];
id q[2];
t q[2];
s q[3];
y q[3];
rx(0.023940478947206204) q[4];
rz(5.918252120930068) q[4];
u2(2.561865956958895,4.730840146619332) q[4];
cp(5.819963377573527) q[5],q[6];
rzx(0.9430383264321522) q[5],q[6];
rzx_139921317956384(5.733717690142625) q[2],q[5];
ryy(1.5779675078547513) q[6],q[3];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
