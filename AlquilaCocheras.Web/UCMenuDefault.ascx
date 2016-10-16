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
                        <li id="inicio" runat="server" class="active">
                            <a href="default.aspx?pestaña=inicio" class="">
                                Inicio
                            </a>
                        </li>                       
                    </ul>
                    <ul class="nav navbar-nav pull-right">
                        <li id="login" runat="server">
                            <a href="login.aspx?pestaña=login" role="button">
                                Ingresar
                            </a>
                        </li>
                        <li id="signup" runat="server">
                            <a href="registracion.aspx?pestaña=signup">
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
                        <li id="propNuevaCochera" runat="server">
                            <a href="cocheras.aspx?pestaña=propNuevaCochera">
                                Nueva Cochera
                            </a>
                         </li>
                        <li id="propReservas" runat="server">
                            <a href="reservas.aspx?pestaña=propReservas">
                                Reservas
                            </a>
                        </li>
                    </ul>
                    
                    <ul class="nav navbar-nav pull-right">
                        <li id="propPerfil" runat="server">
                            <a href="perfil.aspx?pestaña=propPerfil" >
                                Perfil
                            </a>
                        </li>
                        <li>
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
                        <li id="cliReservar" runat="server">
                            <a href="reservar.aspx?pestaña=cliReservar">
                                Reservar
                            </a>
                         </li>
                        <li id="cliReservas" runat="server" class="">
                            <a href="reservas.aspx?pestaña=cliReservas">
                                Mis Reservas
                            </a>
                        </li>
                    </ul>
                    
                    <ul class="nav navbar-nav pull-right">
                        <li>
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