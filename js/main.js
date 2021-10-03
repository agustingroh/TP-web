document.addEventListener("DOMContentLoaded", function (e) {
    "use_strict";

    window.addEventListener('click', (e)=>{    
        if (!e.target.matches('#drop-btn')) 
            document.getElementById("myDropdown").classList.remove("show");
    });
       
    
    document.querySelector("#drop-btn").addEventListener("click",openDropDown);
    function openDropDown(){  
      document.getElementById("myDropdown").classList.toggle("show");
    }

});