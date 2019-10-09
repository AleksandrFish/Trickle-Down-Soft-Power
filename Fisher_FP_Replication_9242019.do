*******************
*Main Text Figures*
*******************

use "/Users/Alex2/Desktop/Documents/GW Fall 2016/Russia Public Opinion Paper/TNPN/TrickleDown_FPA_data.dta", clear

***********************************
*Confidence in Putin with Controls*
***********************************

*United Kingdom
logit PutinBi i.pr1##i.year female age agesq i.unedu  if ccode ==200
margins pr1, at(year=(2012 2014 2015 2016 2017))
mplotoffset, offset(0.15) recast(connected) ci1opts(fintensity(30)) plotopt( msize(medium))  ///
title("Great Britain", margin(0 0 5 0) size(medium)  position(12) span) ///
ytitle("") xtitle("") saving(putin_uk, replace) scheme(538bw) ///
plot( , label("Non-AEP" "AEP" )) legend(pos(10) row(2) ring(0)) ///
xlabel(, nogrid) ///
ylabel(, nogrid) 
 
*France
logit PutinBi i.pr1##i.year female age agesq i.unedu   if ccode ==220
margins pr1, at(year=(2012 2014 2015 2016 2017))
mplotoffset, offset(0.15) recast(connected) ci1opts(fintensity(30)) plotopt( msize(medium)) ///
title("France", margin(0 0 5 0) size(medium)  position(12) span) ///
ytitle("") xtitle("") saving(putin_fra, replace) scheme(538bw) ///
plot( , label("Non-AEP" "AEP" )) legend(pos(10) row(2) ring(0)) ///
xlabel(, nogrid) ///
ylabel(, nogrid) 

*Germany
logit PutinBi i.pr1##i.year female age agesq i.unedu  if ccode ==255
margins pr1, at(year=(2012 2014 2015 2016 2017))
mplotoffset, offset(0.15) recast(connected) ci1opts(fintensity(30)) plotopt( msize(medium)) ///
title("Germany", margin(0 0 5 0) size(medium)  position(12) span) ///
ytitle("") xtitle("") saving(putin_ger, replace) scheme(538bw) ///
plot( , label("Non-AEP" "AEP" )) legend(pos(10) row(2) ring(0)) ///
xlabel(, nogrid) ///
ylabel(, nogrid) 

*Italy
logit PutinBi i.pr1##i.year female age agesq i.unedu   if ccode ==325
margins pr1, at(year=(2012 2014 2015 2016 2017))
mplotoffset, offset(0.15) recast(connected) ci1opts(fintensity(30))  plotopt( msize(medium)) ///
title("Italy", margin(0 0 5 0) size(medium)  position(12) span) ///
ytitle("") xtitle("") saving(putin_ita, replace) scheme(538bw) ///
plot( , label("Non-AEP" "AEP" )) legend(pos(10) row(2) ring(0)) ///
xlabel(, nogrid) ///
ylabel(, nogrid) 

grc1leg putin_uk.gph putin_fra.gph putin_ger.gph putin_ita.gph, ycommon iscale(0.8) l1("Predicted Probability", size(small)) /// 
title(Confidence in Vladimir Putin) ring(0) position(1)
graph export "line_country_putin2", as(eps) replace


*United Kingdom
logit  PutinBi i.pr1##i.year female age agesq i.unedu  if ccode ==200
margins, dydx(pr1) at(year=(2012 2014 2015 2016 2017))
marginsplot, yline(0, lcolor(gs7) lpattern(dash) lwidth(medthick))   ///
recastci(rline) /// 
xlabel(, nogrid) ///
ylabel(, nogrid) ///
ciopts(fcolor(gs12)   lpattern(dash) lwidth(medthick)) plotopt(msym(o) msize(vlarge)) ///
title("Great Britain", margin(0 0 5 0) size(medium)  position(12) span) scheme(538bw) ///
ytitle("") saving(uklinep, replace) yscale(range(-.1 0.3))

*France
logit PutinBi i.pr1##i.year female age agesq i.unedu  if ccode ==220
margins, dydx(pr1) at(year=(2012 2014 2015 2016 2017))
marginsplot, yline(0, lcolor(gs7) lpattern(dash) lwidth(medthick))   ///
recastci(rline) /// 
xlabel(, nogrid) ///
ylabel(, nogrid) ///
ciopts(fcolor(gs12)   lpattern(dash) lwidth(medthick)) plotopt(msym(o) msize(vlarge)) ///
title("France", margin(0 0 5 0) size(medium)  position(12) span) scheme(538bw) ///
ytitle("") saving(francelinep, replace) yscale(range(-.1 0.2))

