(* ::Package:: *)

(* ::Input:: *)
(*ClearAll["Global`*"]*)
(*tabellacovid=Cases[Import["https://raw.githubusercontent.com/pcm-dpc/COVID-19/master/legacy/dati-andamento-nazionale/dpc-covid19-ita-andamento-nazionale.csv","CSV"] ,{_,__}];*)


(* ::Input:: *)
(*Partition[Riffle[Range[Length[tabellacovid[[1]]]],tabellacovid[[1]]],2]*)


(* ::Input:: *)
(*selectdata[n_]:= Drop[#[[n]]&/@tabellacovid,1]*)


(* ::Input:: *)
(*positivi =selectdata[12];*)
(*tamponi = selectdata[13];*)
(*\[CapitalDelta]positivi=selectdata[9];*)
(*\[CapitalDelta]tamponi= Differences[Join[{0},tamponi]];*)
(*\[CapitalDelta]perc=(\[CapitalDelta]positivi/\[CapitalDelta]tamponi)100. ;*)


(* ::Input:: *)
(*smoothTot = MovingMap[Mean,positivi,5];*)
(*smooth\[CapitalDelta]perc = MovingMap[Mean,\[CapitalDelta]perc,5];*)


(* ::Input:: *)
(*totPlot = DateListPlot[positivi,{2020,2,24},PlotStyle->{Thick}];*)
(*smoothTotPlot=DateListPlot[smoothTot,{2020,2,24},PlotStyle->{Orange,Dashed,Thick}];*)
(*Show[totPlot,smoothTotPlot]*)
(*percplot = DateListPlot[\[CapitalDelta]perc,{2020,2,24},PlotStyle->{Thick}];*)
(*smoothpercplot=DateListPlot[smooth\[CapitalDelta]perc,{2020,2,24},PlotStyle->{Orange,Dashed,Thick}];*)
(*Show[percplot,smoothpercplot]*)


(* ::Input:: *)
(*modello = Normal[NonlinearModelFit[positivi,k/(1+q E^(-r x)),{k,q,r},x]]*)
(*Dmodello = \!\( *)
(*\*SubscriptBox[\(\[PartialD]\), \(x\)]modello\)*)


(* ::Input:: *)
(*GraphicsRow[{Plot[modello,{x,0,200}],Plot[Dmodello,{x,0,200}]}]*)
