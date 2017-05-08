<%@ Page Title="" Language="C#" MasterPageFile="~/presentacion/MasterPage.master" AutoEventWireup="true" CodeFile="~/logica/_administrar_productos.aspx.cs" Inherits="presentacion_Default" %>

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
    </style>
    <script>
        function modal(event, element) {
            event.preventDefault();
            var pr = $('#ContentPlaceHolder1_TB_proveedores').val();
            pr = pr.split(", ");
            $('#ContentPlaceHolder1_TB_proveedores').val("");
            $('#ContentPlaceHolder1_ppp').val("");
                var html = '';
                var proveedores = null;
                $.ajax({
                    type: "POST",
                    url: "_administrar_productos.aspx/obtenerProveedores",
                    data: "",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    async: false,
                    success: function (result) {
                        console.log((JSON.parse(result.d)).Table1);
                        proveedores = (JSON.parse(result.d)).Table1;
                    }
                });

                html += '<div id="checkboxes" style ="overflow-y: scroll; overflow-x: hidden; padding-top:0.1em">';
                for (var i = 1; i < proveedores.length; i++) {
                    //console.log("aca: ", $.inArray( proveedores[i - 1][1], pr));
                    html += '<div>' +
                    '<div style="background-color:#deedf7; margin-top:1px; ">';
                    if ($.inArray(proveedores[i - 1][1], pr) == -1) {
                        html += '<input style="cursor:pointer;" type="checkbox" name="checkbox-1" value="' + proveedores[i - 1][1] + '" id="checkbox-' + i + '">';
                    }
                    else {
                        html += '<input style="cursor:pointer;" checked="checked" type="checkbox" name="checkbox-1" value="' + proveedores[i - 1][1] + '" id="checkbox-' + i + '">';
                    }
                     html += '<label style="cursor:pointer; " for="checkbox-' + i + '">' + proveedores[i - 1][1] + '</label>' +
                    '</div>' +
                    '</div>';
                }
                html += '</div>';
                var $myDialog = $('<div id="dialogbox"></div>')
                .html(html)
                .dialog({
                    autoOpen: false,
                    title: 'Agregar proveedores',
                    modal: true,
                    resizable: false,
                    buttons: {
                        "Aceptar": function () {
                            $(this).dialog("close");
                            $('#ContentPlaceHolder1_TB_proveedores').val("");
                            $('#ContentPlaceHolder1_ppp').val("");

                            sList = "";
                            for (var i = 1; i < proveedores.length; i++) {
                                o = $("#checkbox-" + i);
                                //sList += "(" + $(this).val() + "-" + (this.checked ? "checked" : "not checked") + ")";
                                sList += (o.is(":checked") ? o.val() + ", " : "");
                            };
                            sList = sList.substring(0, sList.length - 2);
                            $('#ContentPlaceHolder1_TB_proveedores').val(sList);
                            $('#ContentPlaceHolder1_ppp').val(sList);
                            $('#dialogbox').remove();
                            return false;
                        },
                        "Cancelar": function () {
                            $(this).dialog("close");
                            $('#dialogbox').remove();
                            return false;
                        }
                    }
                });
                $myDialog.dialog('open');
        }
        function modal2(event, element) {
            event.preventDefault();
            var pr = $('textarea[id^="ContentPlaceHolder1_GridView1_TB_proveedores"]').val();
            pr = pr.split(", ");
            $('textarea[id^="ContentPlaceHolder1_GridView1_TB_proveedores"]').val("");
            $('input[id^="ContentPlaceHolder1_GridView1_ppp"]').val("");
            var html = '';
            var proveedores = null;
            $.ajax({
                type: "POST",
                url: "_administrar_productos.aspx/obtenerProveedores",
                data: "",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                async: false,
                success: function (result) {
                    console.log((JSON.parse(result.d)).Table1);
                    proveedores = (JSON.parse(result.d)).Table1;
                }
            });

            html += '<div id="checkboxes" style ="overflow-y: scroll; overflow-x: hidden; padding-top:0.1em">';
            for (var i = 1; i < proveedores.length; i++) {
                //console.log("aca: ", $.inArray( proveedores[i - 1][1], pr));
                html += '<div>' +
                '<div style="background-color:#deedf7; margin-top:1px; ">';
                if ($.inArray(proveedores[i - 1][1], pr) == -1) {
                    html += '<input style="cursor:pointer;" type="checkbox" name="checkbox-1" value="' + proveedores[i - 1][1] + '" id="checkbox-' + i + '">';
                }
                else {
                    html += '<input style="cursor:pointer;" checked="checked" type="checkbox" name="checkbox-1" value="' + proveedores[i - 1][1] + '" id="checkbox-' + i + '">';
                }
                html += '<label style="cursor:pointer; " for="checkbox-' + i + '">' + proveedores[i - 1][1] + '</label>' +
               '</div>' +
               '</div>';
            }
            html += '</div>';
            var $myDialog = $('<div id="dialogbox"></div>')
            .html(html)
            .dialog({
                autoOpen: false,
                title: 'Editar proveedores',
                modal: true,
                resizable: false,
                buttons: {
                    "Aceptar": function () {
                        $(this).dialog("close");
                        $('textarea[id^="ContentPlaceHolder1_GridView1_TB_proveedores"]').val("");
                        $('input[id^="ContentPlaceHolder1_GridView1_ppp"]').val("");

                        sList = "";
                        for (var i = 1; i < proveedores.length; i++) {
                            o = $("#checkbox-" + i);
                            //sList += "(" + $(this).val() + "-" + (this.checked ? "checked" : "not checked") + ")";
                            sList += (o.is(":checked") ? o.val() + ", " : "");
                        };
                        sList = sList.substring(0, sList.length - 2);
                        $('textarea[id^="ContentPlaceHolder1_GridView1_TB_proveedores"]').val(sList);
                        $('input[id^="ContentPlaceHolder1_GridView1_ppp"]').val(sList);
                        $('#dialogbox').remove();
                        return false;
                    },
                    "Cancelar": function () {
                        $(this).dialog("close");
                        $('#dialogbox').remove();
                        return false;
                    }
                }
            });
            $myDialog.dialog('open');
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
    <script type="text/javascript" src="../js/jssor.slider.min.js"></script>
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
        <asp:ImageButton ID="ImageButton3" runat="server" Height="40px" style="position:absolute; box-shadow:none; border:none; margin-left:83.5%; margin-top:1em;" Width="40px" ImageUrl="~/img/salir.png" OnClick="ImageButton3_Click" />
    <div class="t">PRODUCTOS</div>    
    <div style="background-color:rgba(255,255,255,0.9);
            border:solid 1px black;
            box-shadow:inset 0 0 15px gray; width:39%; margin:0 auto; margin-left:10%; margin-top:0.5em;">
        <div style="margin-left:1em; margin-top:0.5em; padding-top:0em; padding-bottom:0.5em;">Nuevo Producto:</div>
        <div style="margin-left:5%; padding-bottom:0.5em;">
                        <asp:ImageButton ID="ImageButton1" runat="server" Height="40px" style="position:absolute; border:none; margin-left:0%; margin-top:-6.5%; box-shadow:none;" Width="40px" ImageUrl="~/img/back.png" OnClick="ImageButton4_Click" />
                        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                            <div style="width:50%;">
                                <div>
                                    <asp:TextBox ID="TB_nombre" placeholder="Nombre" runat="server" Width="80%" ValidationGroup="crear"></asp:TextBox>
                                    <asp:RequiredFieldValidator ValidationGroup="crear" ID="RequiredFieldValidator1"  runat="server" ControlToValidate="TB_nombre" ErrorMessage="Digite el nombre del producto" ForeColor="Red">*</asp:RequiredFieldValidator>
                                    <asp:CustomValidator ValidationGroup="crear" ID="CustomValidator2"  runat="server" ControlToValidate="TB_nombre" ErrorMessage="Ya existe un producto con el mismo nombre" ForeColor="Red" ClientValidationFunction="validarNombre">*</asp:CustomValidator>
                                </div>
                                <div>
                                    <asp:TextBox ValidationGroup="crear" ID="TB_cantidad" placeholder="Cantidad" runat="server" Width="80%" TextMode="Number"></asp:TextBox>
                                    <cc1:FilteredTextBoxExtender id="ftbe" runat="server" targetcontrolid="TB_cantidad" filtertype="Numbers" validchars="0123456987" />
                                    <asp:RequiredFieldValidator ValidationGroup="crear" ID="RequiredFieldValidator2"  runat="server" ControlToValidate="TB_cantidad" ErrorMessage="Digite la cantidad del producto" ForeColor="Red">*</asp:RequiredFieldValidator>
                                </div>
                                <div>
                                    <asp:TextBox ID="TB_unidad" placeholder="Unidad de medida" runat="server" Width="80%" ValidationGroup="crear"></asp:TextBox>
                                    <asp:RequiredFieldValidator ValidationGroup="crear" ID="RequiredFieldValidator3"  runat="server" ControlToValidate="TB_unidad" ErrorMessage="Digite la unidad de medida" ForeColor="Red">*</asp:RequiredFieldValidator>
                                </div>
                                <div>
                                    <asp:TextBox ValidationGroup="crear" ID="TB_minimo" placeholder="Cantidad minima" runat="server" Width="80%" TextMode="Number"></asp:TextBox>
                                    <cc1:FilteredTextBoxExtender id="FilteredTextBoxExtender1" runat="server" targetcontrolid="TB_minimo" filtertype="Numbers" validchars="0123456987" />
                                    <asp:RequiredFieldValidator ValidationGroup="crear" ID="RequiredFieldValidator4"  runat="server" ControlToValidate="TB_minimo" ErrorMessage="Digite la cantidad minima del producto" ForeColor="Red">*</asp:RequiredFieldValidator>
                                </div>
                            <div style="margin-top:-42%; margin-left:97%; width:60%;">
                                Proveedores:
                                <input type="hidden" runat="server" id="ppp" name="ppp" value="" />        
                                <asp:TextBox  id="TB_proveedores" runat="server" TextMode="MultiLine" Enabled="false"  Width="150%"></asp:TextBox>
                                <asp:Button ID="createUser" OnClientClick="modal(event, this)" style="margin-top:0.3%; margin-left:2.5%; width:12%; height:4%;" class="boton" runat="server" Text="Agregar proveedores" />
                                <asp:Button ValidationGroup="crear" class="boton"  style="margin-left:-50%; margin-top:3.0em; position:relative; width: 100%; height:40%; " ImageUrl="~/img/aceptar.png" ID="Button1" runat="server" Text="guardar" OnClick="Button1_Click"></asp:Button>
                            </div>
                    </div>
               </div>
        </div>
        <div id="validation_dialog" style="display: none">
                                                    
                            </div>
        <br />
        <div style="background-color:rgba(255,255,255,0.9);
            border:solid 1px black; position:absolute;
            box-shadow:inset 0 0 15px gray; width:39%; margin:0 auto; margin-left:50%; margin-top:-10em;">
        <div style="margin-left:1em; margin-top:0.5em; padding-top:0em; display:inline-block;">Buscar Producto:</div>
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
        <div style="background-color:rgba(255,255,255,0.9);
            border:solid 1px black;
            box-shadow:inset 0 0 15px gray; width:80%; margin:0 auto; margin-top:-1em; height:13.5em; overflow-y: scroll; overflow-x: hidden;">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
        <asp:GridView emptydatatext="No existe ningún producto." ShowHeaderWhenEmpty="True" ID="GridView1" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" style="text-align: center; margin: 0 auto;" DataKeyNames="id" OnRowDeleting="GridView1_RowDeleting"  BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" Width="100%" OnPageIndexChanging="GridView1_PageIndexChanging" PageSize="5" OnRowDataBound="GridView1_RowDataBound">
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
        </div> 
        <div id="validation_dialog2" style="display: none">
            <asp:ValidationSummary ValidationGroup="modificar" ID="_ValidationSummary1" runat="server" />
            <asp:ValidationSummary ValidationGroup="crear" ID="ValidationSummary1" runat="server" />
        </div>
</asp:Content>