*Germany
logit PutinBi i.pr1##i.year female age agesq i.unedu   if ccode ==255
margins, dydx(pr1) at(year=(2012 2014 2015 2016 2017))
marginsplot, yline(0, lcolor(gs7) lpattern(dash) lwidth(medthick))   ///
recastci(rline) /// 
xlabel(, nogrid) ///
ylabel(, nogrid) ///
ciopts(fcolor(gs12)   lpattern(dash) lwidth(medthick)) plotopt(msym(o) msize(vlarge)) ///
title("Germany", margin(0 0 5 0) size(medium)  position(12) span) scheme(538bw) ///
ytitle("") saving(germanylinep, replace) yscale(range(-.1 0.4))

*Italy
logit PutinBi i.pr1##i.year female age agesq i.unedu if ccode ==325
margins, dydx(pr1) at(year=(2012 2014 2015 2016 2017))
marginsplot, yline(0, lcolor(gs7) lpattern(dash) lwidth(medthick))   ///
recastci(rline) /// 
xlabel(, nogrid) ///
ylabel(, nogrid) ///
ciopts(fcolor(gs12)   lpattern(dash) lwidth(medthick)) plotopt(msym(o) msize(vlarge)) ///
title("Italy", margin(0 0 5 0) size(medium)  position(12) span)  scheme(538bw) ///
ytitle("") saving(italylinep, replace) yscale(range(-.1 0.2))
  
  
gr combine uklinep.gph francelinep.gph germanylinep.gph italylinep.gph, ycommon iscale(0.8) /// 
l1("Marginal Effect", size(small)) title(Confidence in Vladimir Putin)
graph export "putin_dydx2", as(eps) replace


****************************
*Favorability toward Russia*
****************************

*United Kingdom
logit SupportRussiaBi i.pr1##i.year female age agesq i.unedu  if ccode ==200
margins pr1, at(year=(2012 2013 2014 2015 2017))
mplotoffset, offset(0.15) recast(connected) ci1opts(fintensity(30)) plotopt( msize(medium))  ///
title("Great Britain", margin(0 0 5 0) size(medium)  position(12) span) ///
ytitle("") xtitle("") saving(putin_uk, replace) scheme(538bw) ///
plot( , label("Non-AEP" "AEP" )) legend(pos(10) row(2) ring(0)) ///
xlabel(, nogrid) ///
ylabel(, nogrid) 

*France
logit SupportRussiaBi i.pr1##i.year female age agesq i.unedu   if ccode ==220
margins pr1, at(year=(2012 2013 2014 2015 2017))
mplotoffset, offset(0.15) recast(connected) ci1opts(fintensity(30)) plotopt( msize(medium)) ///
title("France", margin(0 0 5 0) size(medium)  position(12) span) ///
ytitle("") xtitle("") saving(putin_fra, replace) scheme(538bw) ///
plot( , label("Non-AEP" "AEP" )) legend(pos(10) row(2) ring(0)) ///
xlabel(, nogrid) ///
ylabel(, nogrid) 

*Germany
logit SupportRussiaBi i.pr1##i.year female age agesq i.unedu  if ccode ==255
margins pr1, at(year=(2012 2013 2014 2015 2017))
mplotoffset, offset(0.15) recast(connected) ci1opts(fintensity(30)) plotopt( msize(medium)) ///
title("Germany", margin(0 0 5 0) size(medium)  position(12) span) ///
ytitle("") xtitle("") saving(putin_ger, replace) scheme(538bw) ///
plot( , label("Non-AEP" "AEP" )) legend(pos(10) row(2) ring(0)) ///
xlabel(, nogrid) ///
ylabel(, nogrid) 

*Italy
logit SupportRussiaBi i.pr1##i.year female age agesq i.unedu   if ccode ==325
margins pr1, at(year=(2012 2013 2014 2015 2017))
mplotoffset, offset(0.15) recast(connected) ci1opts(fintensity(30))  plotopt( msize(medium)) ///
title("Italy", margin(0 0 5 0) size(medium)  position(12) span) ///
ytitle("") xtitle("") saving(putin_ita, replace) scheme(538bw) ///
plot( , label("Non-AEP" "AEP" )) legend(pos(10) row(2) ring(0)) ///
xlabel(, nogrid) ///
ylabel(, nogrid) 

grc1leg putin_uk.gph putin_fra.gph putin_ger.gph putin_ita.gph, ycommon iscale(0.8) l1("Predicted Probability", size(small)) /// 
title(Favorability toward Russia) ring(0) position(1)
graph export "line_country_russia2", as(eps) replace

