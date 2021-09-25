document.addEventListener("DOMContentLoaded", function (e) {
    "use_strict";

    document.querySelector("#back-admin").addEventListener("click",back);

    function back(){
        let url = `/tp/admins`;
        window.location.href = url;
    }

});   