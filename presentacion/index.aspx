<%@ Page Title="" Language="C#" MasterPageFile="~/presentacion/MasterPage.master" AutoEventWireup="true" CodeFile="~/logica/index.aspx.cs" Inherits="presentacion_Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        @font-face{
			font-family: 'titulo';
			src: url('../fonts/Bagad-Bold-Tryout.ttf');
		}
        
        .datos{
            width: 22%;
            height:32%;
            margin-left: 30%;
            margin-top:13%;
            padding-top: 2%;
            padding-bottom: 2%;
        }
        .guia{
            background-color:rgba(255,255,255,0.9);
            border:solid 1px black;
            box-shadow:inset 0 0 15px gray;
            width: 20%;
            height:32%;
            border-radius:50%;
            position:absolute;
            margin-left:39%;
            margin-top:7%;
            padding-top: 4%;
            padding-bottom: 0%;
        }
        
        .login {
            background-color:rgba(255,255,255,0.9);
            border:solid 1px black;
            box-shadow:inset 0 0 15px gray;
            width: 20%;
            height:32%;
            border-radius:50%;
            position:absolute;
            margin-left:7%;
            margin-top:13%;
            padding-top: 2%;
            padding-bottom: 2%;
        }
        .video {
            background-color:rgba(255,255,255,0.9);
            border:solid 1px black;
            box-shadow:inset 0 0 15px gray;
            left: 55%;
            top: 19%;
            position:absolute;
            border-radius:5%;
            width: 37%;
            height:59%;
        }
        .div{
            margin-left:20%;
        }




          
    
    </style>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <span class="opciones">
            <span style="margin-left:60%;">
                <asp:LinkButton Text="Contactenos" style="color:white;" runat="server" PostBackUrl="~/presentacion/contactenos.aspx" /></span>
        </span>
    
    
    
    <!-- use jssor.slider.debug.js instead for debug -->
    <script>
        function WebForm_OnSubmit() {
            if (typeof (ValidatorOnSubmit) == "function" && ValidatorOnSubmit() == false) {
                $("#validation_dialog").dialog({
                    title: "Error!",
                    modal: true,
                    resizable: false,
                    buttons: {
                        Close: function () {
                            $(this).dialog('close');
                        }
                    }
                });
                return false;
            }
            return true;
        }
        function validarCorreo(sender, e) {
            var isValid;
            $.ajax({
                type: "POST",
                url: "index.aspx/validarCorreo",
                data: "{'code': '" + document.getElementById('<%= TextBox4.ClientID %>').value + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                async: false,
                success: function (msg) {
                    isValid = msg.d;
                }
            });
            e.IsValid = isValid;
        }
        function validar_cedula(sender, e) {
            var isValid;
            $.ajax({
                type: "POST",
                url: "index.aspx/validarCedula",
                data: "{'code': '" + document.getElementById('<%= TextBox1.ClientID %>').value + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                async: false,
                success: function (msg) {
                    isValid = msg.d;
                }
            });
            e.IsValid = isValid;
        }

        function login(event, element) {
            event.preventDefault();
            $.ajax({
                type: "POST",
                url: "index.aspx/login",
                data: "{'correo': '" + document.getElementById('<%= TextBox6.ClientID %>').value + "', 'pass': '" +
                    document.getElementById('<%= TextBox6.ClientID %>').value + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                async: false,
                success: function (result) {
                    console.log(result.d);
                    eval(result.d);
                }
            });
        }
    </script>
    <script type="text/javascript" src="../js/jssor.slider.min.js"></script>

    <div style="background-color:rgba(100, 150, 255,0.5); border-radius:15px; box-shadow:-15px 25px 15px black; width:90%; height:68%; position:absolute; top:14%; left:5%;">
    </div>
    <div class="video">
        <%--<iframe style="border-radius:5%; left:10%; top:10%; position:absolute; width:80%; height:80%;" src="https://www.youtube.com/embed/us0iqxU3NE0" frameborder="0" allowfullscreen></iframe>--%>
        <!-- Use a container to wrap the slider, the purpose is to enable slider to always fit width of the wrapper while window resize -->
    <div class="container">
        <!-- Jssor Slider Begin -->
        
        <!-- ================================================== -->
        <div id="slider1_container" style="visibility: hidden; position: relative; margin: 0 auto; margin-top:5%; width: 1140px; height: 800em; overflow: hidden;">

            <!-- Loading Screen -->
            <div u="loading" style="position: absolute; top: 0px; left: 0px;">
                <div style="filter: alpha(opacity=70); opacity:0.7; position: absolute; display: block;

                background-color: #000; top: 0px; left: 0px;width: 100%; height:100%;">
                </div>
                <div style="position: absolute; display: block; background: url(../img/loading.gif) no-repeat center center;

                top: 0px; left: 0px;width: 100%;height:100%;">
                </div>
            </div>

            <!-- Slides Container -->
            <div u="slides" style="position: absolute; left: 0px; top: 0px; width: 1140px; height: 700em;
            overflow: hidden;">
                <div>
                    <img u="image" src2="../img/home/01.jpg" />
                </div>
                <div>
                    <img u="image" src2="../img/home/02.jpg" />
                </div>
                <div>
                    <img u="image" src2="../img/home/03.jpg" />
                </div>
                <div>
                    <img u="image" src2="../img/home/04.jpg" />
                </div>
            </div>
            
            <!--#region Bullet Navigator Skin Begin -->
            <!-- Help: http://www.jssor.com/development/slider-with-bullet-navigator-no-jquery.html -->
            <style>
                /* jssor slider bullet navigator skin 05 css */
                /*
                .jssorb05 div           (normal)
                .jssorb05 div:hover     (normal mouseover)
                .jssorb05 .av           (active)
                .jssorb05 .av:hover     (active mouseover)
                .jssorb05 .dn           (mousedown)
                */
                .jssorb05 {
                    position: absolute;
                }
                .jssorb05 div, .jssorb05 div:hover, .jssorb05 .av {
                    position: absolute;
                    /* size of bullet elment */
                    width: 16px;
                    height: 16px;
                    background: url(../img/b05.png) no-repeat;
                    overflow: hidden;
                    cursor: pointer;
                }
                .jssorb05 div { background-position: -7px -7px; }
                .jssorb05 div:hover, .jssorb05 .av:hover { background-position: -37px -7px; }
                .jssorb05 .av { background-position: -67px -7px; }
                .jssorb05 .dn, .jssorb05 .dn:hover { background-position: -97px -7px; }
            </style>
            <!-- bullet navigator container -->
            <div u="navigator" class="jssorb05" style="bottom: 16px; right: 6px;">
                <!-- bullet navigator item prototype -->
                <div u="prototype"></div>
            </div>
            <!--#endregion Bullet Navigator Skin End -->
            
            <!--#region Arrow Navigator Skin Begin -->
            <!-- Help: http://www.jssor.com/development/slider-with-arrow-navigator-no-jquery.html -->
            <style>
                /* jssor slider arrow navigator skin 11 css */
                /*
                .jssora11l                  (normal)
                .jssora11r                  (normal)
                .jssora11l:hover            (normal mouseover)
                .jssora11r:hover            (normal mouseover)
                .jssora11l.jssora11ldn      (mousedown)
                .jssora11r.jssora11rdn      (mousedown)
                */
                .jssora11l, .jssora11r {
                    display: block;
                    position: absolute;
                    /* size of arrow element */
                    width: 37px;
                    height: 37px;
                    cursor: pointer;
                    background: url(../img/a11.png) no-repeat;
                    overflow: hidden;
                }
                .jssora11l { background-position: -11px -41px; }
                .jssora11r { background-position: -71px -41px; }
                .jssora11l:hover { background-position: -131px -41px; }
                .jssora11r:hover { background-position: -191px -41px; }
                .jssora11l.jssora11ldn { background-position: -251px -41px; }
                .jssora11r.jssora11rdn { background-position: -311px -41px; }
            </style>
            <!-- Arrow Left -->
            <span u="arrowleft" class="jssora11l" style="top: 123px; left: 8px;">
            </span>
            <!-- Arrow Right -->
            <span u="arrowright" class="jssora11r" style="top: 123px; right: 8px;">
            </span>
            <!--#endregion Arrow Navigator Skin End -->
            <a style="display: none" href="http://www.jssor.com">Bootstrap Carousel</a>
        </div>
        <!-- Jssor Slider End -->
    </div>
    </div>

    <div  class="login">
        <center><br /><br /><div class="titulo2">INICIAR SESIÓN</div></center>
        <div class="div">
            <asp:TextBox ID="TextBox6" runat="server" style="margin-top:3%" placeholder="Correo" width="70%"></asp:TextBox>
        </div>
        <div class="div">
            <asp:TextBox ID="TextBox7" runat="server" style="margin-top:3%;" placeholder="Contraseña" width="70%" TextMode="Password"></asp:TextBox>
        </div>
        <div>
            <asp:Button OnClientClick="login(event, this)" ID="Button1" style="margin-top:5%; margin-left:15%; width:70%;" class="boton" runat="server"  Text="Iniciar de sesión"/>
        </div>
    </div>
    <div class="datos">
        <div class="titulo2">REGISTRATE</div>
        <div class="div" style="margin-top:1.5%;">
            <asp:TextBox ID="TextBox1" runat="server" placeholder="Nit " width="70%" ValidationGroup="vr" TextMode="Number"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="vr" runat="server" ControlToValidate="TextBox1" ErrorMessage="Digite su numero de cedula" ForeColor="Red">*</asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ValidationGroup="vr" runat="server" ControlToValidate="TextBox1" ErrorMessage="El numero de cedula no es valido" ForeColor="Red" ValidationExpression="[\S\s]{8,11}">*</asp:RegularExpressionValidator>
            <asp:CustomValidator ID="CustomValidator2" ValidationGroup="vr" runat="server" ControlToValidate="TextBox1" ErrorMessage="Ya existe un usuario con el mismo numero de cedula" ForeColor="Red" ClientValidationFunction="validar_cedula">*</asp:CustomValidator>
        </div>
        
        <div class="div" style="margin-top:1.5%;">
            <asp:TextBox ID="TextBox2" runat="server" placeholder="Nombre" width="70%" ValidationGroup="vr"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1"  runat="server" ControlToValidate="TextBox2" ErrorMessage="Digite su nombre" ForeColor="Red" ValidationGroup="vr">*</asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="El nombre debe tener minimo 3 caracteres" ForeColor="Red" ValidationGroup="vr" ValidationExpression="[\S\s]{3,50}">*</asp:RegularExpressionValidator>
        </div>
        <%--<div class="div" style="margin-top:1.5%;">
            <asp:TextBox ID="TextBox3" runat="server" ValidationGroup="vr" placeholder="Apellido" width="70%"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ValidationGroup="vr" runat="server" ControlToValidate="TextBox3" ErrorMessage="Digite su apellido" ForeColor="Red">*</asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator6" ValidationGroup="vr" runat="server" ControlToValidate="TextBox3" ErrorMessage="El apellido debe tener minimo 3 caracteres" ForeColor="Red" ValidationExpression="[\S\s]{3,50}">*</asp:RegularExpressionValidator>
        </div>--%>
        <div class="div" style="margin-top:1.5%;">
            <asp:TextBox ID="TB_telefono" runat="server" placeholder="Teléfono" width="70%" ValidationGroup="vr"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator8"  runat="server" ControlToValidate="TB_telefono" ErrorMessage="Digite su telefono" ForeColor="Red" ValidationGroup="vr">*</asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="TB_telefono" ErrorMessage="El telefono debe tener minimo 7 caracteres" ForeColor="Red" ValidationGroup="vr" ValidationExpression="[\S\s]{7,50}">*</asp:RegularExpressionValidator>
        </div>
        <div class="div" style="margin-top:1.5%;">
            <asp:TextBox ID="TB_direccion" runat="server" ValidationGroup="vr" placeholder="Dirección" width="70%"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" ValidationGroup="vr" runat="server" ControlToValidate="TB_direccion" ErrorMessage="Digite su dirección" ForeColor="Red">*</asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator4" ValidationGroup="vr" runat="server" ControlToValidate="TB_direccion" ErrorMessage="la dirección debe tener minimo 3 caracteres" ForeColor="Red" ValidationExpression="[\S\s]{3,50}">*</asp:RegularExpressionValidator>
        </div>
        <div class="div" style="margin-top:1.5%;">
            <asp:TextBox ID="TextBox4" runat="server" ValidationGroup="vr" placeholder="correo" width="70%" TextMode="Email"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ValidationGroup="vr" runat="server" ControlToValidate="TextBox4" ErrorMessage="Digite un nombre de usuario" ForeColor="Red">*</asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator10" ValidationGroup="vr" runat="server" ControlToValidate="TextBox4" ErrorMessage="El nombre de usuario debe tener minimo 5 caracteres" ForeColor="Red" ValidationExpression="[\S\s]{5,30}">*</asp:RegularExpressionValidator>
            <asp:CustomValidator ID="CustomValidator1" ValidationGroup="vr" runat="server" ControlToValidate="TextBox4" ErrorMessage="El correo que digito ya existe" ForeColor="Red" ClientValidationFunction="validarCorreo">*</asp:CustomValidator>
        </div>
        <div class="div" style="margin-top:1.5%;">
            <asp:TextBox ID="TextBox5" runat="server" ValidationGroup="vr" placeholder="Contraseña" width="70%" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ValidationGroup="vr" runat="server" ControlToValidate="TextBox5" ErrorMessage="Digite una contraseña" ForeColor="Red">*</asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator11" ValidationGroup="vr" runat="server" ControlToValidate="TextBox5" ErrorMessage="La contraseña debe tener minimo 6 caracteres y al menos un numero y una letra" ForeColor="Red" ValidationExpression="(?=^.{6,}$)((?=.*\d))(?=.*[A-Za-z]).*">*</asp:RegularExpressionValidator>
        </div>
        <div>
            <asp:Button ID="Button2" class="boton" runat="server" ValidationGroup="vr" Text="Registrar" OnClick="Button2_Click" width="55%" style="margin-left:23%;" />
        </div>
        <div id="validation_dialog" style="display: none">
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="vr" />
            <asp:ValidationSummary ID="ValidationSummary3" runat="server" ValidationGroup="vl" />
        </div>
    </div>
    <%--<div class="guia">
        <div class="titulo2">MANUAL DE USUARIO</div>
        <div class="div">
            <asp:ImageButton ID="ImageButton1" runat="server" BorderWidth="0px" style="margin-top:10%; margin-left:8%;" ImageUrl="~/img/manual.png" width="50%" Height="7%" OnClick="ImageButton1_Click" />
        </div>
    </div>--%>
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="../js/jquery-1.9.1.min.js"></script>
    <script src="bootstrap.min.js"></script>
    <script src="docs.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="ie10-viewport-bug-workaround.js"></script>

    <!-- jssor slider scripts-->
    
    <script src="../js/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.23/jquery-ui.min.js" type="text/javascript"></script>
    <link href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/themes/Cupertino/jquery-ui.css"
        rel="stylesheet" type="text/css" />
    <script>
        $('#tdog').dialog({
            autoOpen: false,
            width: 200,
            modal: true,
        });
    </script>
    <script type="text/javascript" src="../js/jssor.slider.mini.js"></script>
    <script>

        jQuery(document).ready(function ($) {
            
            var options = {
                $AutoPlay: 1,                                       //[Optional] Auto play or not, to enable slideshow, this option must be set to greater than 0. Default value is 0. 0: no auto play, 1: continuously, 2: stop at last slide, 4: stop on click, 8: stop on user navigation (by arrow/bullet/thumbnail/drag/arrow key navigation)
                $AutoPlaySteps: 1,                                  //[Optional] Steps to go for each navigation request (this options applys only when slideshow disabled), the default value is 1
                $Idle: 2000,                                        //[Optional] Interval (in milliseconds) to go for next slide since the previous stopped if the slider is auto playing, default value is 3000
                $PauseOnHover: 1,                                   //[Optional] Whether to pause when mouse over if a slider is auto playing, 0 no pause, 1 pause for desktop, 2 pause for touch device, 3 pause for desktop and touch device, 4 freeze for desktop, 8 freeze for touch device, 12 freeze for desktop and touch device, default value is 1

                $ArrowKeyNavigation: true,   			            //[Optional] Allows keyboard (arrow key) navigation or not, default value is false
                $SlideEasing: $Jease$.$OutQuint,                    //[Optional] Specifies easing for right to left animation, default value is $Jease$.$OutQuad
                $SlideDuration: 800,                                //[Optional] Specifies default duration (swipe) for slide in milliseconds, default value is 500
                $MinDragOffsetToSlide: 20,                          //[Optional] Minimum drag offset to trigger slide , default value is 20
                //$SlideWidth: 600,                                 //[Optional] Width of every slide in pixels, default value is width of 'slides' container
                //$SlideHeight: 300,                                //[Optional] Height of every slide in pixels, default value is height of 'slides' container
                $SlideSpacing: 0, 					                //[Optional] Space between each slide in pixels, default value is 0
                $Cols: 1,                                           //[Optional] Number of pieces to display (the slideshow would be disabled if the value is set to greater than 1), the default value is 1
                $ParkingPosition: 0,                                //[Optional] The offset position to park slide (this options applys only when slideshow disabled), default value is 0.
                $UISearchMode: 1,                                   //[Optional] The way (0 parellel, 1 recursive, default value is 1) to search UI components (slides container, loading screen, navigator container, arrow navigator container, thumbnail navigator container etc).
                $PlayOrientation: 1,                                //[Optional] Orientation to play slide (for auto play, navigation), 1 horizental, 2 vertical, 5 horizental reverse, 6 vertical reverse, default value is 1
                $DragOrientation: 1,                                //[Optional] Orientation to drag slide, 0 no drag, 1 horizental, 2 vertical, 3 either, default value is 1 (Note that the $DragOrientation should be the same as $PlayOrientation when $Cols is greater than 1, or parking position is not 0)

                $ArrowNavigatorOptions: {                           //[Optional] Options to specify and enable arrow navigator or not
                    $Class: $JssorArrowNavigator$,                  //[Requried] Class to create arrow navigator instance
                    $ChanceToShow: 2,                               //[Required] 0 Never, 1 Mouse Over, 2 Always
                    $AutoCenter: 2,                                 //[Optional] Auto center arrows in parent container, 0 No, 1 Horizontal, 2 Vertical, 3 Both, default value is 0
                    $Steps: 1,                                      //[Optional] Steps to go for each navigation request, default value is 1
                    $Scale: false                                   //Scales bullets navigator or not while slider scale
                },

                $BulletNavigatorOptions: {                                //[Optional] Options to specify and enable navigator or not
                    $Class: $JssorBulletNavigator$,                       //[Required] Class to create navigator instance
                    $ChanceToShow: 2,                               //[Required] 0 Never, 1 Mouse Over, 2 Always
                    $AutoCenter: 1,                                 //[Optional] Auto center navigator in parent container, 0 None, 1 Horizontal, 2 Vertical, 3 Both, default value is 0
                    $Steps: 1,                                      //[Optional] Steps to go for each navigation request, default value is 1
                    $Rows: 1,                                      //[Optional] Specify lanes to arrange items, default value is 1
                    $SpacingX: 12,                                   //[Optional] Horizontal space between each item in pixel, default value is 0
                    $SpacingY: 4,                                   //[Optional] Vertical space between each item in pixel, default value is 0
                    $Orientation: 1,                                //[Optional] The orientation of the navigator, 1 horizontal, 2 vertical, default value is 1
                    $Scale: false                                   //Scales bullets navigator or not while slider scale
                }
            };

            var jssor_slider1 = new $JssorSlider$("slider1_container", options);

            //responsive code begin
            //you can remove responsive code if you don't want the slider scales while window resizing
            function ScaleSlider() {
                var parentWidth = jssor_slider1.$Elmt.parentNode.clientWidth;
                if (parentWidth) {
                    jssor_slider1.$ScaleWidth(parentWidth - 30);
                }
                else
                    window.setTimeout(ScaleSlider, 30);
            }
            ScaleSlider();

            $(window).bind("load", ScaleSlider);
            $(window).bind("resize", ScaleSlider);
            $(window).bind("orientationchange", ScaleSlider);
            //responsive code end
        });
    </script>
</asp:Content>