*United Kingdom
logit SupportRussiaBi i.pr1##i.year female age agesq i.unedu if ccode ==200
margins, dydx(pr1) at(year=(2012 2013 2014 2015 2017))
marginsplot, yline(0, lcolor(gs7) lpattern(dash) lwidth(medthick))   ///
recastci(rline) /// 
xlabel(, nogrid) ///
ylabel(, nogrid) ///
ciopts(fcolor(gs12)   lpattern(dash) lwidth(medthick)) plotopt(msym(o) msize(vlarge)) ///
title("Great Britain", margin(0 0 5 0) size(medium)  position(12) span) scheme(538bw) ///
ytitle("") xtitle("") saving(ukline, replace) yscale(range(-.1 0.3))
 
*France
logit SupportRussiaBi i.pr1##i.year female age agesq i.unedu  if ccode ==220
margins, dydx(pr1)  at(year=(2012 2013 2014 2015 2017))
marginsplot, yline(0, lcolor(gs7) lpattern(dash) lwidth(medthick))   ///
recastci(rline) /// 
xlabel(, nogrid) ///
ylabel(, nogrid) ///
ciopts(fcolor(gs12)   lpattern(dash) lwidth(medthick)) plotopt(msym(o) msize(vlarge)) ///
title("France", margin(0 0 5 0) size(medium)  position(12) span) scheme(538bw) ///
ytitle("") xtitle("") saving(franceline, replace) yscale(range(-.1 0.2))

*Germany
logit SupportRussiaBi i.pr1##i.year female age agesq i.unedu  if ccode ==255
margins, dydx(pr1)  at(year=(2012 2013 2014 2015 2017))
marginsplot, yline(0, lcolor(gs7) lpattern(dash) lwidth(medthick))   ///
recastci(rline) /// 
xlabel(, nogrid) ///
ylabel(, nogrid) ///
ciopts(fcolor(gs12)   lpattern(dash) lwidth(medthick)) plotopt(msym(o) msize(vlarge)) ///
title("Germany", margin(0 0 5 0) size(medium)  position(12) span) scheme(538bw) ///
ytitle("") xtitle("") saving(germanyline, replace) yscale(range(-.1 0.4))

*Italy
logit SupportRussiaBi i.pr1##i.year female age agesq i.unedu  if ccode ==325
margins, dydx(pr1)  at(year=(2012 2013 2014 2015 2017))
marginsplot, yline(0, lcolor(gs7) lpattern(dash) lwidth(medthick))   ///
recastci(rline) /// 
xlabel(, nogrid) ///
ylabel(, nogrid) ///
ciopts(fcolor(gs12)   lpattern(dash) lwidth(medthick)) plotopt(msym(o) msize(vlarge)) ///
title("Italy", margin(0 0 5 0) size(medium)  position(12) span)  scheme(538bw) ///
ytitle("") xtitle("") saving(italyline, replace) yscale(range(-.1 0.2))
 
gr combine ukline.gph franceline.gph germanyline.gph italyline.gph, ycommon iscale(0.8) /// 
l1("Marginal Effect", size(small)) title(Favorabilty Toward Russia)
graph export "russia_dydx2", as(eps) replace 


***************************************************
*Favorability toward United States - Dem. Controls*
***************************************************

*United Kingdom
logit SupportUSBi i.pr1##i.year female age agesq i.unedu if ccode ==200
margins, dydx(pr1) at(year=(2012/2017))
marginsplot, yline(0, lcolor(gs7) lpattern(dash) lwidth(medthick))   ///
recastci(rline) /// 
xlabel(, nogrid) ///
ylabel(, nogrid) ///
ciopts(fcolor(gs12)   lpattern(dash) lwidth(medthick)) plotopt(msym(o) msize(vlarge)) ///
title("Great Britain", margin(0 0 5 0) size(medium)  position(12) span) scheme(538bw) ///
ytitle("") xtitle("") saving(ukline, replace) yscale(range(-.1 0.3))
 
*France
logit SupportUSBi i.pr1##i.year female age agesq i.unedu if ccode ==220
margins, dydx(pr1) at(year=(2012/2017))
marginsplot, yline(0, lcolor(gs7) lpattern(dash) lwidth(medthick))   ///
recastci(rline) /// 
xlabel(, nogrid) ///
ylabel(, nogrid) ///
ciopts(fcolor(gs12)   lpattern(dash) lwidth(medthick)) plotopt(msym(o) msize(vlarge)) ///
title("France", margin(0 0 5 0) size(medium)  position(12) span) scheme(538bw) ///
ytitle("") xtitle("") saving(franceline, replace) yscale(range(-.1 0.2))

