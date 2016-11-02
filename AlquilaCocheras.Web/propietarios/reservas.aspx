<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Propietarios.Master" AutoEventWireup="true" CodeBehind="reservas.aspx.cs" Inherits="AlquilaCocheras.Web.propietarios.reservas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder_Head" runat="server">
    <title>Cochera - Reservas</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder_Principal" runat="server">

    <div class="container espaciado-superior espaciado-inferior">
        <div class="row">
            <div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">                
                <div role="form">

                    <h2 class="animated flipInX">Ver Reservas</h2>     
				    
                    <div class="animated slideInLeft">
                        <hr class="colorgraph">
                
                        <div class="form-group md-form">
                            <asp:Label ID="label1" CssClass="fuente-mediana" runat="server" Text="Filtrar Desde: "></asp:Label>
                            <br />
                            <i class="fa fa-calendar prefix fav-icon-mail"></i>
                            <asp:TextBox ID="txtFechaInicio" CssClass="form-control input-lg" placeholder="Disponible Desde" runat="server" ClientIDMode="Static" TextMode="Date"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="alert danger-color validator animated zoomIn" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtFechaInicio" Text="¿Cuál es la fecha de inicio para filtrar?" SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="CompareValidator1" CssClass="alert danger-color validator animated zoomIn" Text="¡La fecha de Inicio debe ser inferior a la de Finalización!" runat="server" ErrorMessage="CompareValidator" ControlToValidate="txtFechaInicio" Operator="LessThan" Display="Dynamic" ControlToCompare="txtFechaFin" SetFocusOnError="True"></asp:CompareValidator>
                        
                            <br />

                            <asp:Label ID="label2" CssClass="fuente-mediana" runat="server" Text="Hasta: "></asp:Label>
                            <br />
                            <i class="fa fa-calendar prefix fav-icon-mail"></i>
                            <asp:TextBox ID="txtFechaFin" CssClass="form-control input-lg" placeholder="Hasta" runat="server" ClientIDMode="Static" TextMode="Date">¡Recordá seleccionar un período no menor a 90 días!</asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" CssClass="alert danger-color validator animated zoomIn" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtFechaFin" Text="¿Cuál es la fecha de finalización para filtrar?" SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>

                            <asp:CustomValidator ID="CustomValidator1" OnServerValidate="ValidarRangoFecha" runat="server" ErrorMessage="CustomValidator" Display="Dynamic" Text="¡Recuerda que el rango no debe ser mayor a 90 días!" CssClass="alert danger-color validator animated zoomIn"></asp:CustomValidator>

                            <br />
                        
                        </div>                    

                        <br />
                        <br />

                        <!--Tabla-->
                        <div id="tblReservas" class="table-responsive animated zoomIn" runat="server" visible="false">
                            <asp:GridView ID="GridView1" runat="server"></asp:GridView>
                        </div>
                        <!--Fin Tabla-->

                        <div class="form-group md-form">
                            <br />  
                            <hr class="colorgraph">
                            <asp:Button ID="btnFiltrar" CssClass="btn btn-lg btn-primary btn-block" runat="server" Text="Filtrar" ClientIDMode="Static" OnClick="btnFiltrar_Click"/>
                        </div>

                    </div>

                </div>            
            </div>
        </div>
    </div>        

</asp:Content>
