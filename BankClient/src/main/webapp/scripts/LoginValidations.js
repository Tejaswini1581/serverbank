
function Validate() {
	var u=document.getElementById("userId").value;
	var p=document.getElementById("password").value;
	if(u.trim().length==0 || p.trim().length==0){
		/*alert("please enter username and password");*/
		document.getElementById("msg").innerText="please enter username and password";
		return false;		
	}
	else
		return true;
}