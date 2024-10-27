<%@page import="com.pe.DAO.EmpresaDAO"%>
<%@page import="com.pe.DAO.UsuarioDAO"%>
<%@page import="com.pe.model.entity.Usuario"%>
<%
    HttpSession sesion = request.getSession();
    if (sesion.getAttribute("tipo") == null) {

        response.sendRedirect("login.jsp");
    } else {
        String tipo = sesion.getAttribute("tipo").toString();
        if (!tipo.equals("Administrador") & !tipo.equals("Compra") & !tipo.equals("Almacen") & !tipo.equals("Venta")) {
            response.sendRedirect("login.jsp");
        }
    }
%>
<%
    String codigo = (String) sesion.getAttribute("usuario");
    Usuario usu = UsuarioDAO.listimg(codigo);
    String cliente = usu.getFilename1();
%> 
<!-- Navbar -->
<div class="main-header navbar navbar-expand navbar-white navbar-light">
    <!-- Left navbar links -->
    <ul class="navbar-nav">
        <li class="nav-item">
            <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
        </li>
        <li class="nav-item">
            <h4 class="d-block mb-0 mt-1"><%=usu.getNombre()%></h4>
        </li>
    </ul>
    <!-- Right navbar links -->
    <ul class="navbar-nav ml-auto">
        <li class="nav-item">
            <a class="nav-link" data-widget="fullscreen" href="#" role="button">
                <i class="fas fa-expand-arrows-alt"></i>
            </a>
        </li>
        <li class="btn-exit" id="btn-exi">

            <a class="nav-link"  data-slide="true"  role="button">
                <i class="fa fa-power-off" aria-hidden="true" title="Salir" id="btn-exi"></i>
            </a>
        </li>
    </ul>
