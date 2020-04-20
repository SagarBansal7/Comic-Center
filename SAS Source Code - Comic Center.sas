
proc univariate data = Hobby;
	var comicBookAmount timeInStore purchaseAmount age numItems numVisits;
	histogram;
run;

ods graphics on;
proc cluster data=hobby method=average outtree=averagetree plots(maxpoints=30000);
var timeInStore purchaseamount age numItems numVisits;
copy comicBookAmount;
id customer;
run;
ods graphics off; 

proc tree data=averagetree out=newDat5 nclusters=5 horizontal;
copy timeInStore purchaseamount age numItems numVisits comicBookAmount;
id customer;
run;
proc means data=newDat5;
vars timeInStore purchaseamount age numItems numVisits comicBookAmount;
class cluster;
run;

proc tree data=averagetree out=newDat4 nclusters=4 horizontal;
copy timeInStore purchaseamount age numItems numVisits comicBookAmount;
id customer;
run;
proc means data=newDat4;
vars timeInStore purchaseamount age numItems numVisits comicBookAmount;
class cluster;
run;

proc tree data=averagetree out=newDat3 nclusters=3 horizontal;
copy timeInStore purchaseamount age numItems numVisits comicBookAmount;
id customer;
run;
proc means data=newDat3;
vars timeInStore purchaseamount age numItems numVisits comicBookAmount;
class cluster;
run;

proc tree data=averagetree out=newDat2 nclusters=2 horizontal;
copy timeInStore purchaseamount age numItems numVisits comicBookAmount;
id customer;
run;

proc means data=newDat2;
vars timeInStore purchaseamount age numItems numVisits comicBookAmount;
class cluster;
run;


proc anova data = newdat3;
	class cluster;
	model comicBookAmount = cluster;
run;
