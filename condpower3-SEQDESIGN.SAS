proc seqdesign boundaryscale=stdz
		plots=boundary(hscale=samplesize) errspend;
	TwoSidedOBrienFleming: design 
		method=obf alt=upper stop=reject nstages=2
		alpha=0.05 beta=0.15 info=cum(0.7, 1); 
	samplesize model=twosamplemean(stddev=3 meandiff=5);
	ods output Boundary=bound_ldl;
run;

ods graphics off;

data Data_1;
	_Scale_='MLE';
	_Stage_=1;
	mDiff=1;
run;

ods graphics on;
proc seqtest Boundary=bound_ldl
             Data(Testvar=mDiff)=Data_1
             infoadj=prop
             boundarykey=alpha
             boundaryscale=stdz
             condpower(cref=2);
   ods output Test=Test_Prop1;
run;
ods graphics off;
