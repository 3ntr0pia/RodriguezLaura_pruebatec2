<%@page import="com.pruebatecnica2.gestorturnos.logica.Turno" %>
<%@page import="java.util.List" %>
<% request.getRequestDispatcher("/SvTurno").include(request, response); %>
<div class="container">
    <div class="row mb-4">
        <h1 class="text-center">Gestor Turnos</h1>
    </div>
    <div class="row">

        <div class="col-md-8">
            <h2>Buscar turnos</h2>
            <p>Introduzca la fecha del turno que desea buscar</p>
            <div class="input-group">
                <form class="d-flex" action="/gestorturnos/SvTurno/BuscarPorFecha" method="GET">
                    <input type="date" class="form-control" required name="fecha">
                    <button class="btn btn-outline-secondary" type="submit">
                        <i class="bi bi-search"></i> 
                    </button>
                </form>
            </div>

            <div class="mt-4">
                <% if (request.getSession().getAttribute("turnos") != null) {%>
                <div class="form-check form-switch">
                    <form class="d-flex" action="/gestorturnos/SvTurno/visualizarAtendidos" method="GET">
                        <button type="submit" class="btn btn-primary"> Mostrar los no atendidos </button>
                        </form>

                            </div>
                            <div class="table-responsive mt-4">
                                <table class="table table-bordered">
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Número</th>
                                            <th>Estado</th>
                                            <th>Descripción</th>
                                            <th>Fecha</th>
                                            <th>DNI Ciudadano</th>
                                            <th>Nombre Ciudadano</th>
                                            <th>Acciones</th>
                                        </tr>
                                    </thead>
                                    <tbody id="tablaTurnos">
                                        <% List<Turno> turnos = (List) request.getSession().getAttribute("turnos");
                                            if (!turnos.isEmpty()) {
                                                for (Turno t : turnos) {%>
                                        <tr>
                                            <td><%= t.getId()%></td>
                                            <td><%= t.getNumero()%></td>
                                            <td>
                                                <% if (!t.isEstado()) { %>
                                                <i class="bi bi-hourglass-split text-danger" title="En proceso"></i>
                                                <% } else { %>
                                                <i class="bi bi-check2-circle text-success" title="Atendido"></i>
                                                <% }%>
                                            </td>
                                            <td><%= t.getDescripcion()%></td>
                                            <td><%= t.getFecha()%></td>
                                            <td><%= t.getCiudadano().getDni()%></td>
                                            <td><%= t.getCiudadano().getNombre()%></td>
                                            <td>
                                                <% if(t.isEstado()== false){
                                                %>
                                                <form action="/gestorturnos/SvTurno/finalizarTurno" method="POST">
                                                    <input type="hidden" name="idTurno" value="<%=t.getId()%>">
                                                    <button type="submit" class="btn btn-primary"> Finalizar </button>
                                                </form> 
                                                <% } %>
                                                
                                                
                                        </tr>
                                        <% }
                                            } %>
                                    </tbody>
                                </table>
                            </div>
                            <% } %>
                            </div>
                            </div>

                            <!-- Columna derecha -->
                            <div class="col-md-4">
                                <div class="card">
                                    <div class="card-body">
                                        <h5 class="card-title">Nuevo Turno</h5>
                                        <form action="/gestorturnos/SvTurno/formularioTurno" method="POST">
                                            <div class="mb-3">
                                                <label for="numero" class="form-label">Número</label>
                                                <input type="text" class="form-control" id="numero" name="numero" required>
                                            </div>
                                            <div class="mb-3">
                                                <label for="descripcion" class="form-label">Descripción</label>
                                                <input type="text" class="form-control" id="descripcion" name="descripcion" required>
                                            </div>
                                            <div class="mb-3">
                                                <label for="fecha" class="form-label">Fecha</label>
                                                <input type="date" class="form-control" id="fecha" name="fecha" required>
                                            </div>
                                            <div class="mb-3">
                                                <label for="dni" class="form-label">DNI (Registrados en base de datos)</label>
                                                <select class="form-select" id="dni" name="dni" required>
                                                    <option value="">Seleccione un DNI Registrado</option>
                                                    <% List<String> listDni = (List) request.getSession().getAttribute("listDni");
                                                        if (listDni != null) {
                                                            for (String dni : listDni) {%>
                                                    <option value="<%= dni%>"><%= dni%></option>
                                                    <% }
                                                        }%>
                                                </select>
                                            </div>
                                            <button type="submit" class="btn btn-primary">Agregar Turno</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            </div>
                            </div>
