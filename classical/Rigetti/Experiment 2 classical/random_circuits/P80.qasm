OPENQASM 2.0;
include "qelib1.inc";
qreg q[5];
creg c[3];
u2(3.8846381002688686,0.8561153539597818) q[0];
swap q[2],q[1];
csx q[2],q[1];
u2(3.0805811764651634,4.704672631266724) q[3];
t q[3];
h q[4];
cp(4.980037863184775) q[4],q[0];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];