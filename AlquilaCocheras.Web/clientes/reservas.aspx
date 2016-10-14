<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Clientes.Master" AutoEventWireup="true" CodeBehind="reservas.aspx.cs" Inherits="AlquilaCocheras.Web.clientes.reservas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder_Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder_Principal" runat="server">

    <%--    LISTADO DE RESERVAS (gridview, repeater o datalist)
        
            fecha inicio.
            fecha fin
            horario
            precio total.
            puntuación 
        
        --%>
    <br />
    <br />
    <br />
    <h2>Mis reservas</h2>  
    
   
    <table class="table table-hover table-inverse tablaPuntuacion"  visible="true" runat="server">
  <thead>
    <tr>
      <th>#</th>
      <th>Fecha de inicio</th>
      <th>Fecha fin</th>
      <th>Horario</th>
      <th>Precio total</th>
      
      <th>Puntuación</th>
      
    </tr>
  </thead>
  <tbody>
    <tr class="" runat="server" id="colorRow1">
      <th scope="row">1</th>
      <td>03/10/16</td>
      <td>04/10/16</td>
      <td>08:30 AM/18:30 PM</td>
      <td>$500</td>
      <td runat="server" id="tdBoton" visible="true">
      <button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModalPuntuacion">Puntuar</button>
      </td>
       <td runat="server" id="tdPuntuacion" visible="false">
           <asp:Label ID="puntaje" runat="server" Text=""></asp:Label>
       </td>
       
      
      </tr>
    <tr class="" runat="server" id="colorRow">
      <th scope="row">2</th>
       <td>28/09/16</td>
      <td>30/09/16</td>
        <td>06:00 AM/23:00 PM</td>
      <td>$1500</td>
      <td runat="server" id="tdBoton2" visible="true">
      <button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModalPuntuacion2">Puntuar</button>
      </td>
       <td runat="server" id="tdPuntuacion2" visible="false">
           <asp:Label ID="puntaje2" runat="server" Text=""></asp:Label>
       </td>
      
      
     
    </tr>
    <tr class="bg-success">
      <th scope="row">3</th>
      <td>12/05/15</td>
      <td>19/06/15</td>
      <td>10:00 AM/ 15:00PM</td>
      <td>$18.000</td>
      <td>
          <asp:Label ID="puntaje3" runat="server" Text="5"></asp:Label>
      </td>
      
      
    </tr>
  </tbody>
</table>
  <div class="modal fade" id="myModalPuntuacion" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Puntuacion</h4>
        </div>
        <div class="modal-body">
            <%--hidden donde se guarda el id de la reserva elegida para que desde el codebehind se pueda identificar--%>
           <input type="hidden" id="hdIdReserva" />
          <asp:DropDownList runat="server" ID="ddlPuntuacion" ClientIDMode="Static">
                    <asp:ListItem Text="1" Value="1" />
                    <asp:ListItem Text="2" Value="2" />
                    <asp:ListItem Text="3" Value="3" />
                    <asp:ListItem Text="4" Value="4" />
                    <asp:ListItem Text="5" Value="5" />
                </asp:DropDownList>
        <asp:Button ID="enviarPuntuacion" CausesValidation="false" CssClass="btn btn-success " runat="server" Text="Puntuar!" OnClick="enviarPuntacion_Click" />
        </div>        
      </div>      
    </div>
  </div>

    <div class="modal fade" id="myModalPuntuacion2" role="dialog">
    <div class="modal-dialog">    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Puntuacion</h4>
        </div>
        <div class="modal-body">
            <%--hidden donde se guarda el id de la reserva elegida para que desde el codebehind se pueda identificar--%>
           <input type="hidden" id="hdIdReserva1" />
          <asp:DropDownList runat="server" ID="ddlPuntuacion1" ClientIDMode="Static">
                    <asp:ListItem Text="1" Value="1" />
                    <asp:ListItem Text="2" Value="2" />
                    <asp:ListItem Text="3" Value="3" />
                    <asp:ListItem Text="4" Value="4" />
                    <asp:ListItem Text="5" Value="5" />
                </asp:DropDownList>
        <asp:Button ID="enviarPuntuacion2" CausesValidation="false" CssClass="btn btn-success" runat="server" Text="Puntuar!" OnClick="enviarPuntacion2_Click" />
        </div>        
      </div>      
    </div>
  </div>
     

     

    <div class="row botones-puntuacion">   
     <div class="col-lg-6">
 <asp:Button ID="btnConfirmar" CssClass="btn btn-success btn-block" runat="server" Text="Confirmar" ClientIDMode="Static" OnClick="btnConfirmar_Click"/>   
    </div>
      <div class="col-lg-6">
         <asp:Button ID="btnCancelar" CssClass="btn btn-default btn-block"  runat="server" Text="Cerrar" ClientIDMode="Static" />
     </div>
</div>
<div class="espacio"></div>
        
</asp:Content>
