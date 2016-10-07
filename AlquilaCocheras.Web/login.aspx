<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Anonimo.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="AlquilaCocheras.Web.login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder_Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder_Principal" runat="server">
    <div class="container">
    
<div class="row" style="margin-top:60px">
    <div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
    	<div role="form">
			<fieldset>
				<h2>Ingrese sus datos</h2>
				<hr class="colorgraph">
				<div class="form-group">
                    
                    <asp:TextBox ID="txtEmail" placeholder="Ingrese su e-mail" CssClass="form-control input-lg" runat="server" ClientIDMode="Static"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtEmail" Text="*" runat="server" ErrorMessage="El e-mail es requerido"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail" Text="*" ErrorMessage="E-mail Inválido." ValidationExpression="^[_a-z0-9-]+(.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4})$"></asp:RegularExpressionValidator> 
                  </div>
				<div class="form-group">
                    <asp:TextBox ID="txtContrasenia" placeholder="Ingrese su password" CssClass="form-control input-lg" runat="server" TextMode="Password" ClientIDMode="Static"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txtContrasenia" runat="server" ErrorMessage="La contraseña es requerida"></asp:RequiredFieldValidator>
                </div>
				<span class="button-checkbox">
					<button type="button" class="btn" data-color="info">Recordarme</button>
                    <input  type="checkbox" name="remember_me" id="remember_me" checked="checked" class="hidden">
					
				</span>
				<hr class="colorgraph">
				<div class="row">
					<div class="col-xs-6 col-sm-6 col-md-6">
                        <asp:Button ID="btnLogin" runat="server" CssClass="btn btn-lg btn-primary btn-block" Text="Ingresar" ClientIDMode="Static" OnClick="btnLogin_Click" />
					</div>
					<div class="col-xs-6 col-sm-6 col-md-6">
						<a href="/registracion.aspx" class="btn btn-lg btn-primary btn-block">Registrarse</a>
                        <%--Si el usuario no existe o si no coinciden las credenciales, mostrar mensaje "Usuario y/o Contraseña inválidos"--%>
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
                         <asp:Label ID="lblResultado" runat="server"></asp:Label>
					</div>
				</div>
			</fieldset>
		</div>
	</div>
</div>
</div>
    

    

    
    

    
</asp:Content>