*Germany
logit SupportUSBi i.pr1##i.year female age agesq i.unedu if ccode ==255
margins, dydx(pr1) at(year=(2012/2017))
marginsplot, yline(0, lcolor(gs7) lpattern(dash) lwidth(medthick))   ///
recastci(rline) /// 
xlabel(, nogrid) ///
ylabel(, nogrid) ///
ciopts(fcolor(gs12)   lpattern(dash) lwidth(medthick)) plotopt(msym(o) msize(vlarge)) ///
title("Germany", margin(0 0 5 0) size(medium)  position(12) span) scheme(538bw) ///
ytitle("") xtitle("") saving(germanyline, replace) yscale(range(-.1 0.4))

*Italy
logit SupportUSBi i.pr1##i.year female age agesq i.unedu if ccode ==325
margins, dydx(pr1) at(year=(2012/2017))
marginsplot, yline(0, lcolor(gs7) lpattern(dash) lwidth(medthick))   ///
recastci(rline) /// 
xlabel(, nogrid) ///
ylabel(, nogrid) ///
ciopts(fcolor(gs12)   lpattern(dash) lwidth(medthick)) plotopt(msym(o) msize(vlarge)) ///
title("Italy", margin(0 0 5 0) size(medium)  position(12) span)  scheme(538bw) ///
ytitle("") xtitle("") saving(italyline, replace) yscale(range(-.1 0.2))

gr combine ukline.gph franceline.gph germanyline.gph italyline.gph, ycommon iscale(0.8) /// 
l1("Marginal Effect", size(small)) title(Favorabilty Toward United States)
graph export "us_dydx2", as(eps) replace 
 

******************************************
*Favorability toward NATO - Dem. Controls*
******************************************

*United Kingdom
logit SupportNatoBi i.pr1##i.year female age agesq i.unedu if ccode ==200
margins, dydx(pr1) at(year=(2012 2013 2015 2017))
marginsplot, yline(0, lcolor(gs7) lpattern(dash) lwidth(medthick))   ///
recastci(rline) /// 
xlabel(, nogrid) ///
ylabel(, nogrid) ///
ciopts(fcolor(gs12)   lpattern(dash) lwidth(medthick)) plotopt(msym(o) msize(vlarge)) ///
title("Great Britain", margin(0 0 5 0) size(medium)  position(12) span) scheme(538bw) ///
ytitle("") xtitle("") saving(ukline, replace) yscale(range(-.1 0.3))
 
*France
logit SupportNatoBi i.pr1##i.year female age agesq i.unedu if ccode ==220
margins, dydx(pr1) at(year=(2012 2013 2015 2017))
marginsplot, yline(0, lcolor(gs7) lpattern(dash) lwidth(medthick))   ///
recastci(rline) /// 
xlabel(, nogrid) ///
ylabel(, nogrid) ///
ciopts(fcolor(gs12)   lpattern(dash) lwidth(medthick)) plotopt(msym(o) msize(vlarge)) ///
title("France", margin(0 0 5 0) size(medium)  position(12) span) scheme(538bw) ///
ytitle("") xtitle("") saving(franceline, replace) yscale(range(-.1 0.2))

*Germany
logit SupportNatoBi i.pr1##i.year female age agesq i.unedu if ccode ==255
margins, dydx(pr1) at(year=(2012 2013 2015 2017))
marginsplot, yline(0, lcolor(gs7) lpattern(dash) lwidth(medthick))   ///
recastci(rline) /// 
xlabel(, nogrid) ///
ylabel(, nogrid) ///
ciopts(fcolor(gs12)   lpattern(dash) lwidth(medthick)) plotopt(msym(o) msize(vlarge)) ///
title("Germany", margin(0 0 5 0) size(medium)  position(12) span) scheme(538bw) ///
ytitle("") xtitle("") saving(germanyline, replace) yscale(range(-.1 0.4))

*Italy
logit SupportNatoBi i.pr1##i.year female age agesq i.unedu if ccode ==325
margins, dydx(pr1) at(year=(2012 2013 2015 2017))
marginsplot, yline(0, lcolor(gs7) lpattern(dash) lwidth(medthick))   ///
recastci(rline) /// 
xlabel(, nogrid) ///
ylabel(, nogrid) ///
ciopts(fcolor(gs12)   lpattern(dash) lwidth(medthick)) plotopt(msym(o) msize(vlarge)) ///
title("Italy", margin(0 0 5 0) size(medium)  position(12) span)  scheme(538bw) ///
ytitle("") xtitle("") saving(italyline, replace) yscale(range(-.1 0.2))
 
 
gr combine ukline.gph franceline.gph germanyline.gph italyline.gph, ycommon iscale(0.8) /// 
l1("Marginal Effect", size(small)) title(Favorabilty Toward NATO)
graph export "nato_dydx2", as(eps) replace 

