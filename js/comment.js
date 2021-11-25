document.addEventListener("DOMContentLoaded", function (e) {

    "use_strict";

    const URL = "http://localhost/tp/api/comment";
    let count = 0;

    getData();

    document.querySelector("#sort").addEventListener("change", (e) => {

        getSortData(e.target.value);
    });

    document.querySelector("#filter-punctuation").addEventListener("change", (e) => {
        getCommentByPunctuation(e.target.value);
    });

    document.querySelector("#comment-form").addEventListener("submit", (e) => {
        e.preventDefault();
        let data = getCommentData();
        postComment(data);

    });


    async function getData() {

        try {
            var productId = +window.location.href.split("/")[5];
            if (productId){
                const response = await fetch(`${URL}/${productId}`);
                if (response.ok) {
                    const comments = await response.json();
                    if (comments.length > 0){
                        let textarea = document.querySelector("#user-comment");
                        textarea.value = "";
                        view(comments);
                    }
                    else
                        errorComment();

                } else {
                    errorComment();
                }
            }
        } catch (error) {
            errorComment();
        }
    }

    async function getSortData(sort) {
        try {
            const params = sort.split(" ");
            if (sort === "All")
                getData();
            else {
                var productId = +window.location.href.split("/")[5];
                const response = await fetch(`${URL}/${productId}/${params[0]}/${params[1]}`);
                if (response.ok) {
                    const comments = await response.json();
                    if (comments.length > 0)
                        view(comments);
                    else
                        errorComment();
                } else {
                    errorComment();
                }
            }
        } catch (error) {
            errorComment();
        }
    }

    function errorComment() {
        let commentContainner = document.querySelector(".comment-area");
        commentContainner.innerHTML = "";
        commentContainner.innerHTML = `<p class="empty-comment">No se encontraron comentarios sobre el producto</p>`;

    }

    function view(comments) {

        let commentContainner = document.querySelector(".comment-area");
        commentContainner.innerHTML = "";
        comments.forEach(comment => {
            commentContainner.innerHTML += `
           <div class="comment-division">
                <div class="punctuation">
                    <p class="comment"> Puntuacion: <span class="${getCommentStatus(comment.punctuation).class}">${getCommentStatus(comment.punctuation).status}</span><span>&nbsp&nbsp ${comment.date}</span></p>
                </div>         
            <p class="comment"> Comentario: ${comment.comment}</p>            
            </div>`;
        });


    }

    async function postComment(data) {
        const response = await fetch(URL, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                'Accept': 'application/json'
            },
            body: JSON.stringify(data)
        });
        if (response.ok) {
            getData();
        } else {
            console.log("error");
        }
    }


    function getCommentData() {
        let comment = document.querySelector("#user-comment").value;
        let punctuation = document.querySelector("#user-punctuation").value;
        let data = {};
        data.comment = comment;
        data.punctuation = punctuation;
        data.productId = +window.location.href.split("/")[5];
        return data;
    }


    async function getCommentByPunctuation(punctuation) {
        try {
            if (punctuation === "All")
                getData();
            else {
                const productId = +window.location.href.split("/")[5];
                const response = await fetch(`${URL}/${productId}/${punctuation}`);
                console.log(response);
                if (response.ok) {
                    const comments = await response.json();
                    console.log(comments);
                    if (comments.length > 0)
                        view(comments);
                    else
                        errorComment();
                }
            }
        } catch (error) {
            errorComment();
        }
    }

   

    function getCommentStatus(punctuation){
        const status =  {
            5: { status: "Excelente",
                class: "excelent"
            },  
            4: { status: "Muy bueno",
                class: "really-good"
            },
            3: { status: "Bueno",
                class: "good"},
            
            2: { status: "Regular",
                class: "regular"},
            
            1: { status: "Malo",
                class: "bad"}
        }
        return status[punctuation];
    }

});