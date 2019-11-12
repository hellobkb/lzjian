// JavaScript Document

function setTab(m,n){
 var tli=document.getElementById("menu"+m).getElementsByTagName("li");
 var mli=document.getElementById("main"+m).getElementsByTagName("ul");
 for(i=0;i<tli.length;i++){
 tli[i].className=i==n?"hovers":"";
  mli[i].style.display=i==n?"block":"none";
 }
}


function asetTab(m,n){
 var tli=document.getElementById("amenu"+m).getElementsByTagName("li");
 var mli=document.getElementById("amain"+m).getElementsByTagName("ul");
 for(i=0;i<tli.length;i++){
 tli[i].className=i==n?"hovers":"";
  mli[i].style.display=i==n?"block":"none";
 }
}


function bsetTab(m,n){
 var tli=document.getElementById("bmenu"+m).getElementsByTagName("li");
 var mli=document.getElementById("bmain"+m).getElementsByTagName("ul");
 for(i=0;i<tli.length;i++){
 tli[i].className=i==n?"hovers":"";
  mli[i].style.display=i==n?"block":"none";
 }
}


function csetTab(m,n){
 var tli=document.getElementById("cmenu"+m).getElementsByTagName("li");
 var mli=document.getElementById("cmain"+m).getElementsByTagName("ul");
 for(i=0;i<tli.length;i++){
 tli[i].className=i==n?"hovers":"";
  mli[i].style.display=i==n?"block":"none";
 }
}

function dsetTab(m,n){
 var tli=document.getElementById("dmenu"+m).getElementsByTagName("li");
 var mli=document.getElementById("dmain"+m).getElementsByTagName("ul");
 for(i=0;i<tli.length;i++){
 tli[i].className=i==n?"hovers":"";
  mli[i].style.display=i==n?"block":"none";
 }
}

function esetTab(m,n){
 var tli=document.getElementById("emenu"+m).getElementsByTagName("li");
 var mli=document.getElementById("emain"+m).getElementsByTagName("ul");
 for(i=0;i<tli.length;i++){
 tli[i].className=i==n?"hovers":"";
  mli[i].style.display=i==n?"block":"none";
 }
}