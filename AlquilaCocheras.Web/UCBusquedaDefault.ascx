<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCBusquedaDefault.ascx.cs" Inherits="AlquilaCocheras.Web.UCBusquedaDefault" %>
<div id="busquedaUC">
    <div class="main-content col-lg-4">

       

        <div class="form-mini-container">


          <div class="form-mini">

                <div class="form-row">
                    
                     <asp:TextBox ID="txtUbicacion" placeholder="Ingrese ubicacion:" runat="server" ClientIDMode="Static"></asp:TextBox>
                     <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="CustomValidator" OnServerValidate="CustomValidator_ServerValidate"></asp:CustomValidator>
                </div>
              
                <div class="form-row">
                    
                     <asp:TextBox ID="txtFechaInicio" placeholder="Periodo de busqueda:" runat="server" ClientIDMode="Static" TextMode="Date"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" Text="*" ControlToValidate="txtFechaInicio"  runat="server" ValidationExpression="^(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/|-|\.)(?:0?[1,3-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$" ErrorMessage="Formato de fecha invalido"></asp:RegularExpressionValidator>
    
                </div>

                <div class="form-row">
                    
                   <asp:TextBox ID="txtFechaFin" placeholder="Hasta:" runat="server" ClientIDMode="Static" TextMode="Date"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" Text="*" ControlToValidate="txtFechaFin" runat="server" ValidationExpression="^(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/|-|\.)(?:0?[1,3-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$" ErrorMessage="Formato de fecha invalido"></asp:RegularExpressionValidator>
                </div>

                <div class="form-row">
                    <asp:Label ID="lblResultado" runat="server"></asp:Label>
                </div>

                <div class="form-row form-last-row">
                    <asp:Button ID="btnFiltrar" runat="server" Text="Buscar" ClientIDMode="Static" OnClick="btnFiltrar_Click"  />
                    
                </div>
                  <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
                 
            </div>
        </div>
     </div>
</div>

   