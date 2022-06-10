function showPassword(){
    var tickbox = document.getElementById("tickbox");
    var password = document.getElementById("currentPassword");
    if(tickbox.checked == true){
        password.style.display = "block";
    }else{
        password.style.display = "none";
    }
}