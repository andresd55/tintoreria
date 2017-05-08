<%@ Page Title="" Language="C#" MasterPageFile="~/presentacion/MasterPage.master" AutoEventWireup="true" CodeFile="~/logica/contactenos.aspx.cs" Inherits="presentacion_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <!DOCTYPE HTML>
    <head>
        <style type="text/css">
            .datos{
                width: 40%;
                height:60%;
                margin-left:9%;
                margin-top:8%;
                padding-top: 1.3em;
            }
            #mostrarMapa {
                margin-left: 5%;
                margin-top:2%;
                width:90%;
                height:90%;
                border-radius: 50%;
            }
            .Estilo10 {
                margin-top:5%;
                margin-left:54%;
                z-index:10;
                position:absolute;
            }

        </style>
        <script src="../js/jquery-1.9.1.min.js" type="text/javascript"></script>    
        <link rel="stylesheet" type="text/css" href="../js/jquery.classysocial.min.css" />
        <script src="../js/bootstrap.min.js"></script>
    <script src="../js/jquery.classysocial.min.js"></script>
    <script src="../js/functions.js"></script>
        <script type="text/javascript" src="https://maps.google.com/maps/api/js?libraries=places&key= AIzaSyAiEZe3SPI3Y_oygCAPVj3DWYyggjxmI94 "></script>
         <script type="text/javascript">
             // <![CDATA[

             function mostrarGoogleMaps() {
                 //Creamos el punto a partir de las coordenadas:
                 var punto = new google.maps.LatLng(4.81233, -74.27535);
                 var punto2 = new google.maps.LatLng(4.81233, -74.29535);
                 //Configuramos las opciones indicando Zoom, punto(el que hemos creado) y tipo de mapa
                 var myOptions = {
                     zoom: 12, center: punto2, mapTypeId: google.maps.MapTypeId.ROADMAP
                 };

                 //Creamos el mapa e indicamos en qu顣aja queremos que se muestre
                 var map = new google.maps.Map(document.getElementById("mostrarMapa"), myOptions);

                 //Opcionalmente podemos mostrar el marcador en el punto que hemos creado.
                 var marker = new google.maps.Marker({
                     position: punto,
                     map: map,
                     title: "Como llegar"
                 });
             }

             // ]]>
         </script>
    </head>
    <div style="background-color:rgba(100, 150, 255,0.5); border-radius:15px; box-shadow:-15px 25px 15px black; width:90%; height:68%; position:absolute; top:14%; left:5%;">
    </div>
    <span class="opciones">
            <span style="margin-left:60%;">
                <asp:LinkButton ID="LinkButton1" Text="Inicio" style="color:white;" runat="server" PostBackUrl="~/presentacion/index.aspx" /></span>
        </span>
    <body onload="mostrarGoogleMaps()">
    <div class="datos" >
        <div id="mostrarMapa" > 
            
        </div>
    </div>
    <br />
        <div id="hola" style="width:10%; height:10%; margin-left:70%; margin-top:13%;">
      <div class="row">
            <div class="classysocial"
              data-theme="default"
              data-image-type="picture"
              data-picture="../img/logo.jpg"
              data-facebook-handle="endeos"
              data-google-handle="+Endeos"
              data-twitter-handle="Endeos_SL"
              data-orientation="arc"
              data-radius="60"
              data-arc-length="180"
              data-gap="50"
              data-networks="facebook,twitter,google"></div>
        </div>
      </div>
        <center>
    <p class="Estilo10">Finca el retiro vda Granada, Facatativá. 
        
        <br />
        Tels (57 1) 825 1086 - 616 1599  
        <br />
        Mail <a href="mailto:flores_america@hotmail.com">flores_america@hotmail.com</a><br />
        Horario:   Lunes a sabado 12 M a 12 PM - Domingos y festivos: 12 M a 6 PM<br />
        Facatativá   - COLOMBIA</p>
        </center>
    </body>

    </html>
    
</asp:Content>

