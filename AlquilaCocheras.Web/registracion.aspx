 <%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Anonimo.Master" AutoEventWireup="true" CodeBehind="registracion.aspx.cs" Inherits="AlquilaCocheras.Web.registracion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder_Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder_Principal" runat="server">
    <div class="container">
    
<div class="row" style="margin-top:60px">
    <div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
    	<div role="form">
			<fieldset>
				<h2 runat="server" id="titulo" visible="true">Registrese</h2>
                <asp:Literal ID="lblResultado" Visible="false" runat="server"></asp:Literal>
				<hr class="colorgraph">
				<div class="form-group">
                    <asp:TextBox ID="txtNombre" runat="server" placeholder="Nombre" CssClass="form-control input-lg" ClientIDMode="Static"></asp:TextBox>
                    <asp:RequiredFieldValidator ControlToValidate="txtNombre" Text="*"  ID="RequiredFieldValidator1" runat="server" ErrorMessage="El nombre es requerido"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <asp:TextBox ID="txtApellido" placeholder="Apellido" Cssclass="form-control input-lg" runat="server"  ClientIDMode="Static"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" Text="*" ControlToValidate="txtApellido" runat="server" ErrorMessage="El apellido es requerido"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <asp:TextBox ID="txtEmail" runat="server" placeholder="E-mail" Cssclass="form-control input-lg" ClientIDMode="Static"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" Text="*" runat="server" ErrorMessage="El e-mail es requerido" ControlToValidate="txtEmail"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="txtEmail" Text="*" runat="server" ErrorMessage="El E-mail es invalido" ValidationExpression="^[_a-z0-9-]+(.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4})$"></asp:RegularExpressionValidator>
                </div>
				<div class="form-group">
                    <asp:TextBox ID="txtContrasenia" runat="server" placeholder="Password" Cssclass="form-control input-lg" TextMode="Password" ClientIDMode="Static"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtContrasenia" ErrorMessage="La contraseña es requerida"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtContrasenia" Text="*" ErrorMessage="La contraseña debe comenzar con mayúscula, poseer como mínimo 8 caracteres, y contener al menos un número." ValidationExpression="(?=^.{8,}$)(?=.*\d+)(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$"></asp:RegularExpressionValidator>

                </div>
                <div class="form-group">
                    <asp:TextBox ID="txtConfContrasenia" runat="server" placeholder="Reingrese su password" Cssclass="form-control input-lg" TextMode="Password" ClientIDMode="Static"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="txtConfContrasenia" runat="server" ErrorMessage="Se requiere el reingreso de la contraseña"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator1" ControlToCompare="txtContrasenia" ControlToValidate="txtConfContrasenia" runat="server" ErrorMessage="Las contraseñas no coinciden"></asp:CompareValidator>
              	</div>
				<span class="button-checkbox">
					<asp:RadioButtonList ID="rblPerfil" runat="server" ClientIDMode="Static">
                             <asp:ListItem Text="Cliente" Value="1" />
                             <asp:ListItem Text="Propietario" Value="2" />
                    </asp:RadioButtonList>	
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="rblPerfil" runat="server" ErrorMessage="El perfil es requerido"></asp:RequiredFieldValidator>
				</span>
				<hr class="colorgraph">
				<div class="row">
					<div class="col-xs-6 col-sm-6 col-md-6">
                        <asp:Button ID="btnRegistrarUsuario"  CssClass="btn btn-lg btn-primary btn-block" runat="server" Text="Registrar usuario" ClientIDMode="Static" OnClick="btnRegistrarUsuario_Click" />
					</div>
					<div class="col-xs-6 col-sm-6 col-md-6">
						<a href="login.aspx" class="btn btn-lg btn-primary btn-block">Volver</a>
					</div>
                    <br />
                    <br />
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
                    
                    
				</div>
			</fieldset>
		</div>
	</div>
</div>
</div>
   
</asp:Content>