
<!-- <%@page contentType="text/html" pageEncoding="UTF-8"%> -->
<% String view = request.getParameter("view");  %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
   <style>
       
        .bg-primary {
            background-color: #50338d !important;
        }
        .table-dark{
            --bs-table-bg: #50338d !important;
        }
        .btn-primary{

            --bs-btn-bg:#50338d;
            --bs-btn-border-color: #50338d;
            --bs-btn-hover-bg: #50338d;
            --bs-btn-hover-border-color: #50338d;
            --bs-btn-active-bg: #50338d;
            --bs-btn-active-border-color: #50338d;
            --bs-btn-disabled-bg: #50338d;
            --bs-btn-disabled-border-color: #50338d;
        }
    </style>
        <title>Gestor Turnos</title>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">
                    <img src="https://darturnos.com/assets/images/icon.png" class="img-fluid" style="height: 30px;" alt="">
                    Gestor de Turnos</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item">
                            <a class="nav-link <%= ( view==null || view.isEmpty())? "active" : "" %>" aria-current="page" href="?view=">Inicio</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link <%= ( view!= null && view.equals("ciudadano")) ? "active":"" %>" href="?view=ciudadano">Ciudadanos</a>
                            
                        </li>
                        <li class="nav-item">
                            <a class="nav-link <%= ( view!= null && view.equals("turno")) ? "active":"" %>" href="?view=turno">Turnos</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="container-fluid mt-5">
            <div class="row">
                <div class="col-8 mx-auto">
                    <% if(view == null || view.isEmpty()) { %>
                    <div class="card shadow">
                        <div class="card-header bg-primary text-white">
                            <h1 class="h4 text-center">Bienvenido al Gestor de Turnos</h1>
                        </div>
                        <div class="card-body d-flex flex-column justify-content-center align-items-center">
                            <p class="lead">Accediendo a los paneles de <strong>Ciudadanos</strong> y <strong>Turnos</strong>, podrá ver y gestionar los turnos por ciudadano.</p>
                            <img src="https://scmlatam.com/wp-content/uploads/2023/07/Que-son-los-turnos-rotativos-.jpg" class="img-fluid w-50 " alt="Turnos">
                            <p>En cada sección tendrá un formulario y una tabla de visualización para facilitar la gestión de datos.</p>
                        </div>
                    </div>
                    <% } else if (view.equals("ciudadano")) { %>
                    
                    <jsp:include page="ciudadano.jsp" />
                    
                    <% } else if (view.equals("turno")) { %>
                     <jsp:include page="turno.jsp" />
                    <% } else { %>
                    <h1>ERROR</h1>
                    <% }%>
                    </div>
                </div>
            </div>
    </body>
</html>
