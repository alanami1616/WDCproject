//code for drop down menu on icon
function MenuDropDown() {
    document.getElementById("Menu").classList.toggle("show");
  }

  // Close the dropdown if the user clicks outside of it
  window.onclick = function(event) {
    if (!event.target.matches('.icon')) {
      var dropdown = document.getElementsByClassName("menuContent");
      var i;
      for (i = 0; i < dropdown.length; i++) {
        var openDown = dropdown[i];
        if (openDown.classList.contains('show')) {
          openDown.classList.remove('show');
        }
      }
    }
  }