******************************************
*Favorability toward China - Dem. Controls*
******************************************

*United Kingdom
logit SupportChinaBi i.pr1##i.year female age agesq i.unedu if ccode ==200
margins, dydx(pr1) at(year=(2012/2017))
marginsplot, yline(0, lcolor(gs7) lpattern(dash) lwidth(medthick))   ///
recastci(rline) ciopts(fcolor(gs12) lpattern(dash) lwidth(medthick)) plotopt(msym(o) msize(vlarge)) ///
xlabel(, nogrid) ///
ylabel(, nogrid) ///
title("Great Britain", size(large) position(12)) scheme(538bw) ///
ytitle("") saving(ukline, replace) yscale(range(-.1 0.3))
 
*France
logit SupportChinaBi i.pr1##i.year female age agesq i.unedu if ccode ==220
margins, dydx(pr1) at(year=(2012/2017))
marginsplot, yline(0, lcolor(gs7) lpattern(dash) lwidth(medthick))   ///
recastci(rline) ciopts(fcolor(gs12) lpattern(dash) lwidth(medthick)) plotopt(msym(o) msize(vlarge)) ///
xlabel(, nogrid) ///
ylabel(, nogrid) ///
title("France", size(large) position(12)) scheme(538bw) ///
ytitle("") saving(franceline, replace) yscale(range(-.1 0.2))

 *Germany
logit SupportChinaBi i.pr1##i.year female age agesq i.unedu if ccode ==255
margins, dydx(pr1) at(year=(2012/2017))
marginsplot, yline(0, lcolor(gs7) lpattern(dash) lwidth(medthick))   ///
recastci(rline) ciopts(fcolor(gs12) lpattern(dash) lwidth(medthick)) plotopt(msym(o) msize(vlarge)) ///
xlabel(, nogrid) ///
ylabel(, nogrid) ///
title("Germany", size(large) position(12)) scheme(538bw) ///
ytitle("") saving(germanyline, replace) yscale(range(-.1 0.4))

 *Italy
logit SupportChinaBi i.pr1##i.year female age agesq i.unedu if ccode ==325
margins, dydx(pr1) at(year=(2012/2017))
marginsplot, yline(0, lcolor(gs7) lpattern(dash) lwidth(medthick))   ///
recastci(rline) ciopts(fcolor(gs12) lpattern(dash) lwidth(medthick)) plotopt(msym(o) msize(vlarge)) ///
xlabel(, nogrid) ///
ylabel(, nogrid) ///
title("Italy", size(large) position(12))  scheme(538bw) ///
ytitle("") saving(italyline, replace) yscale(range(-.1 0.2))
 
 
gr combine ukline.gph franceline.gph germanyline.gph italyline.gph, ycommon iscale(0.8) /// 
l1("Marginal Effect", size(small)) title(Favorability Toward China)
graph export "chinadydx_2", as(eps) replace

**************
*Blame Russia*
**************

mlogit blame3 pr1##i.c1  female age agesq i.unedu  
margins c1, dydx(pr1) predict(outcome(1)) //Pro-russian separatists
marginsplot, horiz xline(0, lcolor(black) lpattern(dash) lwidth(medthick) ) ///
recast(scatter) recastci(rspike) ciopts(fcolor(gs12)  lwidth(thick)) /// 
plotopt(msym(o) msize(vlarge)) ytitle("") xtitle("Marginal Effect") /// 
title("", size(large)) saving(blamerus1, replace) scheme(538bw)
graph export "blamemargins", as(eps) replace

***************************
*Arming Ukranian Goverment*
***************************

logit arm_ukraine pr1##i.c1  female age agesq i.unedu 
margins c1, dydx(pr1)
marginsplot, horiz xline(0, lcolor(black) lpattern(dash) lwidth(medthick)) ///
recast(scatter) recastci(rspike) ciopts(fcolor(gs12)  lwidth(thick)) /// 
plotopt(msym(o) msize(vlarge)) ytitle("") xtitle("Marginal Effect") /// 
title("", size(large)) saving(armukraine, replace) scheme(538bw)
graph export "armukraine", as(eps) replace

*********************
*Sanctions on Russia*
*********************

