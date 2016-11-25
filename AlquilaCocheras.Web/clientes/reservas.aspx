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
    <h3>Mis reservas</h3>  
    
   
    <table class="table table-hover table-inverse tablaPuntuacion"  visible="true">
  <thead>
    <tr>
      
      <th>Fecha de inicio</th>
      <th>Fecha fin</th>
      <th>Horario</th>
      <th>Precio total</th>
      
      <th>Puntuación</th>
      
    </tr>
  </thead>
  <tbody>
   <asp:repeater id="repeater" runat="server" OnItemCommand="repeater_ItemCommand">
    <ItemTemplate>
    <tr class="" runat="server" id="colorRow1">
      
      <td><%# Eval("FechaInicio") %></td>
      <td><%# Eval("FechaFin") %></td>
      <td><%# Eval("HoraInicio") %>/<%# Eval("HoraFin") %></td>
      <td><%# Eval("Precio") %></td>
      <td><asp:HiddenField ID="hdIdReserva" Value='<%#Eval("IdReserva") %>' runat="server" /></td>
      <td runat="server" id="tdBoton" visible="true">
      <button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModalPuntuacion">Puntuar</button>
      </td>
       <td runat="server" id="tdPuntuacion" visible="false">
           <asp:Label ID="puntaje" runat="server" Text=""></asp:Label>
       </td>  
      </tr>
    </ItemTemplate>
   </asp:repeater>       
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
           <input type="hidden" id="hdIdPuntuacion" runat="server" />
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
