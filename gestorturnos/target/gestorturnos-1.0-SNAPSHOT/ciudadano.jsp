<%@page import="java.util.List"%>
<%@page import="com.pruebatecnica2.gestorturnos.logica.Ciudadano"%>
<%@page import="com.pruebatecnica2.gestorturnos.logica.Ciudadano"%>

<%
    request.getRequestDispatcher("/SvCiudadano").include(request, response);
%>

<div class="row py-4 w-100">
    <div class="row w-100">
        <h1 class="text-center">Gestor Ciudadanos</h1>
        
    </div>
    <div class="col-6 d-flex justify-content-center align-content-center "> 
        <form action="SvCiudadano" method="POST" class="p-4 border rounded shadow-sm">
            <div class="row">
                <div class="col-md-6 mb-3">
                    <label for="dni" class="form-label">DNI</label>
                    <input type="text" class="form-control" id="dni" placeholder="Ingrese su DNI" name="dni" required>
                </div>
                <div class="col-md-6 mb-3">
                    <label for="telefono" class="form-label">Teléfono</label>
                    <input type="tel" class="form-control" id="telefono" placeholder="Ingrese su Teléfono" name="telefono" required>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 mb-3">
                    <label for="nombre" class="form-label">Nombre</label>
                    <input type="text" class="form-control" id="nombre" placeholder="Ingrese su Nombre" name="nombre" required>
                </div>
                <div class="col-6 mb-3">
                    <label for="apellido" class="form-label">Apellido</label>
                    <input type="text" class="form-control" id="apellido" placeholder="Ingrese su Apellido" name="apellidos" required>
                </div>
            </div>
            <div class="mb-3">
                <label for="direccion" class="form-label">Dirección</label>
                <input type="text" class="form-control" id="direccion" placeholder="Ingrese su Dirección" name="direccion" required>
            </div>
            <div class="text-end">
                <button type="submit" class="btn btn-primary">Guardar</button>
            </div>
        </form>
    </div>
    <div class="col-md-6 d-flex justify-content-center align-content-center text-center">
        
        <table class="table table-striped table-hover table-responsive p-4 border rounded shadow w-100">
            <thead class="table-dark text-center align-middle">
                <tr>
                    <th scope="col" class="w-25">DNI</th>
                    <th scope="col">Nombre</th>
                    <th scope="col">Apellido</th>
                    <th scope="col">Dirección</th>
                    <th scope="col">Teléfono</th>
                    
                </tr>
            </thead>
            <tbody>
                <% 
                    
                List<Ciudadano> listCiudadano = (List)request.getSession().getAttribute("listCiudadanos");
                if(listCiudadano != null){
                for(Ciudadano c : listCiudadano){ %>
                      <tr class="text-center align-middle">
                      <td><%= c.getDni() %></td>
                      <td><%= c.getNombre() %></td>
                      <td><%= c.getApellidos() %></td>
                      <td><%= c.getDireccion() %></td>
                      <td><%= c.getTelefono() %></td>
                    </tr>
                   <% }}%>
                   
            </tbody>
        </table>
    </div>
</div>
 