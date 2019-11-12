var re=/^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
var objExp=new RegExp(re);
function submitMsg1(){
	if(document.getElementById("full_namea").value=="Name" || document.getElementById("full_namea").value=="")
	{
	alert("Please enter your name.");
	return false; 
	}

	var str=document.getElementById("emaila").value;
	if(document.getElementById("emaila").value=="E-mail" || document.getElementById("emaila").value=="")
	{
	alert("Please enter your  E-mail."); 
	return false;
	}

    else if(objExp.test(str)==false)
	{
	alert("Please enter a valid E-mail."); 
	return false;
	}

	if(document.getElementById("msga").value=="Your Message" || document.getElementById("msga").value=="")
	{
	alert("Please enter your message."); 
	return false; 
	}
	
	if(document.getElementById("verifya").value=="CAPTCHA" || document.getElementById("verifya").value=="")
	{
	alert("Please enter CAPTCHA.");
	return false; 
	}
   
	return true;
}

function submitMsg2(){

	if(document.getElementById("full_nameb").value=="Name" || document.getElementById("full_nameb").value=="")
	{
	alert("Please enter your name.");
	return false; 
	}

	
	if(document.getElementById("emailb").value=="E-mail" || document.getElementById("emailb").value=="")
	{
	alert("Please enter your  E-mail."); 
	return false;
	}

	var str=document.getElementById("emailb").value;
	
    if(objExp.test(str)==false)
	{
	alert("Please enter a valid E-mail."); 
	return false;
	}
	if(document.getElementById("countryb").value=="Country" || document.getElementById("countryb").value=="")
	{
	alert("Please enter your country."); 
	return false; 
	}

	if(document.getElementById("msgb").value=="Your Message Here..." || document.getElementById("msgb").value=="")
	{
	alert("Please enter your message."); 
	return false; 
	}
	
	if(document.getElementById("verifyb").value=="CAPTCHA" || document.getElementById("verifyb").value=="")
	{
	alert("Please enter CAPTCHA.");
	return false; 
	}
   
	return true;
}

