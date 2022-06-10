function showPassword(){
    var tickbox = document.querySelector(".tickbox");
    var password = document.querySelector(".currentPassword");
    if(tickbox.checked == true){
        password.style.display = "block";
    }else{
        password.style.display = "none";
    }
}