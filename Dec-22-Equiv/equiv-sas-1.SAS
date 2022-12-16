ods graphics on;

proc power;
   pairedmeans test=diff
      pairedmeans   = (70 80)
      pairedstddevs = (14 16)
      corr          = 0.5
      sides         = 1 2
      alpha         = 0.025
      npairs        = 100
      power         = .;
   plot x=n min=50 max=200;
run;

ods graphics off;


proc power;
   pairedmeans test=equiv_add
      lower         = -10
      upper         = 10
      pairedmeans   = (70 80)
      pairedstddevs = (14 16)
      corr          = 0.5
      alpha         = 0.025
      npairs        = 100
      power         = .;
run;


data asthma;
   input Drug1 $ Drug2 $ PEF1 PEF2 @@;
   datalines;
for sal 310 270   for sal 310 260  for sal 370 300
for sal 410 390   for sal 250 210  for sal 380 350
for sal 330 365
sal for 370 385   sal for 310 400  sal for 380 410
sal for 290 320   sal for 260 340  sal for 90  220
;

ods graphics on;

proc ttest data=asthma plots=interval;
   var PEF1 PEF2 / crossover= (Drug1 Drug2);
run;

ods graphics off;