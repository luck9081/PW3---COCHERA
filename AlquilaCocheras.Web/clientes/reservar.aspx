<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Clientes.Master" AutoEventWireup="true" CodeBehind="reservar.aspx.cs" Inherits="AlquilaCocheras.Web.clientes.reservar" %>
<%@ Register Src="~/UCBusquedaDefault.ascx" TagPrefix="uc2" TagName="Busqueda" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder_Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder_Principal" runat="server">
    <%--Esto va en un UserControl--%>
    
    <div class="row">
    <img src="http://starmoz.com/images/audi-car-6.jpg"  class="col-lg-8"/>
     <%--Inicio User Control--%>
    <uc2:Busqueda runat="server" id="UCBusquedaDefault" class="col-lg-4"/>

    <%--Fin User Control--%>
    </div>
    <div id="bannerRow2" visible="true" runat="server" class="row fondorow">
        <img id="banner2" class="col-lg-12 banner2" src="../imagenes/cocheras/Reservar.jpg" />
    </div>

    <table class="table table-hover table-inverse" id="TablaBusqueda" visible="false" runat="server">
  <thead>
    <tr>
      <th>#</th>
      <th>Precio hora</th>
      <th>Propietario</th>
      
      <th>Foto</th>
      <th>Ubicación</th>
      <th>Puntuación</th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">1</th>
      <td>$150</td>
      <td>Gonzalo Gomez</td>
      
      <td><button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal">Ver foto</button></td>
      <td><button type="button" class="btn btn-warning" data-toggle="modal" data-target="#myModal1">Ver Mapa</button></td>
      <td>3/5</td>
      <td><asp:HyperLink ID="HyperLink1" runat="server" ClientIDMode="Static" NavigateUrl="/clientes/confirmar-reserva.aspx?idcochera=123">Reservar</asp:HyperLink>  </td>
    </tr>
    <tr>
      <th scope="row">2</th>
      <td>$99</td>
      <td>Lucas Mattiauda</td>
      
      <td><button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal">Ver foto</button></td>
      <td><button type="button" class="btn btn-warning" data-toggle="modal" data-target="#myModal1">Ver Mapa</button></td>
      <td>3/5</td>
      <td><asp:HyperLink ID="HyperLink2" runat="server" ClientIDMode="Static" NavigateUrl="/clientes/confirmar-reserva.aspx?idcochera=123">Reservar</asp:HyperLink>  </td>
    </tr>
    <tr>
      <th scope="row">3</th>
      <td>$80</td>
      <td>Quiñonez Lucio</td>
      
      <td><button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal">Ver foto</button></td>
      <td><button type="button" class="btn btn-warning" data-toggle="modal" data-target="#myModal1">Ver Mapa</button></td>
      <td>3/5</td>
      <td><asp:HyperLink ID="HyperLink3" runat="server" ClientIDMode="Static" NavigateUrl="/clientes/confirmar-reserva.aspx?idcochera=123">Reservar</asp:HyperLink>  </td>
    </tr>
  </tbody>
</table>
  
     <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Imagen de la cochera</h4>
        </div>
        <div class="modal-body">
          <img src="http://www.arqhys.com/arquitectura/fotos/arquitectura/Abridores-de-puertas-de-cochera.jpg" class="foto img-responsive img-rounded" alt="Cochera1" width="304" height="236">
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
    
    <div class="modal fade" id="myModal1" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Ubicacion de la cochera</h4>
        </div>
        <div class="modal-body">
            <div id="map_canvas_custom_298712" class="mapaH" style="width:369px; height:350px" ></div>
                <script type="text/javascript">
                    (function (d, t) {
                        var g = d.createElement(t), s = d.getElementsByTagName(t)[0];
                        g.src = "http://map-generator.net/es/maps/298712.js?point=Mariano+J.+Haedo%2C+Argentina";
                        s.parentNode.insertBefore(g, s);
                    }(document, "script"));</script>
                <a class="mapgen-link" style="font:8px Arial;text-decoration:none;color:#5C5C5C;text-align: right; display: block; width: 369px;" href="http://map-generator.net/es">map-generator.net</a>

        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
     
    
      <%--    LISTADO  (gridview, repeater o datalist)
    Por cada disponibilidad se deberá mostrar la siguiente información:
    precio, 
    nombre y 
    apellido del propietario, 
    precio total por las horas que se desean reservar, 
    la foto, 
    el mapa del lugar donde está ubicado (utilizar la API de Google Maps) 
    la puntuación promedio        
    y el link a confirmar reserva que esta agregado abajo como asp:HyperLink, 
        donde deberán cambiarle dinamicamente el link y ponerle el idcochera correspondiente
    --%>
    </asp:Content>
