
/* Create physical folders using options dlcreatedir and libname
*/
/*Switch the _startfolder path to suit your environment*/
%let _startfolder = /home/sasdemo;
options dlcreatedir;
libname folder "&_startfolder./sandbox";
libname folder "&_startfolder./sandbox/data_sources";
libname folder "&_startfolder./sandbox/data_sources/cas";
libname folder "&_startfolder./sandbox/data_sources/sas";






