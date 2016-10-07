<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Clientes.Master" AutoEventWireup="true" CodeBehind="confirmar-reserva.aspx.cs" Inherits="AlquilaCocheras.Web.clientes.confirmar_reserva" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder_Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder_Principal" runat="server">
  <div class="row confirmar-form">  
    <div class="main-content col-lg-4">     
      <div class="form-mini-container">
          <div class="form-mini">    

    <div class="form-row">
    <asp:Label ID="label2" runat="server" Text="Fecha Inicio: "></asp:Label>
    <asp:TextBox ID="txtFechaInicio" TextMode="DateTime" runat="server" ClientIDMode="Static"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtFechaInicio" runat="server" Text="*" ErrorMessage="Campo requerido"></asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="txtFechaInicio" Text="*" runat="server" ErrorMessage="Formato de fecha invalido" ValidationExpression="^(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]|(?:Jan|Mar|May|Jul|Aug|Oct|Dec)))\1|(?:(?:29|30)(\/|-|\.)(?:0?[1,3-9]|1[0-2]|(?:Jan|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec))\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)(?:0?2|(?:Feb))\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9]|(?:Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep))|(?:1[0-2]|(?:Oct|Nov|Dec)))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$"></asp:RegularExpressionValidator>
    <asp:CompareValidator ID="CompareValidator1" CssClass="alert danger-color validator animated zoomIn" Text="¡La fecha de Inicio debe ser inferior a la de Finalización!" runat="server" ErrorMessage="CompareValidator" ControlToValidate="txtFechaInicio" Operator="LessThan" Display="Dynamic" ControlToCompare="txtFechaFin"></asp:CompareValidator>
    </div>
    <div class="form-row">
    <asp:Label ID="label4" runat="server" Text="Fecha Fin: "></asp:Label>
    <asp:TextBox ID="txtFechaFin" runat="server" TextMode="DateTime" ClientIDMode="Static"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txtFechaFin" runat="server" ErrorMessage="Campo requerido"></asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ControlToValidate="txtFechaFin" runat="server" ErrorMessage="Formato de fecha invalido" ValidationExpression="^(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]|(?:Jan|Mar|May|Jul|Aug|Oct|Dec)))\1|(?:(?:29|30)(\/|-|\.)(?:0?[1,3-9]|1[0-2]|(?:Jan|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec))\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)(?:0?2|(?:Feb))\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9]|(?:Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep))|(?:1[0-2]|(?:Oct|Nov|Dec)))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$"></asp:RegularExpressionValidator>
    </div>
    <div class="form-row">
    <asp:Label ID="label3" runat="server" Text="Hora de Entrada: "></asp:Label>
    <asp:TextBox ID="txtHorarioInicio" runat="server" TextMode="Time" ClientIDMode="Static"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="txtHorarioInicio" runat="server" ErrorMessage="Campo requerido"></asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" ControlToValidate="txtHorarioInicio" ValidationExpression="^([0-9]|0[0-9]|1[0-9]|2[0-3]):[0-5][0-9]$" runat="server" ErrorMessage="Formato de hora invalido"></asp:RegularExpressionValidator>
    </div>
    <div class="form-row">
    <asp:Label ID="label1" runat="server" Text="Hora de Salida: "></asp:Label>
    <asp:TextBox ID="txtHorarioFin" runat="server" TextMode="Time" ClientIDMode="Static"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="txtHorarioFin" runat="server" ErrorMessage="Campo requerido"></asp:RequiredFieldValidator>
     <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtHorarioFin" ValidationExpression="^([0-9]|0[0-9]|1[0-9]|2[0-3]):[0-5][0-9]$" ErrorMessage="Formato de hora invalido"></asp:RegularExpressionValidator>
    </div>

    
              </div>
            </div>
        </div>
      <!--Imagen tomada desde el servidor para mostrar la cochera-->
   
      <asp:Image ID="imgFoto" ClientIDMode="Static" runat="server" />


<div class="col-lg-8">
 <table class="table table-hover table-inverse" id="TablaConfirma" visible="true" runat="server">
  <thead>
    <tr>
      <th>#</th>
      <th>Ubicacion</th>
      <th>Precio por hora</th>
      <th>Precio total</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">1</th>
      <td><asp:Label ID="lblUbicacion" ClientIDMode="Static" Text="Haedo" runat="server"></asp:Label></td>
      <td><asp:Label ID="lblPrecioHora" ClientIDMode="Static" runat="server"></asp:Label><input name=price value="150" disabled="disabled" /></td>
      <td><asp:Label ID="lblPrecioTotal" ClientIDMode="Static" runat="server"></asp:Label><span class=total></span></td>           
      </tr>
    </tbody>
</table>
 </div>   
   
   </div>     

 <div class="row botones-confirmar">   
     <div class="col-lg-6">
 <asp:Button ID="btnConfirmar" CssClass="btn btn-success btn-block" runat="server" Text="Confirmar Reserva" ClientIDMode="Static" OnClick="btnConfirmar_Click"/>   
    </div>
      <div class="col-lg-6">
         <asp:Button ID="btnCancelar" CssClass="btn btn-default btn-block"  runat="server" Text="Cancelar" ClientIDMode="Static" />
     </div>
</div>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
     <asp:Label ID="lblResultado" runat="server"></asp:Label>   
    

    
    
</asp:Content>
