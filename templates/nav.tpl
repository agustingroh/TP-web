<body>
  <header>  
        <div class="logo-brand-container">
        </div>
        <div class="nav-container">
            <nav class="navbar navbar-expand-lg navbar-light bg-light navbar navbar-dark bg-dark">
                <a class="navbar-brand" href="home"><i class="bi bi-laptop"></i></a>
                  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                  <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                  <ul class="navbar-nav">
                    <li class="nav-item active">
                      <a class="nav-link" href="home">Productos <span class="sr-only">(current)</span></a>
                    </li>  
                    <li id="nav-admin" class="nav-item {if $smarty.session.role ==1} show {else} hide {/if} ">                 
                      <a class="nav-link" href="admins">Administrador</a>
                    </li>                  
                  </ul>                    
                </div>        
                <div class="{if $smarty.session.role ==null  } show {else} hide {/if} ">        
                      <a href="registration" id="start-session" class="btn btn-success" role="button" >Iniciar sesion</a>
                </div>   
                <div class="{if $smarty.session.role!=null  } show {else} hide {/if} ">        
                      <a  class="btn btn-info" href="logOut" role="button" >Cerrar Sesion</a>
                </div>             
            </nav>            
        </div>       
  </header>