mlogit sanctions  pr1##i.c1  female age agesq i.unedu 
margins c1, dydx(pr1) predict(outcome(0))
marginsplot, horiz xline(0, lcolor(black) lpattern(dash) lwidth(medthick)) ///
recast(scatter) recastci(rspike) ciopts(fcolor(gs12)  lwidth(thick)) /// 
plotopt(msym(o) msize(vlarge) ) ytitle("") xtitle("Marginal Effect") /// 
title("", size(large)) saving(sanctions, replace) scheme(538bw)
graph export "sanctions", as(eps) replace

***************
*Summary Table*
***************

*Generate generation variable
*Cohorts
gen gen3 = 1 if age <30 & age >17
replace gen3 = 2 if age >29 & age <51
replace gen3 = 3 if age >50
label define gen3  1 "18-29" 2 "30-49" 3 "50+", replace
label values gen3 gen3
label variable gen3 "Age Cohort"

tabout PutinBi SupportRussiaBi SupportUSBi SupportNatoBi SupportChinaBi pr1 year female unedu gen3 using summarytable2.tex, /// 
replace  f(1c) oneway c(freq col) ///
style(tex) bt font(bold) topf(top.tex) botf(bot.tex)topstr(11cm) 


*************************
*Tables for Main figures*
*************************

*********************
*Confidence in Putin*
*********************

*Die Linke
logit PutinBi i.pr1##i.year female age agesq i.unedu  if ccode==255
 est sto die
 
*National Front
logit PutinBi i.pr1##i.year female age agesq i.unedu if ccode==220
 est sto fn
 
*UKIP
logit PutinBi i.pr1##i.year female age agesq i.unedu  if ccode==200
 est sto ukip
 
*Lega
logit PutinBi i.pr1##i.year female age agesq i.unedu  if ccode==325
 est sto lega
 
*CONTROLS SHOWN WIDE 
esttab  die fn ukip lega  ///
using multilevel.tex, b(%9.2f) se(%9.2f) label ///
title(Confidence in Putin - Logistic Regression\label{tab1}) /// 
addnotes(Note: Put your notes here.) nonum  ///
mtitles("Germany" "France" "Great Britain" "Italy") compress star(* 0.05)  replace ///
stats(N ll chi2 , labels("Observations" "Log Likelihood" "Chi-Squared") fmt(%9.0g)) ///
nobaselevels interaction(" X ") nogap collabels(,lhs(Fav. Russia)) wide  booktabs 

****************************
*Favorability Toward Russia*
****************************

*Die Linke
logit SupportRussiaBi i.pr1##i.year female age agesq i.unedu  if ccode==255
 est sto die
 
*National Front
logit SupportRussiaBi i.pr1##i.year female age agesq i.unedu  if ccode==220
 est sto fn
 
*UKIP
logit SupportRussiaBi i.pr1##i.year female age agesq i.unedu  if ccode==200
 est sto ukip
 
*Lega
logit SupportRussiaBi i.pr1##i.year female age agesq i.unedu  if ccode==325
 est sto lega
 
*CONTROLS SHOWN WIDE 
esttab  die fn ukip lega  ///
using multilevel.tex, b(%9.2f) se(%9.2f) label ///
title(Favorability towards Russia - Logistic Regression\label{tab1}) /// 
addnotes(Note: Put your notes here.) nonum  ///
mtitles("Germany" "France" "Great Britain" "Italy") compress star(* 0.05)  replace ///
stats(N ll chi2 , labels("Observations" "Log Likelihood" "Chi-Squared") fmt(%9.0g)) ///
nobaselevels interaction(" X ") nogap collabels(,lhs(Fav. Russia)) wide  booktabs 

*************************
*Favorability Toward U.S*
*************************

*Die Linke
logit SupportUSBi i.pr1##i.year female age agesq i.unedu  if ccode==255
 est sto die
 
*National Front
logit SupportUSBi i.pr1##i.year female age agesq i.unedu  if ccode==220
 est sto fn
 
*UKIP
logit SupportUSBi i.pr1##i.year female age agesq i.unedu  if ccode==200
 est sto ukip
 
*Lega
logit SupportUSBi i.pr1##i.year female age agesq i.unedu  if ccode==325
 est sto lega
 
*CONTROLS SHOWN WIDE 
esttab  die fn ukip lega  ///
using multilevel.tex, b(%9.2f) se(%9.2f) label ///
title(Favorability towards Russia - Logistic Regression\label{tab1}) /// 
addnotes(Note: Put your notes here.) nonum  ///
mtitles("Germany" "France" "Great Britain" "Italy") compress star(* 0.05)  replace ///
stats(N ll chi2 , labels("Observations" "Log Likelihood" "Chi-Squared") fmt(%9.0g)) ///
nobaselevels interaction(" X ") nogap collabels(,lhs(Fav. Russia)) wide  booktabs 

