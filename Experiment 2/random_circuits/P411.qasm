OPENQASM 2.0;
include "qelib1.inc";
qreg q[5];
creg c[3];
cu1(1.2067239241550731) q[0],q[2];
t q[2];
cu(3.2764575623889325,6.226559420241059,2.355690166349253,1.9755443865047322) q[3],q[1];
cu3(6.105949134676554,6.2483537013352395,6.0187334251589695) q[1],q[0];
id q[3];
z q[4];
sx q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
