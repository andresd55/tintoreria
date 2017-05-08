<%@ Page Title="" Language="C#" MasterPageFile="~/presentacion/MasterPage.master" AutoEventWireup="true" CodeFile="~/logica/_administrar_servicios.aspx.cs" Inherits="presentacion_Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script src="../js/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.23/jquery-ui.min.js" type="text/javascript"></script>
    <link href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/themes/Cupertino/jquery-ui.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        @font-face{
            font-family: 'titulo';
            src: url('../fonts/Bagad-Bold-Tryout.ttf');
        }
        .t {
            margin: 0 auto;
            margin-top: 7%;
            width:80%;
            color: #000;
            text-shadow: 1px 1px 1px #2DBEE8;
            font-family: 'Times New Roman';
            font-size:30px;
            height:50px;
            padding-top:10px;
            text-align:center;
            background-color:rgba(255,255,255,0.9);
            border:solid 1px black;
            box-shadow:inset 0 0 15px gray;
        }
        input{
            border:1px solid rgba(120,120,120,1);
            border-radius: 5px;
            padding: 0em 0.5em 0em 0.5em;
            box-shadow: inset 0px 0px 3px 1px rgba(100,100,100,0.6);
        }
        input:focus{
            border:1px solid #0000FF; 
            box-shadow:inset 0px 0px 2px 1px rgba(100,100,100,0.6), 0px 0px 4px 1px rgba(0,0,200,0.4);
        }
        .header{
            width: 100%;
            background-color:#175480;
            color:white;
        }
        .auto-style5 {
            width: 100%;
        }
        .auto-style6 {
            border: solid 1px black;
            word-break: break-all;
            word-wrap: break-word;
            overflow-wrap: break-word;
            white-space: normal;
        }
        .h_des{
            border: solid 1px black;
        }
        .datos {
            background-color:rgba(255,255,255,0.9);
            border:solid 1px black;
            box-shadow:inset 0 0 15px gray;
            width:90%;
            margin: 0 auto;
            margin-top:30px;
            border-radius:5px;
            padding-bottom: 50px;
        }
        .in {
            color:blue;
            text-shadow: 1px 1px 1px black;
            margin-bottom:10px;
            color: #000;
            text-shadow: 5px 5px 5px #97A03D;
            font-size:20px;

        }
        .boton {
            height: 23px; 
            width:200px;
            text-align: center;
            background-image: linear-gradient(to top,#97A03D,#DFE1A2);
            margin-left:60px;
            margin-top:10px;
            color: white;
            position:absolute;
        }
        .boton2{
            height: 23px; 
            width:70%;
            text-align: center;
            background-image: linear-gradient(to top,#97A03D,#DFE1A2);
            margin-left:15%;
            margin-top:50px;
            color: white;
            position:absolute;
        }
        .des{
            margin-left:8%;
        }
        .ries{
            margin-left:3%;
            position:absolute;
            display:inline-block;
        }
        .grid {
            background-color:rgba(255,255,255,0.9);
            border:solid 1px black;
            box-shadow:inset 0 0 15px gray;
            margin:0 auto;
            margin-top: 30%;
            border-radius:5px;
            width:90%;
        }
        .ddd{
            visibility:hidden;
        }
    </style>
    <script>
        
        function eliminar_proceso(event, element) {
            event.preventDefault();
            $(element).parent().remove();

            $( ".new_proceso" ).each(function( index ) {
                //console.log(index + ": " + $(this).text());
                $(this).find("#ttt").html("Proceso " + (index + 1));
            });
        }
        
        function agregar_proceso(event, element) {
            try{
                event.preventDefault();

                var e = $("#new_proceso").clone();
                e.find("#products").html("<tr class='pro'></tr>");
                e.find("#ttt").html("Proceso " + (parseInt($(".new_proceso").length) + 1));
                e.find(".ddd").removeClass("ddd");
                n = e.find("#ContentPlaceHolder1_TB_nombre");
                n.val("");
                if ($(n).siblings().length != 0)
                    $(n).siblings().remove();

                $($(".new_proceso")[$(".new_proceso").length - 1]).after(e);
            }
            catch(e){

            }
            $("#sss").scrollTop("90000");
        }
        
        function agregar_producto(event, element) {
            event.preventDefault();
                var html = '';
                var productos = null;
                $.ajax({
                    type: "POST",
                    url: "_administrar_servicios.aspx/obtenerProductos",
                    data: "",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    async: false,
                    success: function (result) {
                        console.log((JSON.parse(result.d)).Table1);
                        productos = (JSON.parse(result.d)).Table1;
                    }
                });

                html += '<div id="checkboxes" style ="overflow-y: scroll; overflow-x: hidden; padding-top:0.1em">';
                html += ' <select id="pr">';
                
                for (var i = 1; i < productos.length; i++) {
                    if ($(":contains(\"" + productos[i - 1][1] + "\")", $(element).parent().find(".pro").parent()).length == 0)
                        html += '<option name="' + i + '" value="' + productos[i - 1][1] + ':::' + i +'">' + productos[i - 1][1] + '</option>';
                }
                html += '</select> ';
                html += '</div>';
                html += '<div>Cantidad:</div><span> <input type="number" id="cant" style="width:30%;" > </span>';
                html += '<span id="unidad">' + productos[0][3] + '</span>';
                html += '<input type="hidden" id="u" value="' + productos[0][3] + '" />'
                var $myDialog = $('<div id="dialogbox"></div>')
                .html(html)
                .dialog({
                    autoOpen: false,
                    title: 'Agregar Producto',
                    modal: true,
                    resizable: false,
                    buttons: {
                        "Aceptar": function () {
                            if ($('#cant').val() != ""){
                                $(this).dialog("close");
                                html = "<tr style='border: 1px solid black' ><th style='border: 1px solid black'>" +
                                ($('#pr').val()).split(":::")[0] + "</th><th style='border: 1px solid black'> " +
                                $('#cant').val() + "&nbsp;" + $("#u").val() + "</th></tr>";
                                $(element).parent().find(".pro").before(html);

                                $('#dialogbox').remove();
                                return false;
                            }
                            else {
                                if ($('#cant').siblings().length == 0)
                                    $('#cant').after("<span style='color:red;'>*</span>");
                            }
                        },
                        "Cancelar": function () {
                            $(this).dialog("close");
                            $('#dialogbox').remove();
                            return false;
                        }
                    }
                });
                $myDialog.dialog('open');
                loaded("#pr", function (el) {
                    el.on("change", function () {
                        num = parseInt(($('#pr').val()).split(":::")[1]);
                        $('#unidad').html(productos[num][3] + "");
                        $("#u").val(productos[num][3] + "");
                    });
                });
                function loaded(selector, callback) {
                    //trigger after page load.
                    $(function () {
                        callback($(selector));
                    });
                    //trigger after page update eg ajax event or jquery insert.
                    $(document).on('DOMNodeInserted', selector, function () {
                        callback($(this));
                    });
                }
                
        }

        function agregar_servicio(event, element) {
            event.preventDefault();

            var valid = true;
            mensajes = "<ul>";

            if ($('#ContentPlaceHolder1_TextBox1').siblings().length != 0)
                $('#ContentPlaceHolder1_TextBox1').siblings().remove();

            if ($('#ContentPlaceHolder1_TextBox1').val() == "") {
                $('#ContentPlaceHolder1_TextBox1').after("<span style='color:red;'>*</span>");
                valid = false;
                mensajes += "<li>Digite el nombre del servicio</li>";
            }

            $('#ContentPlaceHolder1_TextBox1').change(function () {
                if ($('#ContentPlaceHolder1_TextBox1').siblings().length != 0)
                    $('#ContentPlaceHolder1_TextBox1').siblings().remove();

                if ($('#ContentPlaceHolder1_TextBox1').val() == "") {
                    $('#ContentPlaceHolder1_TextBox1').after("<span style='color:red;'>*</span>");
                }
            });

            $('input[id^="ContentPlaceHolder1_TB_nombre"]').each(function (index) {

                if ($(this).siblings().length != 0)
                    $(this).siblings().remove();

                if ($(this).val() == "") {
                    $(this).after("<span style='color:red;'>*</span>");
                    valid = false;
                    mensajes += "<li>Digite el nombre del proceso " + (index + 1) + "</li>";
                }

                $(this).change(function () {
                    if ($(this).siblings().length != 0)
                        $(this).siblings().remove();

                    if ($(this).val() == "") {
                        $(this).after("<span style='color:red;'>*</span>");
                    }
                });
            });

            mensajes += "</ul>";
            
            if (!valid) {
                var $myDialog = $('<div></div>')
                .html(mensajes)
                .dialog({
                    autoOpen: false,
                    title: 'Error!',
                    modal: true,
                    resizable: false,
                    buttons: {
                        "Aceptar": function () {
                            $(this).dialog("close");
                            return false;
                        }
                    }
                });
                $myDialog.dialog('open');
            }
            else {
                var procesos = [];
                var productos = null;
                
                $.ajax({
                    type: "POST",
                    url: "_administrar_servicios.aspx/obtenerProductos",
                    data: "",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    async: false,
                    success: function (result) {
                        productos = (JSON.parse(result.d)).Table1;
                    }
                });

                $('input[id^="ContentPlaceHolder1_TB_nombre"]').each(function (index) {
                    pr = [];
                    c = 1;
                    for (var i = 1; i < productos.length; i++) {
                        if ($(":contains(\"" + productos[i - 1][1] + "\")", $($(this).parent()).parent().find(".pro").parent()).length > 0) {
                            pr.push("{ 'nombre': '" + productos[i - 1][1] + "', 'valor': '" + $($($($(this).parent()).parent()).find('th')[c]).text() + "'}");
                            c += 2;
                        }
                    }

                    //$('input[id^="ContentPlaceHolder1_TB_nombre"]').each(function (index) {
                    procesos.push("{'nombre': '" + $(this).val() + "', 'productos': " + JSON.stringify(pr) + "}");
                    //});
                });
                $.ajax({
                    type: "POST",
                    url: "_administrar_servicios.aspx/agregarServicio",
                    data: "{'servicio': '" + $('#ContentPlaceHolder1_TextBox1').val() + "', 'procesos': " + JSON.stringify(procesos) + "}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    async: false,
                    success: function (msg) {

                        $('<div>El producto se ha eliminado correctamente</div>')
                            .dialog({
                                title: 'Eliminado',
                                modal: true,
                                resizable: false,
                                buttons: {
                                    Close: function () {
                                        $(this).dialog('close');
                                        location.assign(window.location);
                                    }
                                }
                            });
                    }
                });
            }
        }
        
        function showConfirm(event, e) {
            event.preventDefault();
            var $myDialog = $('<div></div>')
            .html('¿Esta seguro que desea eliminar este producto?')
            .dialog({
                autoOpen: false,
                title: 'Eliminar producto',
                modal: true,
                resizable: false,
                buttons: {
                    "Aceptar": function () {
                        $(this).dialog("close");
                        $.ajax({
                            type: "POST",
                            url: "_administrar_productos.aspx/eliminarProducto",
                            data: "{'code': " + e.value + "}",
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            async: false,
                            success: function (msg) {

                                $('<div>El producto se ha eliminado correctamente</div>')
                                    .dialog({
                                        title: 'Eliminado',
                                        modal: true,
                                        resizable: false,
                                        buttons: {
                                            Close: function () {
                                                $(this).dialog('close');
                                                location.assign(window.location);
                                            }
                                        }
                                    });
                            }
                        });
                        return true;
                    },
                    "Cancelar": function () {
                        $(this).dialog("close");
                        return false;
                    }
                }
            });
            $myDialog.dialog('open');
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script src="../js/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.23/jquery-ui.min.js" type="text/javascript"></script>
    <link href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/themes/Cupertino/jquery-ui.css"
        rel="stylesheet" type="text/css" />
    <!-- use jssor.slider.debug.js instead for debug -->
    <script>
        function WebForm_OnSubmit() {
            if (typeof (ValidatorOnSubmit) == "function" && ValidatorOnSubmit() == false) {
                $("#validation_dialog2").dialog({
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

        function validarNombre(sender, e) {
            if ($('#' + sender.controltovalidate).attr('data') != undefined) {
                if ($('#' + sender.controltovalidate).attr('data') != document.getElementById(sender.controltovalidate).value) {
                    var isValid;
                    $.ajax({
                        type: "POST",
                        url: "_administrar_productos.aspx/validarNombre",
                        data: "{'code': '" + document.getElementById(sender.controltovalidate).value + "'}",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        async: false,
                        success: function (msg) {
                            isValid = msg.d;
                        }
                    });
                    e.IsValid = isValid;
                }
            }
            else {
                var isValid;
                $.ajax({
                    type: "POST",
                    url: "_administrar_productos.aspx/validarNombre",
                    data: "{'code': '" + document.getElementById(sender.controltovalidate).value + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    async: false,
                    success: function (msg) {
                        isValid = msg.d;
                    }
                });
                e.IsValid = isValid;
            }
        }

    </script>
        <div style="z-index:-2; background-color:rgba(100, 150, 255,0.5); border-radius:15px; box-shadow:-15px 25px 15px black; width:90%; height:72%; position:absolute; top:14%; left:5%;">
    </div>
        <asp:ImageButton ID="ImageButton3" runat="server" Height="40px" style="position:absolute; box-shadow:none; border:none; margin-left:85.5%; margin-top:1em;" Width="40px" ImageUrl="~/img/salir.png" OnClick="ImageButton3_Click" />
    <div class="t">SERVICIOS</div>    
    <div style="background-color:rgba(255,255,255,0.9);
            border:solid 1px black;
            box-shadow:inset 0 0 15px gray; width:39%; margin:0 auto; margin-left:10%; margin-top:0.5em;">
        <div style="margin-left:1em; margin-top:0.5em; padding-top:0em; padding-bottom:0em;">Nuevo Servicio:</div>
        <div>
            <asp:TextBox ID="TextBox1" placeholder="Nombre" runat="server" Width="30%" style="margin-left:1em;"></asp:TextBox>
            <%--<asp:RequiredFieldValidator ValidationGroup="crear" ID="RequiredFieldValidator2"  runat="server" ControlToValidate="TextBox1" ErrorMessage="Digite el nombre del producto" ForeColor="Red">*</asp:RequiredFieldValidator>--%>
        </div>
        
        <asp:Button ID="Button1" OnClientClick="agregar_servicio(event, this)" style="margin-top:0.3%; margin-left:0.7em; width:12%; height:4%;" class="boton" runat="server" Text="Agregar servicio" />
        <asp:ImageButton ID="ImageButton1" runat="server" Height="40px" style="position:absolute; border:none; margin-left:0%; margin-top:-7%; box-shadow:none;" Width="40px" ImageUrl="~/img/back.png" OnClick="ImageButton4_Click" />
        <div style="padding-bottom:3em; background-color:#A79787; width:60%; margin-top:-2.5em; margin-left:12.5em; margin-bottom:3em; height:18em; overflow-y:scroll; " id="sss">
            <div id="new_proceso" class ="new_proceso" style="margin-top:-1em;">
                <asp:ImageButton class="ddd" OnClientClick="eliminar_proceso(event, this)" ImageUrl="~/img/delete.png" runat="server" style="width:1em; height:1em; border:none; box-shadow:none;  margin-bottom: -2.3em; margin-left:19em;" />
                <div style="margin-left:1em; margin-top:0.5em; padding-top:0em; padding-bottom:0em;" id="ttt">Proceso 1</div>
                <div style="margin-left:5%; padding-bottom:0.5em;">
                    
                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                    <div style="width:50%;">
                        <div>
                            <div style="width:170%">
                                <asp:TextBox ID="TB_nombre" placeholder="Nombre" runat="server" Width="90%"></asp:TextBox>
                            </div>
                            <%--<asp:RequiredFieldValidator ValidationGroup="crear" ID="RequiredFieldValidator1"  runat="server" ControlToValidate="TB_nombre" ErrorMessage="Digite el nombre del producto" ForeColor="Red">*</asp:RequiredFieldValidator>
                            <asp:CustomValidator ValidationGroup="crear" ID="CustomValidator2"  runat="server" ControlToValidate="TB_nombre" ErrorMessage="Ya existe un producto con el mismo nombre" ForeColor="Red" ClientValidationFunction="validarNombre">*</asp:CustomValidator>--%>
                            <div style="overflow-y:scroll; height: 10em; padding:0.2em; background-color:#62B4F5; width:180%; margin-top:-0em;" >
                                <table style='background-color:white; border-collapse: collapse; width:98%;' id="products">
                                    <tr class="pro"></tr>
                                                                </table>
                            </div>
                            <asp:Button ID="Button3" OnClientClick="agregar_producto(event, this)" style="position:relative; margin-top:0.3%; margin-left:-0%; width:185%; height:4%;" class="boton" runat="server" Text="Agregar producto" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <asp:Button ID="Button4" OnClientClick="agregar_proceso(event, this)" style="margin-top:-3%; margin-left:21em; width:12%; height:4%;" class="boton" runat="server" Text="Agregar proceso" />
    </div>
        
    <div id="validation_dialog" style="display: none"></div>
        <br />
        <div style="background-color:rgba(255,255,255,0.9);
            border:solid 1px black; position:absolute;
            box-shadow:inset 0 0 15px gray; width:39%; margin:0 auto; margin-left:50%; margin-top:-10em;">
        <div style="margin-left:1em; margin-top:0.5em; padding-top:0em; display:inline-block;">Buscar Servicio:</div>
            <br />
            <br />
        <div style="margin-left:3%; padding-bottom:2em;">
            <span>
                <asp:DropDownList ID="DDL_opcion" runat="server">
                    <asp:ListItem>Nombre</asp:ListItem>
                    <asp:ListItem>Proveedor</asp:ListItem>
                    </asp:DropDownList>
                <asp:TextBox ID="TB_buscar" runat="server" ValidateEmptyString="true" ></asp:TextBox>
            </span>
             <span style="margin-left:-5em;"> 
                 <asp:Button ID="Button2" runat="server" class="boton" style="width:30%; height:23%; margin-top:-0.1em;" OnClick="B_Buscar_Click" Text="Buscar" CausesValidation="False"></asp:Button>
             </span>
        </div>
            </div>
        <%--<div style="background-color:rgba(255,255,255,0.9);
            border:solid 1px black;
            box-shadow:inset 0 0 15px gray; width:80%; margin:0 auto; margin-top:-1em; height:13.5em; overflow-y: scroll; overflow-x: hidden;">--%>
        <%--<asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>--%>
        <%--<asp:GridView emptydatatext="No existe ningún producto." ShowHeaderWhenEmpty="True" ID="GridView1" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" style="text-align: center; margin: 0 auto;" DataKeyNames="id" OnRowDeleting="GridView1_RowDeleting"  BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" Width="100%" OnPageIndexChanging="GridView1_PageIndexChanging" PageSize="5" OnRowDataBound="GridView1_RowDataBound">
            <AlternatingRowStyle BackColor="#E1EAEF" />
            <Columns>
                <asp:TemplateField>
                    <EditItemTemplate>
                        <table class="auto-style5">
                            <tr>
                                <td class="auto-style6" width="16.6%">
                                    <asp:TextBox ID="_TB_nombre" data='<%# Eval("nombre") %>' placeholder="Nombre" runat="server" Text='<%# Eval("nombre") %>' Width="90%" ValidationGroup="modificar" TextMode="MultiLine"></asp:TextBox>
                                    <asp:RequiredFieldValidator ValidationGroup="modificar" ID="_RequiredFieldValidator1"  runat="server" ControlToValidate="_TB_nombre" ErrorMessage="Digite el nombre del producto" ForeColor="Red">*</asp:RequiredFieldValidator>
                                    <asp:CustomValidator ValidationGroup="modificar" ID="_CustomValidator2"  runat="server" ControlToValidate="_TB_nombre" ErrorMessage="Ya existe un producto con el mismo nombre" ForeColor="Red" ClientValidationFunction="validarNombre">*</asp:CustomValidator>
                                </td>
                                <td class="auto-style6" width="16.6%">
                                    <asp:TextBox ValidationGroup="modificar" ID="_TB_cantidad" Text='<%# Eval("cantidad") %>' placeholder="Cantidad" runat="server" Width="90%" TextMode="MultiLine"></asp:TextBox>
                                    <cc1:FilteredTextBoxExtender id="_ftbe" runat="server" targetcontrolid="_TB_cantidad" filtertype="Numbers" validchars="0123456987" />
                                    <asp:RequiredFieldValidator ValidationGroup="modificar" ID="_RequiredFieldValidator2"  runat="server" ControlToValidate="_TB_cantidad" ErrorMessage="Digite la cantidad del producto" ForeColor="Red">*</asp:RequiredFieldValidator>
                                </td>
                                <td class="auto-style6" width="16.6%">
                                    <asp:TextBox ID="_TB_unidad" data='<%# Eval("unidad_medida") %>' placeholder="Unidad de medidad" runat="server" Text='<%# Eval("unidad_medida") %>' Width="90%" ValidationGroup="modificar" TextMode="MultiLine"></asp:TextBox>
                                    <asp:RequiredFieldValidator ValidationGroup="modificar" ID="RequiredFieldValidator5"  runat="server" ControlToValidate="_TB_unidad" ErrorMessage="Digite la unidad de medida" ForeColor="Red">*</asp:RequiredFieldValidator>
                                </td>
                                <td class="auto-style6" width="16.6%">
                                    <asp:TextBox ValidationGroup="modificar" ID="_TB_minimo" Text='<%# Eval("minimo") %>' placeholder="Cantidad minima" runat="server" Width="90%" TextMode="MultiLine"></asp:TextBox>
                                    <cc1:FilteredTextBoxExtender id="FilteredTextBoxExtender2" runat="server" targetcontrolid="_TB_minimo" filtertype="Numbers" validchars="0123456987" />
                                    <asp:RequiredFieldValidator ValidationGroup="modificar" ID="RequiredFieldValidator6"  runat="server" ControlToValidate="_TB_minimo" ErrorMessage="Digite la cantidad minima del producto" ForeColor="Red">*</asp:RequiredFieldValidator>
                                </td>
                                <td class="auto-style6" width="16.6%" style="padding-bottom:2em;">
                                    <input type="hidden" runat="server" id="ppp" name="ppp" value="" />        
                                    <asp:TextBox  id="TB_proveedores" runat="server" TextMode="MultiLine" Enabled="false"  Width="90%" Text='<%# Eval("proveedores") %>'></asp:TextBox>
                                    <asp:Button ID="createUser" OnClientClick="modal2(event, this)" style="margin-top:4%; margin-left:-11.7%; width:12%; height:4%;" class="boton" runat="server" Text="Editar proveedores" />
                                </td>
                                <td class="auto-style6" width="16.6%">
                                    <asp:LinkButton  ValidationGroup="modificar" style="margin-left:-60px; " ID="LinkButton3" runat="server" CommandName="Update" OnClick="LinkButton1_Click"><asp:Image ID="Image2" runat="server" Height="40px" ImageUrl="~/img/aceptar.png" Width="45px" /></asp:LinkButton>
                                    <asp:LinkButton style="margin-left:25px; margin-top:0px; position:absolute;" ID="LinkButton4" runat="server" OnClick="LinkButton2_Click" CommandName="Cancel"><asp:Image ID="Image3" runat="server" Height="40px" ImageUrl="~/img/cancelar.png" Width="40px" /></asp:LinkButton>
                                </td>
        
                            </tr>
                        </table>
                    </EditItemTemplate>
                    <HeaderTemplate>
                        <table class="header">
                            <tr>
                                <td class="auto-style6" width="16.6%">
                                    <asp:Label ID="Label14" runat="server" Text="Nombre"></asp:Label>
                                </td>
                                <td class="auto-style6" width="16.6%">
                                    <asp:Label ID="Label8" runat="server" Text="Cantidad"></asp:Label>
                                </td>
                                <td class="auto-style6" width="16.6%">
                                    <asp:Label ID="Label4" runat="server" Text="Unidad de Medida"></asp:Label>
                                </td>
                                <td class="auto-style6" width="16.6%">
                                    <asp:Label ID="Label5" runat="server" Text="Cantidad Minima"></asp:Label>
                                </td>
                                <td class="auto-style6" width="16.6%">
                                    <asp:Label ID="Label2" runat="server" Text="Proveedores"></asp:Label>
                                </td>
                                <td class="auto-style6" width="16.6%">
                                    <asp:Label ID="Label6" runat="server" Text="Acciones"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <table class="auto-style5">
                            <tr>
                                <td class="auto-style6" width="16.6%">
                                    <asp:Label ID="Label7" runat="server" Text='<%# Eval("nombre") %>'></asp:Label>
                                </td>
                                <td class="auto-style6" width="16.6%">
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("cantidad") %>'></asp:Label>
                                </td>
                                <td class="auto-style6" width="16.6%">
                                    <asp:Label ID="Label9" runat="server" Text='<%# Eval("unidad_medida") %>'></asp:Label>
                                </td>
                                <td class="auto-style6" width="16.6%">
                                    <asp:Label ID="Label10" runat="server" Text='<%# Eval("minimo") %>'></asp:Label>
                                </td>
                                <td class="auto-style6" width="16.6%">
                                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("proveedores") %>'></asp:Label>
                                </td>
                                <td class="auto-style6" width="16.6%">
                                    <div style="display:block;">
                                        <asp:ImageButton  style="margin-left:-6em; border:none; box-shadow:none;" ID="LinkButton3" runat="server" CommandName="Edit" OnClick="LinkButton1_Click" Height="3.5em" ImageUrl="~/img/edit.png" Width="3.5em"></asp:ImageButton>
                                    </div>
                                    <div style="display:block; margin-top:-27%; ">
                                        <asp:ImageButton Value='<%# Eval("id") %>' style="display:initial; margin-left:6em; border:none; box-shadow:none;" ID="LinkButton4" runat="server" OnClientClick="return showConfirm(event, this);" Height="2.5em" ImageUrl="~/img/delete.png" Width="2.5em"></asp:ImageButton>
                                    </div>
                               </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
                        </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="GridView1" EventName="RowCancelingEdit" />
                                <asp:AsyncPostBackTrigger ControlID="GridView1" EventName="RowEditing" />
                                <asp:AsyncPostBackTrigger ControlID="GridView1" EventName="RowUpdating" />
                                <asp:AsyncPostBackTrigger ControlID="GridView1" EventName="RowDeleting" />
                                <asp:AsyncPostBackTrigger ControlID="GridView1" EventName="RowDataBound" />
                                <asp:AsyncPostBackTrigger ControlID="GridView1" EventName="PageIndexChanging" />
                                <asp:AsyncPostBackTrigger ControlID="GridView1" EventName="RowCommand" />
                            </Triggers>
                        </asp:UpdatePanel>
        </div> --%>
        <div id="validation_dialog2" style="display: none">
            <asp:ValidationSummary ValidationGroup="modificar" ID="_ValidationSummary1" runat="server" />
            <asp:ValidationSummary ValidationGroup="crear" ID="ValidationSummary1" runat="server" />
        </div>
</asp:Content>


