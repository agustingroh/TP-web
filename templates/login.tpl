 {include file='templates/header.tpl'} 

 <div>
    <form method="POST" action="signIn">         
        <input name="email" placeholder="email" type="email" required>
        <input name="password" placeholder="Contraseña" type="password" required>
        <button id="sign-in" type="submit">Ingresar</button>
    </form>       
</div> 

{include file='templates/footer.tpl'} 