**************************
*Favorability Toward NATO*
*************************

*Die Linke
logit SupportNatoBi i.pr1##i.year female age agesq i.unedu  if ccode==255
 est sto die
 
*National Front
logit SupportNatoBi i.pr1##i.year female age agesq i.unedu  if ccode==220
 est sto fn
 
*UKIP
logit SupportNatoBi i.pr1##i.year female age agesq i.unedu  if ccode==200
 est sto ukip
 
*Lega
logit SupportNatoBi i.pr1##i.year female age agesq i.unedu  if ccode==325
 est sto lega
 
*CONTROLS SHOWN WIDE 
esttab  die fn ukip lega  ///
using multilevel.tex, b(%9.2f) se(%9.2f) label ///
title(Favorability towards Russia - Logistic Regression\label{tab1}) /// 
addnotes(Note: Put your notes here.) nonum  ///
mtitles("Germany" "France" "Great Britain" "Italy") compress star(* 0.05)  replace ///
stats(N ll chi2 , labels("Observations" "Log Likelihood" "Chi-Squared") fmt(%9.0g)) ///
nobaselevels interaction(" X ") nogap collabels(,lhs(Fav. Russia)) wide  booktabs 

***************************
*Favorability Toward China*
***************************

*Die Linke
logit SupportChinaBi i.pr1##i.year female age agesq i.unedu  if ccode==255
 est sto die
 
*National Front
logit SupportChinaBi i.pr1##i.year female age agesq i.unedu  if ccode==220
 est sto fn
 
*UKIP
logit SupportChinaBi i.pr1##i.year female age agesq i.unedu  if ccode==200
 est sto ukip
 
*Lega
logit SupportChinaBi i.pr1##i.year female age agesq i.unedu  if ccode==325
 est sto lega
 
*CONTROLS SHOWN WIDE 
esttab  die fn ukip lega  ///
using multilevel.tex, b(%9.2f) se(%9.2f) label ///
title(Favorability towards Russia - Logistic Regression\label{tab1}) /// 
addnotes(Note: Put your notes here.) nonum  ///
mtitles("Germany" "France" "Great Britain" "Italy") compress star(* 0.05)  replace ///
stats(N ll chi2 , labels("Observations" "Log Likelihood" "Chi-Squared") fmt(%9.0g)) ///
nobaselevels interaction(" X ") nogap collabels(,lhs(Fav. Russia)) wide  booktabs 




****************************
*Appendix Figures - Weights*
****************************

**********************************
*Confidence in Putin with Weights*
**********************************

*United Kingdom
logit  PutinBi i.pr1##i.year female age agesq i.unedu [pweight=weight] if ccode ==200
margins, dydx(pr1) at(year=(2012 2014 2015 2016 2017))
marginsplot, yline(0, lcolor(black) lpattern(dash) lwidth(medthick) ) recastci(rline) /// 
ciopts(fcolor(gs12)  lwidth(thick)) plotopt(msym(o) msize(vlarge)) ///
title("Great Britain", margin(0 0 5 0) size(medium)  position(12) span) scheme(538bw) ///
ytitle("") saving(uklinep, replace) yscale(range(-.1 0.3))

*France
logit PutinBi i.pr1##i.year female age agesq i.unedu [pweight=weight] if ccode ==220
margins, dydx(pr1) at(year=(2012 2014 2015 2016 2017))
marginsplot, yline(0, lcolor(black) lpattern(dash) lwidth(medthick) ) recastci(rline) /// 
ciopts(fcolor(gs12)  lwidth(thick)) plotopt(msym(o) msize(vlarge)) ///
title("France", margin(0 0 5 0) size(medium)  position(12) span) scheme(538bw) ///
ytitle("") saving(francelinep, replace) yscale(range(-.1 0.2))

*Germany
logit PutinBi i.pr1##i.year female age agesq i.unedu  [pweight=weight] if ccode ==255
margins, dydx(pr1) at(year=(2012 2014 2015 2016 2017))
marginsplot, yline(0, lcolor(black) lpattern(dash) lwidth(medthick) ) recastci(rline) /// 
ciopts(fcolor(gs12)  lwidth(thick)) plotopt(msym(o) msize(vlarge)) ///
title("Germany", margin(0 0 5 0) size(medium)  position(12) span) scheme(538bw) ///
ytitle("") saving(germanylinep, replace) yscale(range(-.1 0.4))

