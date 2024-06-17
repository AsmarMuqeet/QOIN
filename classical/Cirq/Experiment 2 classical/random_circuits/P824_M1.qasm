OPENQASM 2.0;
include "qelib1.inc";
gate iswap q0,q1 { s q0; s q1; h q0; cx q0,q1; cx q1,q0; h q1; }
gate r(param0,param1) q0 { u3(5.558681409927383,0.11610295732141207,-0.11610295732141207) q0; }
gate gate_P824 q0,q1,q2,q3,q4,q5,q6 { s q1; s q1; r(5.558681409927383,1.6868992841163086) q1; cu(1.0789383150104614,5.458121928666109,3.8424706819802883,2.2537773354555304) q2,q3; sx q2; sxdg q2; rxx(2.215567368048846) q1,q2; t q4; rzz(5.142289071487544) q3,q4; sxdg q3; sx q4; cswap q5,q0,q6; p(0.7008867865082605) q0; sxdg q5; rxx(4.090939562777913) q0,q5; u2(1.1214416532307585,5.129451105458602) q0; iswap q4,q5; u(4.217101621167459,2.019946964640526,1.7108400184720094) q6; id q6; crx(6.10930507295479) q6,q3; }
qreg q[7];
creg c[3];
cx q[0],q[1];
gate_P824 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];