function login(){
    let user = {
        email: document.getElementById('emailCont').value ,
        password: document.getElementById('passCont').value
    };

    console.log(user);
    let xhttp = new XMLHttpRequest();

    xhttp.onreadystatechange = function (){
        if(this.readyState == 4 && this.status == 200){
            alert("Login Successful");
            window.open("/calendar.html");
        }else if(this.readyState == 4 && this.status >= 400){
            alert("Login Failed");
        }
    };

    xhttp.open("POST", "/login");
    xhttp.setRequestHeader("Content-type", "application/json");
    xhttp.send(JSON.stringify(user));
}