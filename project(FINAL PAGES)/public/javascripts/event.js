
function addGuest(){
    var newGuest = document.createElement('input');
    newGuest.className = 'inputname';
    var div = document.getElementById("addGuests");
    div.appendChild(newGuest);
}

function removeGuests(){
    var div = document.getElementById("addGuests");
    while(div.children.length > 0){
        div.removeChild(div.children[0]);
    }

}