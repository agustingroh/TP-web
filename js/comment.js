document.addEventListener("DOMContentLoaded", function (e) {

    "use_strict";

    const URL = "http://localhost/tp/api/comment";

    document.querySelector("#comment-form").addEventListener("submit", (e) => {
        e.preventDefault();
        let data = getCommentData();
        postComment(data);
    });

    getData();
    async function getData() {
        var productId = +window.location.href.split("/")[5];
        const response = await fetch(`${URL}/${productId}`);
        if (response.ok) {
            const comments = await response.json();
            view(comments);

        } else {
            console.log("error");
        }
    }

    function view(comments) {    

        let commmentContainner = document.querySelector(".comment-area");
        commmentContainner.innerHTML = "";
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

    // TO DO GET FORM DATA 
    function getCommentData() {
        let comment = document.querySelector("#user-comment").value;
        let punctuation = document.querySelector("#user-punctuation").value;
        let data = {};
        data.comment = comment;
        data.punctuation = punctuation;
        data.productId = +window.location.href.split("/")[5];

        return data;
    }

    async function postComment(data) {
        console.log(data);
        try {
            const success = await fetch(URL, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                    'Accept': 'application/json'
                },
                body: JSON.stringify(data)
            });
            if (success) {
                getData();
            }
        } catch (error) {
            console.log(error);
        }
    }





});