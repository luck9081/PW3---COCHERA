<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCMenuDefault.ascx.cs" Inherits="AlquilaCocheras.Web.defaultUcMenu" %>

<%-- Predeterminadamente, Cliente y Propietario poseen el atributo visible="false" ya que Anonimo es quien se muestra primero. --%>


<%------------------ MENU ANONIMO ------------------%>

<div id="menuAnonimo" class="navbar-wrapper" runat="server">
    <div class="container-fluid">
        <nav class="navbar navbar-fixed-top">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="default.aspx">Logo</a>
                </div>

                <div id="navbar" class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <li class="active">
                            <a href="default.aspx" class="">
                                Inicio
                            </a>
                        </li>                       
                    </ul>
                    <ul class="nav navbar-nav pull-right">
                        <li class="">
                            <a href="login.aspx" role="button">
                                Ingresar
                            </a>
                        </li>
                        <li class="">
                            <a href="registracion.aspx">
                                Registrarse
                            </a>
                        </li>
                    </ul>
                </div>

            </div>
        </nav>
    </div>
</div>

<%------------------ MENU PROPIETARIO ------------------%>

<div id="menuPropietario" class="navbar-wrapper" runat="server" visible="false">
    <div class="container-fluid">
        <nav class="navbar navbar-fixed-top">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#">
                        Logo
                    </a>
                </div>
                

                <div id="navbar" class="navbar-collapse collapse">

                    <ul class="nav navbar-nav">
                        <li id="menu-nueva-cochera">
                            <a href="cocheras.aspx">
                                Nueva Cochera
                            </a>
                         </li>
                        <li id="menu-reservas" class="active">
                            <a href="reservas.aspx">
                                Reservas
                            </a>
                        </li>
                    </ul>
                    
                    <ul class="nav navbar-nav pull-right">
                        <li id="menu-perfil" class="">
                            <a href="perfil.aspx" >
                                Perfil
                            </a>
                        </li>
                        <li class="">
                            <a href="../logout.aspx">
                                Salir
                            </a>
                        </li>
                    </ul>

                </div>

            </div>
        </nav>
    </div>
</div>

<%------------------ MENU CLIENTE ------------------%>

<div id="menuCliente" class="navbar-wrapper" runat="server" visible="false">
    <div class="container-fluid">
        <nav class="navbar navbar-fixed-top">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#">
                        Logo
                    </a>
                </div>
                

                <div id="navbar" class="navbar-collapse collapse">

                    <ul class="nav navbar-nav">
                        <li id="menu-nueva-cochera" class="active">
                            <a href="reservar.aspx">
                                Reservar
                            </a>
                         </li>
                        <li id="menu-reservas"class="">
                            <a href="reservas.aspx">
                                Mis Reservas
                            </a>
                        </li>
                    </ul>
                    
                    <ul class="nav navbar-nav pull-right">
                        <li class="">
                            <a href="../logout.aspx">
                                Salir
                            </a>
                        </li>
                    </ul>

                </div>

            </div>
        </nav>
    </div>
</div>