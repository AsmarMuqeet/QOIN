OPENQASM 2.0;
include "qelib1.inc";
qreg q[7];
creg c[3];
rx(2.934184889629614) q[0];
cy q[3],q[2];
ry(3.6057912398140535) q[3];
rx(5.267778616127565) q[4];
ry(3.5279934957653714) q[4];
rz(1.2009208493491756) q[4];
cz q[1],q[5];
ccx q[1],q[2],q[0];
u(5.602600811854975,2.6728350714835893,6.164203936562734) q[1];
sdg q[2];
rx(1.4699450931126041) q[5];
ccx q[5],q[3],q[0];
id q[6];
u(1.539813970687149,0.9470639689047106,1.4297209699578894) q[6];
sxdg q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
