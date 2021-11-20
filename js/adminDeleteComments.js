document.addEventListener("DOMContentLoaded", function (e) {
    "use_strict";
    const URL = "http://localhost/tp/api/comment";

    async function getAllComments() {
        const response = await fetch(URL);
        if (response.ok) {
            const comments = await response.json();
            console.log(comments);
            showComments(comments);
            addEventToButtons();

        }

    }

    getAllComments();

    function showComments(comments) {
        const table = document.querySelector("#comment-section");
        table.innerHTML = "";

        comments.forEach(comment => {
            table.innerHTML += `<tr>
                                <td>${comment.email}</td>
                                <td>${comment.component}</td>
                                <td class="description-column"> ${comment.comment}</td>
                                <td>${comment.punctuation}</td>
                                <td><button class="delete-brand btn btn-danger deleteComment" id=${comment.id_comment}><i class="bi bi-trash"></i>Borrar</button></td>
                            </tr>
                            `;
        });

    }


    function addEventToButtons(){
        document.querySelectorAll(".deleteComment").forEach(button => {
            button.addEventListener("click",(e)=>{
              
                deleteComment(e.target.id);
            }
            );
        });

    }

    async function deleteComment(id){
        const response = await fetch(`${URL}/${id}`,{
            method: 'DELETE'           
        });

        console.log(response);

        if(response.ok){
            getAllComments();
        }

    }

});