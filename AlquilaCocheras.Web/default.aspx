<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Anonimo.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="AlquilaCocheras.Web._default" %>
<%@ Register Src="~/UCBusquedaDefault.ascx" TagPrefix="uc2" TagName="Busqueda" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder_Head" runat="server">
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyByG25PdBB9LYQkjVm3MGcJKMem-CzZPPc&libraries=places"></script>
    <script type="text/javascript" src="/js/maps2.js"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder_Principal" runat="server">
    
    <div id="contenedor_fondo" class="row">
        <div class="container col-lg-8">  
          <div id="myCarousel" class="carousel slide">
            <!-- Indicadores -->
            <ol class="carousel-indicators">
              <li class="item1 active"></li>
              <li class="item2"></li>
              <li class="item3"></li>
              <li class="item4"></li>
            </ol>

            <!-- Wrapper for slides -->
            <div class="carousel-inner" role="listbox">

              <div class="item active">
                <img src="imagenes/cocheras/garage1.jpg" class="imgDef" alt="Chania" width="460" height="345">
                <div class="carousel-caption">
                  <h3>Cochera 1</h3>
                  <p>Pulcra,amplia y económica.</p>
                </div>
              </div>

              <div class="item">
                <img src="imagenes/cocheras/garage2.jpg" class="imgDef" alt="Chania" width="460" height="345">
                <div class="carousel-caption">
                  <h3>Cochera 2</h3>
                  <p>La más prestigiosa de zona oeste.</p>
                </div>
              </div>
    
              <div class="item">
                <img src="imagenes/cocheras/garage3.jpg" class="imgDef" alt="Flower" width="460" height="345">
                <div class="carousel-caption">
                  <h3>Cochera 3</h3>
                  <p>Seguridad garantizada.</p>
                </div>
              </div>

              <div class="item">
                <img src="imagenes/cocheras/garage4.jpg" class="imgDef" alt="Flower" width="460" height="345">
                <div class="carousel-caption">
                  <h3>Cochera 4</h3>
                  <p>Comodidad y buenos precios.</p>
                </div>
              </div>
  
            </div>
          </div>
        </div>

        <%--Inicio User Control--%>
        <uc2:Busqueda runat="server" id="UCBusquedaDefault" class="col-lg-4"/>
        <%--Fin User Control--%>
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
    <div id="bannerRow" visible="true" runat="server" class="row espaciado-inferior">
        <img id="banner" class="col-lg-12" src="imagenes/cocheras/banna.gif" />
    </div>

    <div id="asd" runat="server" visible="false">
        <table class="table table-hover table-inverse">
            <thead>
                <tr>
                    <th>Propietario</th>
                    <th>Precio hora</th>
                    <th>Foto</th>
                    <th>Ubicación</th>
                    <th>Puntuación</th>
                    <th></th>
                </tr>
            </thead>
        
            <tbody>
            
                <asp:Repeater EnableViewState="false" ID="Repeater1" runat="server">
                    <ItemTemplate>
                        <tr>
                            <td><%# Eval("Usuario_Que_Creó") %></td>
                            <td><%# Eval("precio_hora") %></td>
                            <td><button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal" data-img="<%# Eval("imagen") %>">Ver foto</button></td>
                            <td><button type="button" class="btn btn-warning mapita" data-toggle="modal" data-target="#myModal1" data-lat="<%# Eval("lat") %>" data-lon="<%# Eval("lon") %>">Ver Mapa</button></td>
                            <td> <%# Eval("Puntuación") %> </td>
                            <td><a href="<%# String.Format("/clientes/reservar.aspx?id={0}", Eval("idCochera")) %>">Reservar</a></td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
                
            </tbody>
            
        </table>
    </div>
    
  
    <div class="modal fade" id="myModal" role="dialog">
        <div class="modal-dialog">
    
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Imagen de la cochera</h4>
                </div>
                <div class="modal-body">
                    <img id="imagenModal" src="" class="foto img-responsive img-rounded" alt="Cochera1" width="304" height="236"/>
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
            <div id="myModal7" class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Ubicacion de la cochera</h4>
                </div>
    
                <div class="modal-body">

                    <div id="mapa" class="" style="width:369px; height:350px; margin-bottom:20px;"></div>
                    
                    <!--div id="map_canvas_custom_298712" class="" style="width:369px; height:350px"/-->

                    <script type="text/javascript">
                        /*(function (d, t) {
                            var g = d.createElement(t), s = d.getElementsByTagName(t)[0];
                            g.src = "http://map-generator.net/es/maps/298712.js?point=Mariano+J.+Haedo%2C+Argentina";
                            s.parentNode.insertBefore(g, s);
                        }(document, "script"));*/
                    </script>

                    <!--a class="mapgen-link" style="font:8px Arial;text-decoration:none;color:#5C5C5C;text-align: right; display: block; width: 369px;" href="http://map-generator.net/es">map-generator.net</a-->

                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                </div>    
            </div>

        </div>
    </div>
    
</asp:Content>