</div>
<!-- /.navbar -->
<!-- Main Sidebar Container -->
<section class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo 
    <a href="../../index3.html" class="brand-link">
        <img src="assets/images/avatar-1.jpg" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8">
        <span class="brand-text font-weight-light"><h6>MI EMPRESA</h6></span>
    </a>-->
    <a href="#" class="brand-link">
        <img src="<%=EmpresaDAO.img()%>" alt="AdminLTE Logo" width="235 height="40">
        <span class="brand-text font-weight-light"><h6></h6></span>
    </a>
    <!-- Sidebar -->
    <div class="sidebar">
        <!-- Sidebar Menu -->
        <nav class="mt-2">

            <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                <!-- Add icons to the links using the .nav-icon class
                     with font-awesome or any other icon font library -->
                <!--
                <%                     if (sesion.getAttribute("tipo") != null && sesion.getAttribute("tipo").equals("Administrador")) {
                %>
                <li class="nav-item">
                    <a href="#" class="nav-link">
                        <i class="nav-icon fas fa-user"></i>
                        <p>
                            PRIVADO
                            <i class="fas fa-angle-left right"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="Usuario.jsp" class="nav-link">
                                <i class="far fas fa-circle nav-icon"></i>
                                <p>Usuario</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="Empresa.jsp" class="nav-link">
                                <i class="far fas fa-circle nav-icon"></i>
                                <p>Empresa</p>
                            </a>
                        </li>
                    </ul>
                </li>
                <%
                    }
                    if (sesion.getAttribute("tipo") != null) {
                %>

                <%
                    }

                %>
                <li class="nav-item">
                    <a href="#" class="nav-link">
                        <i class="nav-icon fas fa-cog"></i>
                        <p>
                            CONFIGURACIÓN
                            <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">

                        <li class="nav-item">
                            <a href="Clasificacion.jsp" class="nav-link">
                                <i class="far fas fa-circle nav-icon"></i>
                                <p>Clasificación</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="Categoria.jsp" class="nav-link">
                                <i class="far fas fa-circle nav-icon"></i>
                                <p>Categoría</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="Subcategoria.jsp" class="nav-link">
                                <i class="far fas fa-circle nav-icon"></i>
                                <p>Subcategoria</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="Unidadmedida.jsp" class="nav-link">
                                <i class="far fas fa-circle nav-icon"></i>
                                <p>Unidad de Medida</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="Producto.jsp" class="nav-link">
                                <i class="far fas fa-circle nav-icon"></i>
                                <p>Producto</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="Stockminimoymaximo.jsp" class="nav-link">
                                <i class="far fas fa-circle nav-icon"></i>
                                <p>Stock mínimo y máximo</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="Motivo.jsp" class="nav-link">
                                <i class="far fas fa-circle nav-icon"></i>
                                <p>Motivo</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="Transporte.jsp" class="nav-link">
                                <i class="far fas fa-circle nav-icon"></i>
                                <p>Transporte</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="Vehiculo.jsp" class="nav-link">
                                <i class="far fas fa-circle nav-icon"></i>
                                <p>Vehículo</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="Conductor.jsp" class="nav-link">
                                <i class="far fas fa-circle nav-icon"></i>
                                <p>Conductor</p>
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="nav-item">
                    <a href="#" class="nav-link">
                        <i class="nav-icon fas fa-user"></i>
                        <p>
                            AUXILIAR
                            <i class="fas fa-angle-left right"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="Cliente.jsp" class="nav-link">
                                <i class="far fas fa-circle nav-icon"></i>
                                <p>Cliente</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="Proveedor.jsp" class="nav-link">
                                <i class="far fas fa-circle nav-icon"></i>
                                <p>Proveedor</p>
                            </a>
                        </li>
                    </ul>
                </li>

                <%                    if (sesion.getAttribute("tipo") != null && sesion.getAttribute("tipo").equals("Administrador") || sesion.getAttribute("tipo") != null && sesion.getAttribute("tipo").equals("Almacen")) {
                %>
-->
                <!--<li class="nav-header"><a href="DashboardAlmacen.jsp" class="nav-link"><H6 style="color: ">PANEL ALMACEN</H6></a></li>-->
                <li class="nav-item">
                    <a href="Producto.jsp" class="nav-link">
                        <H6 style="color: "><i class="nav-icon fas fa-th"></i> STOCK / PRODUCTOS</H6>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="ListarNotaingreso.jsp" class="nav-link">
                        <H6 style="color: "><i class="nav-icon fas fa-arrow-alt-circle-left"></i> INGRESO ALM</H6>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="ListarNotasalida.jsp" class="nav-link">
                        <H6 style="color: "><i class="nav-icon fas fa-arrow-alt-circle-right"></i> SALIDA ALM</H6>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="ReporteIngreso.jsp" class="nav-link">
                        <H6 style="color: "><i class="nav-icon fas fa-chart-bar"></i> REPORTES</H6>
                    </a>
                </li>
                <!--
                <li class="nav-item">
                    <a href="DashboardAlmacen.jsp" class="nav-link">
                        <i class="nav-icon fas fa-th"></i>
                        <p>
                            ALMACEN
                            <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="ListarNotaingreso.jsp" class="nav-link">
                                <i class="far fas fa-circle nav-icon"></i>
                                <p>Nota de Ingreso</p>
                            </a>
                        </li>
                    </ul>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="ListarNotasalida.jsp" class="nav-link">
                                <i class="far fas fa-circle nav-icon"></i>
                                <p>Nota Salida</p>
                            </a>
                        </li>
                    </ul>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="ListarGuiaremisioncliente.jsp" class="nav-link">
                                <i class="far fas fa-circle nav-icon"></i>
                                <p>Guía de remisión</p>
                            </a>
                        </li>
                    </ul>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="#" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>
                                    REPORTES
                                    <i class="right fas fa-angle-left"></i>
                                </p>
                            </a>
                            <ul class="nav nav-treeview">
                                <li class="nav-item">
                                    <a href="ReporteIngreso.jsp" class="nav-link">
                                        <i class="far fa-dot-circle nav-icon"></i>
                                        <p>Registro de Ingreso</p>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="Reportesalida.jsp" class="nav-link">
                                        <i class="far fa-dot-circle nav-icon"></i>
                                        <p>Registro de Salida</p>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="ReporteStockproducto.jsp" class="nav-link">
                                        <i class="far fa-dot-circle nav-icon"></i>
                                        <p>Stock Producto</p>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="ReporteStockminimo.jsp" class="nav-link">
                                        <i class="far fa-dot-circle nav-icon"></i>
                                        <p>Stock Mínimo</p>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="ReporteStockmaximo.jsp" class="nav-link">
                                        <i class="far fa-dot-circle nav-icon"></i>
                                        <p>Stock Máximo</p>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="Listaproductoconsultamovimiento.jsp" class="nav-link">
                                        <i class="far fa-dot-circle nav-icon"></i>
                                        <p>Movimiento por Producto</p>
                                    </a>
                                </li>
                            </ul>
                        </li>

                    </ul>
                </li>
                -->
                <%
                    }

                %>
            </ul>
        </nav>
        <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
</section>


