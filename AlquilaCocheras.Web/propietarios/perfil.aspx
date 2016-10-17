<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Propietarios.Master" AutoEventWireup="true" CodeBehind="perfil.aspx.cs" Inherits="AlquilaCocheras.Web.propietarios.perfil" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder_Head" runat="server">
    <title>Cochera - Perfil</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder_Principal" runat="server">
        
    <div class="container espaciado-superior">
        <div class="row">
            <div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
                <div role="form">
                    
                    <div id="divResultado" class="row" runat="server" visible="false">
                        <h3>
                            <asp:Label ID="lblResultado" CssClass="h3-responsive font-celeste animated zoomIn" runat="server" Text="Operación Exitosa"></asp:Label>
                        </h3>
                        <br />
                    </div>                        
                    
                        
                    <h2 class="animated flipInX">Perfil</h2>
				    
                    <div class="animated slideInLeft">
                        <hr class="colorgraph">                        
                        
                        <div class="form-group md-form">
                            <i class="fa fa-user prefix fav-icon-input"></i>
                            <asp:TextBox ID="txtNombre" CssClass="form-control input-lg" placeholder="Nombre" runat="server" ClientIDMode="Static"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="alert danger-color validator animated zoomIn" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtNombre" Text="¿Cuál es tu nombre?" SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>

                        <div class="form-group md-form">
                            <i class="fa fa-user prefix fav-icon-input"></i>
                            <asp:TextBox ID="txtApellido" CssClass="form-control input-lg" placeholder="Apellido" runat="server" ClientIDMode="Static"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" CssClass="alert danger-color validator animated zoomIn" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtApellido" Text="¿Cuál es tu apellido?" SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>

                        <div class="form-group md-form">
                            <i class="fa fa-envelope prefix fav-icon-mail"></i>
                            <asp:TextBox ID="txtEmail" CssClass="form-control input-lg" placeholder="E-mail" runat="server" ClientIDMode="Static" ReadOnly="True"></asp:TextBox>
                        </div>

                        <div class="form-group md-form">
                            <i class="fa fa-lock prefix fav-icon-input"></i>
                            <asp:TextBox ID="txtContrasenia" CssClass="form-control input-lg" placeholder="Password" runat="server" TextMode="Password" ClientIDMode="Static"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" CssClass="alert danger-color validator animated zoomIn" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtContrasenia" Text="¡Tu password es muy importante!" SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>

                        <div class="form-group md-form">
                            <i class="fa fa-chevron-right prefix fav-icon-input" aria-hidden="true"></i>
                            <asp:TextBox ID="txtConfContrasenia" CssClass="form-control input-lg" placeholder="Reingrese su Password" runat="server" TextMode="Password" ClientIDMode="Static"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" CssClass="alert danger-color validator animated zoomIn" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtConfContrasenia" Text="¡También es importante confirmar tu password!" SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="CompareValidator1" CssClass="alert danger-color validator animated zoomIn" Text="¡Las contraseñas no coinciden!" runat="server" ErrorMessage="CompareValidator" ControlToValidate="txtConfContrasenia" Operator="Equal" Display="Dynamic" ControlToCompare="txtContrasenia"></asp:CompareValidator>
                        </div>

                        <hr class="colorgraph">
                        <div class="form-group">
                            <div class="row">
                                <div class="col-lg-6">
                                    <asp:Button ID="btnActualizar" CssClass="btn btn-lg btn-primary btn-block" runat="server" Text="Actualizar perfil" ClientIDMode="Static" OnClick="btnActualizar_Click" />
                                </div>

                                <div class="col-lg-6">
                                    <asp:Button ID="btnCancelar" CssClass="btn btn-lg btn-danger btn-block" runat="server" Text="Cancelar" ClientIDMode="Static" CausesValidation="True" />
                                </div>
                            </div>
                        </div>
                    </div>
                                        
                </div>
            </div>
        </div>
    </div>
</asp:Content>
