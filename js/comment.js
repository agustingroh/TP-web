
document.addEventListener("DOMContentLoaded", function (e) {
   
    "use_strict";

    const URL = "http://localhost/tp/api/comment";

    document.querySelector("#comment-form").addEventListener("submit", (e)=>{
        e.preventDefault();
        sendComment();
    }); 
  
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

    async function sendComment(){
    
        let comment = document.querySelector("#user-comment").value;
        let punctuation = document.querySelector("#user-punctuation").value;

        console.log(comment);
        console.log(punctuation);

        let data = {};
        data.comment = comment;
        data.punctuation = punctuation;
        data.productId =+window.location.href.split("/")[5];  

     const success =  fetch(URL, {
            method: 'POST',
            headers: {'Content-Type': 'application/json'},          
            body: JSON.stringify(data) 
         })
         .then(response => {
             getData();
         })
         .catch(error => console.log(error));
    }


    
});