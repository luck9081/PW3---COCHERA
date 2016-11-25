<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Propietarios.Master" AutoEventWireup="true" CodeBehind="cocheras.aspx.cs" Inherits="AlquilaCocheras.Web.propietarios.cocheras" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder_Head" runat="server">
    
    <title>Cochera - Nueva Cochera</title>

    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyByG25PdBB9LYQkjVm3MGcJKMem-CzZPPc&libraries=places"></script>
    <script type="text/javascript" src="/js/maps.js"></script>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder_Principal" runat="server">

    <div class="container espaciado-superior espaciado-inferior">
        <div class="row">        
            <div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
                <div role="form">
                    
                    <div id="divResultado" class="row" runat="server" visible="false">
                        <h3>
                            <asp:Label ID="lblResultado" CssClass="h3-responsive font-celeste animated zoomIn" runat="server" Text = "Operación Exitosa"></asp:Label>
                        </h3>
                        <br />
                    </div>                        
                        
                        
                    <h2 class="animated flipInX">Nueva Cochera</h2>
                                                
                    <div class="animated slideInLeft">
                        
                        <hr class="colorgraph">                        

                        <div class="form-group md-form">
                            <i class="fa fa-map-marker prefix fav-icon-input"></i>
                            <asp:TextBox ID="txtUbicacion" placeholder="Ubicación" CssClass="form-control input-lg"  runat="server" ClientIDMode="Static"/>                            
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="alert danger-color validator animated zoomIn" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtUbicacion" Text="¡Ups! Falta la ubicación" SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>
                                
                            <br />
                                
                            <i class="fa fa-arrows-h prefix fav-icon-mail" aria-hidden="true"></i>
                            <asp:TextBox ID="txtLatitud" placeholder="Latitud" CssClass="form-control input-lg" runat="server" ClientIDMode="Static" Enabled="True" ReadOnly="True" ValidateRequestMode="Disabled"></asp:TextBox>
                                
                            <br />
                                
                            <i class="fa fa-arrows-v prefix fav-icon-input" aria-hidden="true"></i>
                            <asp:TextBox ID="txtLongitud" placeholder="Longitud" CssClass="form-control input-lg" runat="server" ClientIDMode="Static" ReadOnly="True" ValidateRequestMode="Disabled"></asp:TextBox>
                        
                        </div>
        
                        <br />
                        <br />        
                        
                        <div class="form-group md-form">
                            <asp:Label ID="label5" CssClass="fuente-mediana"  runat="server" Text="Descripción: "></asp:Label>
                            <br />
                            <i class="fa fa-pencil prefix fav-icon-mail" aria-hidden="true"></i>
                            <asp:TextBox ID="txtDescripcion" CssClass="form-control input-lg" runat="server" ClientIDMode="Static" TextMode="MultiLine" ReadOnly="False"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" CssClass="alert danger-color validator animated zoomIn" Text="¡Redactemos una descripción para tu cochera!" runat="server" ControlToValidate="txtDescripcion" ErrorMessage="RequiredFieldValidator" SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>        

                        <br />
                        <br />

                        <div class="form-group md-form">
                            <asp:Label ID="label1" CssClass="fuente-mediana" runat="server" Text="Fecha Inicio Disponibilidad: "></asp:Label>
                            <br />
                            <i class="fa fa-calendar prefix fav-icon-mail"></i>
                            <asp:TextBox ID="txtFechaInicio" placeholder="Fecha Inicio Disponibilidad" CssClass="form-control input-lg" runat="server" ClientIDMode="Static" TextMode="Date"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" CssClass="alert danger-color validator animated zoomIn" Text="¡Añade una fecha de inicio!" runat="server" ClientIDMode="Static" ControlToValidate="txtFechaInicio" ErrorMessage="RequiredFieldValidator" SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="CompareValidator1" CssClass="alert danger-color validator animated zoomIn" Text="¡La fecha de Inicio debe ser inferior a la de Finalización!" runat="server" ErrorMessage="CompareValidator" ControlToValidate="txtFechaInicio" Operator="LessThan" Display="Dynamic" ControlToCompare="txtFechaFin"></asp:CompareValidator>
                            
                            <br />
                            <br />
                            
                            <asp:Label ID="label2" CssClass="fuente-mediana" runat="server" Text="Fecha Finalización Disponibilidad: "></asp:Label>
                            <br />
                            <i class="fa fa-calendar prefix fav-icon-mail"></i>
                            <asp:TextBox ID="txtFechaFin" placeholder="Fecha Fin Disponibilidad" CssClass="form-control input-lg" runat="server" ClientIDMode="Static" ControlToValidate="txtFechaFin" TextMode="Date"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" CssClass="alert danger-color validator animated zoomIn" Text="¡Añade una fecha de finalización!" runat="server" ControlToValidate="txtFechaFin" ErrorMessage="RequiredFieldValidator" SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>

                        </div>

                        <br />
                        <br />

                        <div class="form-group md-form">
                            <asp:Label ID="label3" CssClass="fuente-mediana"  runat="server" Text="Hora Inicio Disponibilidad: "></asp:Label>
                            <br />
                            <i class="fa fa-clock-o prefix fav-icon-mail" aria-hidden="true"></i>
                            <asp:TextBox ID="txtHorarioInicio" placeholder="Hora Inicio Disponibilidad" CssClass="form-control input-lg" runat="server" ClientIDMode="Static" TextMode="Time"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" CssClass="alert danger-color validator animated zoomIn" Text="¡Añade una Hora de Inicio!" runat="server" ControlToValidate="txtHorarioInicio" ErrorMessage="RequiredFieldValidator" SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="CompareValidator2" CssClass="alert danger-color validator animated zoomIn" Text="¡La Hora de Inicio debe ser inferior a la de Finalización!" runat="server" ErrorMessage="CompareValidator" ControlToValidate="txtHorarioInicio" Operator="LessThan" Display="Dynamic" ControlToCompare="txtHorarioFin"></asp:CompareValidator>

                            <br />
                            <br />
                            
                            <asp:Label ID="label4" CssClass="fuente-mediana"  runat="server" Text="Hora Finalización Disponibilidad: "></asp:Label>
                            <br />
                            <i class="fa fa-clock-o prefix fav-icon-mail" aria-hidden="true"></i>
                            <asp:TextBox ID="txtHorarioFin" placeholder="Hora Fin Disponibilidad" CssClass="form-control input-lg" runat="server" ClientIDMode="Static" TextMode="Time"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" CssClass="alert danger-color validator animated zoomIn" Text="¡Añade una Hora de Finalización!" runat="server" ControlToValidate="txtHorarioFin" ErrorMessage="RequiredFieldValidator" SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>  

                        <br />
                        <br />

                        <div class="form-group md-form">
                            <i class="fa fa-superscript prefix fav-icon-input" aria-hidden="true"></i>
                            <asp:TextBox ID="txtMetrosCuadrados" placeholder="Metros Cuadrados" CssClass="form-control input-lg" runat="server" ClientIDMode="Static" TextMode="Number"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" CssClass="alert danger-color validator animated zoomIn" Text="¿Cuánto espacio ofrece tu cochera?" runat="server" ControlToValidate="txtMetrosCuadrados" ErrorMessage="RequiredFieldValidator" SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="CompareValidator3" CssClass="alert danger-color validator animated zoomIn" Text="¡La medida debe ser un número entero mayor a cinco!" runat="server" ControlToValidate="txtMetrosCuadrados" ErrorMessage="CompareValidator" Type="Integer" Operator="GreaterThan" ValueToCompare="5" Display="Dynamic"></asp:CompareValidator>
                        </div>       

                        <br />

                        <div class="form-group md-form">
                            <i class="fa fa-dollar prefix fav-icon-input" aria-hidden="true"></i>
                            <asp:TextBox ID="txtPrecioHora" CssClass="form-control input-lg" placeholder="Monto por Hora" runat="server" ClientIDMode="Static" TextMode="SingleLine"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" CssClass="alert danger-color validator animated zoomIn" Text="¿Cuánto cobrarás por hora?" runat="server" ControlToValidate="txtPrecioHora" ErrorMessage="RequiredFieldValidator" SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="CompareValidator4" CssClass="alert danger-color validator animated zoomIn" Text="¡El precio debe ser un número decimal mayor a cero!" runat="server" ControlToValidate="txtPrecioHora" ErrorMessage="CompareValidator" Type="Double" Operator="GreaterThan" ValueToCompare="0" Display="Dynamic"></asp:CompareValidator>
                        </div> 
                        
                        <br />

                        <div class="form-group md-form">
                            <asp:Label ID="label8" CssClass="fuente-mediana" for="lbTipoVehiculo" runat="server" Text="Tipo Vehículo: "></asp:Label>
                            <asp:ListBox ID="lbTipoVehiculo" CssClass="form-control" runat="server" ClientIDMode="Static" SelectionMode="Single" Rows="2">
                                <asp:ListItem Value="0">Auto</asp:ListItem>
                                <asp:ListItem Value="1">Pickup</asp:ListItem>
                                <asp:ListItem Value="2">Camion</asp:ListItem>
                                <asp:ListItem Value="3">Moto</asp:ListItem>
                            </asp:ListBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator10" CssClass="alert danger-color validator animated zoomIn" Text="¿Qué tipos de vehículo caben en tu cochera?" runat="server" ControlToValidate="lbTipoVehiculo" ErrorMessage="RequiredFieldValidator" SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                        
                        <br />

                        <div class="form-group">
                            <asp:Label ID="label10" CssClass="fuente-mediana" runat="server" Text="Foto: "></asp:Label>
                            <asp:FileUpload ID="fuFoto" CssClass="input-lg" runat="server" ClientIDMode="Static" />
                            <asp:Label ID="label26" CssClass="alert danger-color validator animated zoomIn" runat="server" ></asp:Label>
                            <br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" CssClass="alert danger-color validator animated zoomIn" Text="Elija una foto para mostrar su cochera" runat="server" ControlToValidate="txtFechaFin" ErrorMessage="RequiredFieldValidator" SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                        
                    <hr class="colorgraph">
                    <asp:Button ID="btnCrearCochera" CssClass="btn btn-lg btn-primary btn-block" runat="server" Text="Crear Cochera" ClientIDMode="Static" OnClick="btnCrearCochera_Click"/>
                
                </div>
            </div>
        </div>
    </div>
    
</asp:Content>
