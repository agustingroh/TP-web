
{include file='templates/header.tpl'} 
<ul>

{foreach from=$products item=$product}
   <li>{$product->component}, {$product->description}, {$product->price} </li> 
{/foreach}
</ul>



{include file='templates/footer.tpl'}