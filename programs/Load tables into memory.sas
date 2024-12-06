cas casauto;
%let outcaslib=PUBLIC; 
%let incaslib=GTPPUB; 
%let path=/home/student/Courses/dqdashboard; 

proc cas;
	session casauto;
table.dropcaslib /caslib="&incaslib" quiet=true; 
table.addCaslib /
     caslib="&incaslib"
     description="Monitor data"
     dataSource={srctype="path"}
     path="&path/data";

	table.dropTable  /
		caslib= "&outcaslib",
		name= "ADDRESS",
		quiet= True;
	run;
	table.loadTable /   
		caslib= "&incaslib",        
		path="ADDRESS.xlsx",
		casout={
			caslib="&outcaslib",
			promote= True
			};
	run;
	table.dropTable  /
		caslib= "&outcaslib",
		name= "PERSON",
		quiet= True;
	run;
	table.loadTable /   
		caslib= "&incaslib",
		path="PERSON.xlsx",
		casout={
			caslib="&outcaslib",
			promote= True
			};
	run;
	table.dropTable  /
		caslib= "&outcaslib"
		name= "DQ_SCORE_HIST_RAW",
		quiet= True;
	run;
	table.loadTable /   
		caslib= "&incaslib",
		path="DQ_SCORE_HIST_RAW.xlsx",
		casout={
			caslib="&outcaslib",
			promote= True
			};
	run;
quit;