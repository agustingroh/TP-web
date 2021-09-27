
{include file='templates/header.tpl'} 

 <h1> {$product->component}</h1>

<div >
   <div>
      <h3>Descripcion: </h3>
      <p> {$product->description}</p>
   </div>
   <div>
      <h3>precio: </h3>
      <p> {$product->price}</p>
   </div>
   <div>
      <h3>marca: </h3>
      <p> {$product->brand_name}</p>
   </div>
   <a href="home">Volver</a>
</div>

{include file='templates/footer.tpl'}