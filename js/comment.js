
document.addEventListener("DOMContentLoaded", function (e) {
    const URL = "http://localhost/tp/api/comment";
    "use_strict";
  
    getData();
     async function getData(){    
        var productId =+window.location.href.split("/")[5];     
            const response = await fetch(`${URL}/${productId}`);
            if (response.ok) {
                const comments = await response.json();
                view(comments);
                          
            }else{
                console.log("error");
            }   
    }

    function view(comments){
        console.log(comments);
       let commmentContainner = document.querySelector(".comment-area");
       comments.forEach(comment => {
           commmentContainner.innerHTML += `
           <div class="comment-division">
           <div class="punctuation">
             <p class="comment"> Puntuacion: <span class="highlighted">${comment.punctuation}</span></p>
           </div>         
            <p class="comment"> Commentario: 
            ${comment.comment}</p>
           </div>`;
           
       });
    }
});