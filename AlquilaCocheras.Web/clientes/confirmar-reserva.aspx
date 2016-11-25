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
        <asp:TextBox ID="txtFechaInicio" CssClass="calculadora" TextMode="Date" runat="server" ClientIDMode="Static"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtFechaInicio" runat="server" Text="*" ErrorMessage="Campo requerido"></asp:RequiredFieldValidator>
        <asp:CompareValidator ID="CompareValidator1" CssClass="alert danger-color validator animated zoomIn" Text="¡La fecha de Inicio debe ser inferior a la de Finalización!" runat="server" ErrorMessage="CompareValidator" ControlToValidate="txtFechaInicio" Operator="LessThan" Display="Dynamic" ControlToCompare="txtFechaFin"></asp:CompareValidator>
    </div>
    <div class="form-row">
        <asp:Label ID="label4" runat="server" Text="Fecha Fin: "></asp:Label>
        <asp:TextBox ID="txtFechaFin" CssClass="calculadora" runat="server" TextMode="Date" ClientIDMode="Static"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txtFechaFin" runat="server" ErrorMessage="Campo requerido"></asp:RequiredFieldValidator>
    </div>
    <div class="form-row">
        <asp:Label ID="label3" runat="server" Text="Hora de Entrada: "></asp:Label>
        <asp:TextBox ID="txtHorarioInicio" CssClass="calculadora" runat="server" TextMode="Time" ClientIDMode="Static"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="txtHorarioInicio" runat="server" ErrorMessage="Campo requerido"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" ControlToValidate="txtHorarioInicio" ValidationExpression="^([0-9]|0[0-9]|1[0-9]|2[0-3]):[0-5][0-9]$" runat="server" ErrorMessage="Formato de hora invalido"></asp:RegularExpressionValidator>
    </div>
    <div class="form-row">
        <asp:Label ID="label1" runat="server" Text="Hora de Salida: "></asp:Label>
        <asp:TextBox ID="txtHorarioFin" CssClass="calculadora" runat="server" TextMode="Time" ClientIDMode="Static"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="txtHorarioFin" runat="server" ErrorMessage="Campo requerido"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtHorarioFin" ValidationExpression="^([0-9]|0[0-9]|1[0-9]|2[0-3]):[0-5][0-9]$" ErrorMessage="Formato de hora invalido"></asp:RegularExpressionValidator>
    </div>

    
              </div>
            </div>
        </div>
      <!--Imagen tomada desde el servidor para mostrar la cochera-->
   
      <asp:Image ID="imgFoto" ClientIDMode="Static" runat="server" />



    <table class="table table-hover table-inverse" id="TablaReservar" visible="true" >
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
                <td><asp:Label ID="lblUbicacion" ClientIDMode="Static" runat="server"></asp:Label></td>
                <td><asp:Label ID="lblPrecioHora" ClientIDMode="Static" runat="server"></asp:Label><input id="precioHora" name="price" disabled="disabled" runat="server" ClientIDMode="Static"/></td>
                <td><asp:Label ID="lblPrecioTotal" ClientIDMode="Static" runat="server"></asp:Label></td>
            </tr>
        </tbody>
    </table> 
   
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
    

    <script>
        $(document).ready(function () {
            $(".calculadora").change(function () {
            
                var date1 = new Date(document.getElementById("txtFechaInicio").value);
                var date2 = new Date(document.getElementById("txtFechaFin").value);

                var timeDiff = Math.abs(date2.getTime() - date1.getTime());

                var diffDays = Math.ceil(timeDiff / (1000 * 3600));
            

                var horaInicio = document.getElementById("txtHorarioInicio").value;
                var horaFin = document.getElementById("txtHorarioFin").value;

                horaInicio = parseInt(horaInicio.substr(0, 2));
                horaFin = parseInt(horaFin.substr(0, 2));

                var diffHoras = horaFin - horaInicio;

                document.getElementById("lblPrecioTotal").innerHTML = (diffHoras + diffDays) * (parseFloat(document.getElementById("<%= precioHora.ClientID %>").value));
            
            });
        });
    </script>
    
</asp:Content>