*Italy
logit PutinBi i.pr1##i.year female age agesq i.unedu [pweight=weight] if ccode ==325
margins, dydx(pr1) at(year=(2012 2014 2015 2016 2017))
marginsplot, yline(0, lcolor(black) lpattern(dash) lwidth(medthick) ) recastci(rline) /// 
ciopts(fcolor(gs12)  lwidth(thick)) plotopt(msym(o) msize(vlarge)) ///
title("Italy", margin(0 0 5 0) size(medium)  position(12) span)  scheme(538bw) ///
ytitle("") saving(italylinep, replace) yscale(range(-.1 0.2))
  
gr combine uklinep.gph francelinep.gph germanylinep.gph italylinep.gph, ycommon iscale(0.8) /// 
l1("Confidence in Vladimir Putin: Difference"  "Between AEP and non-AEP Supporters", size(small)) ///
note("{it:Note:} Models with probability weights. AEP refers to Die Linke voters in Germany, National Front voters in France, UKIP voters in Great Britain, and Lega Nord voters in Italy."  "Germany (N=4,901), France (N=4,958), Great Britain (4,944), and Italy (4,620). Estimated with logistic regression with demographic controls, AMEs with 95% CIs.", size(tiny) span)  saving(weightsgraphs.gph, replace)
graph export "putin_dydx_weight", as(eps) replace

****************************
*Favorability toward Russia*
****************************


*United Kingdom
logit SupportRussiaBi i.pr1##i.year female age agesq i.unedu [pweight=weight] if ccode ==200
margins, dydx(pr1) at(year=(2012 2013 2014 2015 2017))
marginsplot, yline(0, lcolor(black) lpattern(dash) lwidth(medthick) ) recastci(rline) /// 
ciopts(fcolor(gs12)  lwidth(thick)) plotopt(msym(o) msize(vlarge)) ///
title("Great Britain", margin(0 0 5 0) size(medium)  position(12) span) scheme(538bw) ///
 ytitle("") saving(ukline, replace) yscale(range(-.1 0.3))
 
*France
logit SupportRussiaBi i.pr1##i.year female age agesq i.unedu [pweight=weight] if ccode ==220
margins, dydx(pr1)  at(year=(2012 2013 2014 2015 2017))
marginsplot, yline(0, lcolor(black) lpattern(dash) lwidth(medthick) ) recastci(rline) /// 
ciopts(fcolor(gs12)  lwidth(thick)) plotopt(msym(o) msize(vlarge)) ///
title("France", margin(0 0 5 0) size(medium)  position(12) span) scheme(538bw) ///
 ytitle("") saving(franceline, replace) yscale(range(-.1 0.2))

*Germany
logit SupportRussiaBi i.pr1##i.year female age agesq i.unedu [pweight=weight] if ccode ==255
margins, dydx(pr1)  at(year=(2012 2013 2014 2015 2017))
marginsplot, yline(0, lcolor(black) lpattern(dash) lwidth(medthick) ) recastci(rline) /// 
ciopts(fcolor(gs12)  lwidth(thick)) plotopt(msym(o) msize(vlarge)) ///
title("Germany", margin(0 0 5 0) size(medium)  position(12) span) scheme(538bw) ///
 ytitle("") saving(germanyline, replace) yscale(range(-.1 0.4))

*Italy
logit SupportRussiaBi i.pr1##i.year female age agesq i.unedu [pweight=weight] if ccode ==325
margins, dydx(pr1)  at(year=(2012 2013 2014 2015 2017))
marginsplot, yline(0, lcolor(black) lpattern(dash) lwidth(medthick) ) recastci(rline) /// 
ciopts(fcolor(gs12)  lwidth(thick)) plotopt(msym(o) msize(vlarge)) ///
title("Italy", margin(0 0 5 0) size(medium)  position(12) span)  scheme(538bw) ///
 ytitle("") saving(italyline, replace) yscale(range(-.1 0.2))
 
*With NO IDEOLOGY CONTROL 
gr combine ukline.gph franceline.gph germanyline.gph italyline.gph, ycommon iscale(0.8) /// 
l1("Favorability toward Russia: Difference" "Between AEP and non-AEP Supporters", size(small)) ///
note("{it:Note:} Models with probability weights. AEP refers to Die Linke voters in Germany, National Front voters in France, UKIP voters in Great Britain, and Lega Nord voters in Italy." "Germany (N=4,802), France (N=4,978), Great Britain (N=4,080), and Italy (4,681). Estimated with logistic regression with demographic controls, AMEs with 95% CIs.", size(tiny) span) 
graph export "russia_dydx_weight", as(eps) replace



