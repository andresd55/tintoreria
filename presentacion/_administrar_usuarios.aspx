<%@ Page Title="" Language="C#" MasterPageFile="~/presentacion/MasterPage.master" AutoEventWireup="true" CodeFile="~/logica/_administrar_usuarios.aspx.cs" Inherits="presentacion_Default" %>

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
        var grid = document.getElementById("<%=GridView1.ClientID%>");
        var inputs = grid.getElementsByTagName("Label7");
        
        function showConfirm(event, e) {
            event.preventDefault();
            var $myDialog = $('<div></div>')
            .html('¿Esta seguro que desea eliminar este Usuario?')
            .dialog({
                autoOpen: false,
                title: 'Eliminar Usuario',
                modal: true,
                resizable: false,
                buttons: {
                    "Aceptar": function () {
                        $(this).dialog("close");
                        $.ajax({
                            type: "POST",
                            url: "_administrar_usuarios.aspx/eliminarUsuario",
                            data: "{'code': " + e.value + "}",
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            async: false,
                            success: function (msg) {

                                $('<div>El usuario se ha eliminado correctamente</div>')
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
    </script>
        <div style="z-index:-2; background-color:rgba(100, 150, 255,0.5); border-radius:15px; box-shadow:-15px 25px 15px black; width:90%; height:72%; position:absolute; top:14%; left:5%;">
    </div>
        <asp:ImageButton ID="ImageButton3" runat="server" Height="40px" style="position:absolute; box-shadow:none; border:none; margin-left:84.5%; margin-top:1em;" Width="40px" ImageUrl="~/img/salir.png" OnClick="ImageButton3_Click" />
    <div class="t">USUARIOS</div>    
    <div style="background-color:rgba(255,255,255,0.9);
            border:solid 1px black;
            box-shadow:inset 0 0 15px gray; width:39%; margin:0 auto; margin-left:10%; margin-top:0.5em;">
                                <div style="margin-left:1em; margin-top:0.5em; padding-top:0em; padding-bottom:0.5em;">Nuevo Usuario:</div>
                                <div style="margin-left:5%; padding-bottom:1.5em;">
                                                <asp:ImageButton ID="ImageButton1" runat="server" Height="40px" style="position:absolute; border:none; margin-left:0%; margin-top:-6.5%; box-shadow:none;" Width="40px" ImageUrl="~/img/back.png" OnClick="ImageButton4_Click" />
                                                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                                                <asp:UpdatePanel ID="upSetDepartamento" runat="server">
                                                <ContentTemplate>
                                                    <div style="width:50%;">
                                <div style="margin-top:1.5%;">
                                    <asp:TextBox ID="TextBox1" ValidationGroup="c" runat="server" placeholder="Cedula" width="70%"  TextMode="Number"></asp:TextBox>
                                    <asp:RequiredFieldValidator ValidationGroup="c" ID="RequiredFieldValidator2"  runat="server" ControlToValidate="TextBox1" ErrorMessage="Digite el número de cedula del usuario" ForeColor="Red">*</asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ValidationGroup="c" ID="RegularExpressionValidator1"  runat="server" ControlToValidate="TextBox1" ErrorMessage="El número de cedula no es valido" ForeColor="Red" ValidationExpression="[\S\s]{8,11}">*</asp:RegularExpressionValidator>
                                    <asp:CustomValidator ValidationGroup="c" ID="CustomValidator2"  runat="server" ControlToValidate="TextBox1" ErrorMessage="Ya existe un usuario con el mismo número de cedula" ForeColor="Red" ClientValidationFunction="validar_cedula">*</asp:CustomValidator>
                                </div>
        
                                <div  style="margin-top:1.5%;">
                                    <asp:TextBox ValidationGroup="c" ID="TextBox2" runat="server" placeholder="Nombre" width="70%" ></asp:TextBox>
                                    <asp:RequiredFieldValidator ValidationGroup="c" ID="RequiredFieldValidator1"  runat="server" ControlToValidate="TextBox2" ErrorMessage="Digite el nombre del usuario" ForeColor="Red" >*</asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ValidationGroup="c" ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="El nombre debe tener minimo 3 caracteres" ForeColor="Red"  ValidationExpression="[\S\s]{3,50}">*</asp:RegularExpressionValidator>
                                </div>
                                <div style="margin-top:1.5%;">
                                    <asp:TextBox ValidationGroup="c" ID="TextBox3" runat="server"  placeholder="Apellido" width="70%"></asp:TextBox>
                                    <asp:RequiredFieldValidator ValidationGroup="c" ID="RequiredFieldValidator3"  runat="server" ControlToValidate="TextBox3" ErrorMessage="Digite el apellido del usuario" ForeColor="Red">*</asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ValidationGroup="c" ID="RegularExpressionValidator6"  runat="server" ControlToValidate="TextBox3" ErrorMessage="El apellido debe tener minimo 3 caracteres" ForeColor="Red" ValidationExpression="[\S\s]{3,50}">*</asp:RegularExpressionValidator>
                                </div>
                                <div style="margin-top:1.5%;">
                                    <asp:TextBox ValidationGroup="c" ID="TB_telefono" runat="server" placeholder="Teléfono" width="70%" ></asp:TextBox>
                                    <asp:RequiredFieldValidator ValidationGroup="c" ID="RequiredFieldValidator8"  runat="server" ControlToValidate="TB_telefono" ErrorMessage="Digite el telefono del usuario" ForeColor="Red" >*</asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ValidationGroup="c" ID="RegularExpressionValidator3" runat="server" ControlToValidate="TB_telefono" ErrorMessage="El telefono debe tener minimo 7 caracteres" ForeColor="Red"  ValidationExpression="[\S\s]{7,50}">*</asp:RegularExpressionValidator>
                                </div>
                                <div style="margin-top:-7em; margin-left:15em; width:100%;">
                                    <div style="margin-top:1.5%;">
                                        <asp:TextBox ValidationGroup="c" ID="TB_direccion" runat="server"  placeholder="Dirección" width="70%"></asp:TextBox>
                                        <asp:RequiredFieldValidator ValidationGroup="c" ID="RequiredFieldValidator9"  runat="server" ControlToValidate="TB_direccion" ErrorMessage="Digite la dirección del usuario" ForeColor="Red">*</asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ValidationGroup="c" ID="RegularExpressionValidator4"  runat="server" ControlToValidate="TB_direccion" ErrorMessage="la dirección debe tener minimo 3 caracteres" ForeColor="Red" ValidationExpression="[\S\s]{3,50}">*</asp:RegularExpressionValidator>
                                    </div>
                                    <div style="margin-top:1.5%;">
                                        <asp:TextBox ValidationGroup="c" ID="TextBox4" runat="server"  placeholder="correo" width="70%"></asp:TextBox>
                                        <asp:RequiredFieldValidator ValidationGroup="c" ID="RequiredFieldValidator4"  runat="server" ControlToValidate="TextBox4" ErrorMessage="Digite el correo del usuario" ForeColor="Red">*</asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ValidationGroup="c"  ID="RegularExpressionValidator10"  runat="server" ControlToValidate="TextBox4" ErrorMessage="Digite un correo valido" ForeColor="Red" ValidationExpression="^[_a-z0-9-]+(.[_a-z0-9-]+)*@[a-z0-9-]+(.[a-z0-9-]+)*(.[a-z]{2,4})$">*</asp:RegularExpressionValidator>
                                        <asp:CustomValidator ValidationGroup="c" ID="CustomValidator1"  runat="server" ControlToValidate="TextBox4" ErrorMessage="El correo que digito ya existe" ForeColor="Red" ClientValidationFunction="validarCorreo">*</asp:CustomValidator>
                                    </div>
                                    <div style="margin-top:1.5%;">
                                        <asp:TextBox ValidationGroup="c" ID="TextBox5" runat="server"  placeholder="Contraseña" width="70%" TextMode="Password"></asp:TextBox>
                                        <asp:RequiredFieldValidator ValidationGroup="c" ID="RequiredFieldValidator5"  runat="server" ControlToValidate="TextBox5" ErrorMessage="Digite la contraseña del usuario" ForeColor="Red">*</asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ValidationGroup="c" ID="RegularExpressionValidator11"  runat="server" ControlToValidate="TextBox5" ErrorMessage="La contraseña debe tener minimo 6 caracteres y al menos un numero y una letra" ForeColor="Red" ValidationExpression="(?=^.{6,}$)((?=.*\d))(?=.*[A-Za-z]).*">*</asp:RegularExpressionValidator>
                                    </div>
                                    <div>
                                        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" Width="76%" DataSourceID="ObjectDataSource1" DataTextField="rol" DataValueField="id">
                                        </asp:DropDownList>
                                        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="obtenerRoles" TypeName="DaParametrizacion"></asp:ObjectDataSource>
                                    </div>
                                    <div >
                                        <asp:Button  ValidationGroup="c" ID="Button1" runat="server" class="boton" style="margin-left:-0.5%; margin-bottom:0.5em; position:relative; width:76%; height:2%;" OnClick="Button1_Click" Text="guardar" ></asp:Button>
                                        <%--<asp:Button  style="width:3em; height:3em; border:none; box-shadow:none; " ID="Button1" runat="server" Text="guardar" OnClick="Button1_Click"/>--%></asp:Button>
                                    </div>
                                </div>
                            </div>
                            
                            </ContentTemplate>
                            <Triggers>
                            </Triggers>
                        </asp:UpdatePanel>
                    </div>
               </div>
        <div id="validation_dialog" style="display: none">
                                                    
                            </div>
        <br />
        <div style="background-color:rgba(255,255,255,0.9);
            border:solid 1px black; position:absolute;
            box-shadow:inset 0 0 15px gray; width:39%; margin:0 auto; margin-left:50%; margin-top:-10em;">
        <div style="margin-left:1em; margin-top:0.5em; padding-top:0em; display:inline-block;">Buscar Usuario:</div>
            <br />
            <br />
        <div style="margin-left:3%; padding-bottom:2em;">
            <span>
                <asp:DropDownList ID="DDL_opcion" runat="server">
                    <asp:ListItem>Nombre</asp:ListItem>
                    <asp:ListItem>Apellido</asp:ListItem>
                    <asp:ListItem>Cedula</asp:ListItem>
                    <asp:ListItem>Correo</asp:ListItem>
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
            box-shadow:inset 0 0 15px gray; width:80%; margin:0 auto; margin-top:-1em; height:12.5em; overflow-y: scroll; overflow-x: hidden;">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
        <asp:GridView emptydatatext="No existe ningún proveedor." ShowHeaderWhenEmpty="True" ID="GridView1" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" style="text-align: center; margin: 0 auto;" DataKeyNames="id" OnRowDeleting="GridView1_RowDeleting" AllowPaging="False"  BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" Width="100%" OnPageIndexChanging="GridView1_PageIndexChanging" OnRowDataBound="GridView1_RowDataBound" PageSize="100000">
            <AlternatingRowStyle BackColor="#E1EAEF" />
            <Columns>
                <asp:TemplateField>
                    <EditItemTemplate>
                        <table class="auto-style5">
                            <tr>
                                <td class="auto-style6" width="10%">
                                    <asp:TextBox ValidationGroup="d" ID="_TB_documento" data='<%# Eval("documento") %>' placeholder="Cedula" runat="server" Text='<%# Eval("documento") %>' Width="90%" TextMode="MultiLine"></asp:TextBox>
                                    <asp:RequiredFieldValidator ValidationGroup="d" ID="RequiredFieldValidator2"  runat="server" ControlToValidate="_TB_documento" ErrorMessage="Digite el número de cedula del usuario" ForeColor="Red">*</asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ValidationGroup="d" ID="RegularExpressionValidator1"  runat="server" ControlToValidate="_TB_documento" ErrorMessage="El número de cedula no es valido" ForeColor="Red" ValidationExpression="[\S\s]{8,11}">*</asp:RegularExpressionValidator>
                                    <asp:CustomValidator ValidationGroup="d" ID="CustomValidator2"  runat="server" ControlToValidate="_TB_documento" ErrorMessage="Ya existe un usuario con el mismo número de cedula" ForeColor="Red" ClientValidationFunction="validar_cedula">*</asp:CustomValidator>
                                </td>
                                <td class="auto-style6" width="10%">
                                    <asp:TextBox ValidationGroup="d" ID="_TB_nombre" data='<%# Eval("nombre") %>' placeholder="Nombre" runat="server" Text='<%# Eval("nombre") %>' Width="90%" TextMode="MultiLine"></asp:TextBox>
                                    <asp:RequiredFieldValidator ValidationGroup="d" ID="RequiredFieldValidator1"  runat="server" ControlToValidate="_TB_nombre" ErrorMessage="Digite el nombre del usuario" ForeColor="Red" >*</asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ValidationGroup="d" ID="RegularExpressionValidator2" runat="server" ControlToValidate="_TB_nombre" ErrorMessage="El nombre debe tener minimo 3 caracteres" ForeColor="Red"  ValidationExpression="[\S\s]{3,50}">*</asp:RegularExpressionValidator>
                                </td>
                                <td class="auto-style6" width="10%">
                                    <asp:TextBox  ValidationGroup="d" ID="_TB_apellido" data='<%# Eval("apellido") %>' placeholder="Apellido" runat="server" Text='<%# Eval("apellido") %>' Width="90%" TextMode="MultiLine"></asp:TextBox>
                                    <asp:RequiredFieldValidator ValidationGroup="d" ID="RequiredFieldValidator3"  runat="server" ControlToValidate="_TB_apellido" ErrorMessage="Digite el apellido del usuario" ForeColor="Red">*</asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ValidationGroup="d" ID="RegularExpressionValidator6"  runat="server" ControlToValidate="_TB_apellido" ErrorMessage="El apellido debe tener minimo 3 caracteres" ForeColor="Red" ValidationExpression="[\S\s]{3,50}">*</asp:RegularExpressionValidator>
                                </td>
                                <td class="auto-style6" width="10%">
                                    <asp:TextBox ValidationGroup="d" ID="_TB_telefono" Text='<%# Eval("telefono") %>' placeholder="Teléfono" runat="server" Width="90%" TextMode="MultiLine"></asp:TextBox>
                                    <asp:RequiredFieldValidator ValidationGroup="d" ID="RequiredFieldValidator8"  runat="server" ControlToValidate="_TB_telefono" ErrorMessage="Digite el telefono del usuario" ForeColor="Red" >*</asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ValidationGroup="d" ID="RegularExpressionValidator3" runat="server" ControlToValidate="_TB_telefono" ErrorMessage="El telefono debe tener minimo 7 caracteres" ForeColor="Red"  ValidationExpression="[\S\s]{7,50}">*</asp:RegularExpressionValidator>
                                </td>
                                <td class="auto-style6" width="10%">
                                    <asp:TextBox ValidationGroup="d" ID="_TB_direccion" placeholder="Dirección" runat="server" Text='<%# Eval("direccion") %>' Width="90%" TextMode="MultiLine"></asp:TextBox>
                                    <asp:RequiredFieldValidator ValidationGroup="d" ID="RequiredFieldValidator9"  runat="server" ControlToValidate="_TB_direccion" ErrorMessage="Digite la dirección del usuario" ForeColor="Red">*</asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ValidationGroup="d" ID="RegularExpressionValidator4"  runat="server" ControlToValidate="_TB_direccion" ErrorMessage="la dirección debe tener minimo 3 caracteres" ForeColor="Red" ValidationExpression="[\S\s]{3,50}">*</asp:RegularExpressionValidator>
                                </td>
                                <td class="auto-style6" width="10%">
                                    <asp:TextBox ValidationGroup="d" data='<%# Eval("correo") %>' ID="_TB_correo" placeholder="Correo" runat="server" Text='<%# Eval("correo") %>' Width="90%" TextMode="Email"></asp:TextBox>
                                    <asp:RequiredFieldValidator ValidationGroup="d" ID="RequiredFieldValidator4"  runat="server" ControlToValidate="_TB_correo" ErrorMessage="Digite el correo del usuario" ForeColor="Red">*</asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ValidationGroup="d"  ID="RegularExpressionValidator10"  runat="server" ControlToValidate="_TB_correo" ErrorMessage="Digite un correo valido" ForeColor="Red" ValidationExpression="^[_a-z0-9-]+(.[_a-z0-9-]+)*@[a-z0-9-]+(.[a-z0-9-]+)*(.[a-z]{2,4})$">*</asp:RegularExpressionValidator>
                                    <asp:CustomValidator ValidationGroup="d" ID="CustomValidator1"  runat="server" ControlToValidate="_TB_correo" ErrorMessage="El correo que digito ya existe" ForeColor="Red" ClientValidationFunction="validarCorreo">*</asp:CustomValidator>
                                </td>
                                <td class="auto-style6" width="10%">
                                    <asp:TextBox ValidationGroup="d" ID="_TB_password" placeholder="Contraseña" runat="server" Text='<%# Eval("password") %>' Width="90%" TextMode="MultiLine"></asp:TextBox>
                                    <asp:RequiredFieldValidator ValidationGroup="d" ID="RequiredFieldValidator5"  runat="server" ControlToValidate="_TB_password" ErrorMessage="Digite la contraseña del usuario" ForeColor="Red">*</asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ValidationGroup="d" ID="RegularExpressionValidator11"  runat="server" ControlToValidate="_TB_password" ErrorMessage="La contraseña debe tener minimo 6 caracteres y al menos un numero y una letra" ForeColor="Red" ValidationExpression="(?=^.{6,}$)((?=.*\d))(?=.*[A-Za-z]).*">*</asp:RegularExpressionValidator>
                                </td>
                                <td class="auto-style6" width="10%">
                                    <asp:DropDownList ID="_DropDownList1" runat="server" AutoPostBack="True" Width="76%" DataSourceID="ObjectDataSource1" DataTextField="rol" DataValueField="id">
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="obtenerRoles" TypeName="DaParametrizacion"></asp:ObjectDataSource>
                                </td>
                                <td class="auto-style6" width="10%">
                                    <asp:LinkButton  ValidationGroup="d" style="margin-left:-60px; " ID="LinkButton3" runat="server" CommandName="Update" OnClick="LinkButton1_Click"><asp:Image ID="Image2" runat="server" Height="40px" ImageUrl="~/img/aceptar.png" Width="45px" /></asp:LinkButton>
                                    <asp:LinkButton style="margin-left:25px; margin-top:0px; position:absolute;" ID="LinkButton4" runat="server" OnClick="LinkButton2_Click" CommandName="Cancel"><asp:Image ID="Image3" runat="server" Height="40px" ImageUrl="~/img/cancelar.png" Width="40px" /></asp:LinkButton>
                                </td>
        
                            </tr>
                        </table>
                    </EditItemTemplate>
                    <HeaderTemplate>
                        <table class="header">
                            <tr>
                                <td class="auto-style6" width="10%">
                                    <asp:Label ID="Label13" runat="server" Text="Documento"></asp:Label>
                                </td>
                                <td class="auto-style6" width="10%">
                                    <asp:Label ID="Label14" runat="server" Text="Nombre"></asp:Label>
                                </td>
                                <td class="auto-style6" width="10%">
                                    <asp:Label ID="Label15" runat="server" Text="Apellido"></asp:Label>
                                </td>
                                <td class="auto-style6" width="10%">
                                    <asp:Label ID="Label8" runat="server" Text="Teléfono"></asp:Label>
                                </td>
                                <td class="auto-style6" width="10%">
                                    <asp:Label ID="Label9" runat="server" Text="Dirección"></asp:Label>
                                </td>
                                <td class="auto-style6" width="10%">
                                    <asp:Label ID="Label11" runat="server" Text="Correo"></asp:Label>
                                </td>
                                <td class="auto-style6" width="10%">
                                    <asp:Label ID="Label10" runat="server" Text="Contraseña"></asp:Label>
                                </td>
                                <%--<td class="auto-style6" width="10%">
                                    <asp:Label ID="Label12" runat="server" Text="Estado"></asp:Label>
                                </td>--%>
                                <td class="auto-style6" width="10%">
                                    <asp:Label ID="Label19" runat="server" Text="Rol"></asp:Label>
                                </td>
                                <td class="auto-style6" width="10%">
                                    <asp:Label ID="Label6" runat="server" Text="Acciones"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <table>
                            <tr>
                                <td class="auto-style6" width="10%">
                                    <asp:Label ID="Label16" runat="server" Text='<%# Eval("documento") %>'></asp:Label>
                                </td>
                                <td class="auto-style6" width="10%">
                                    <asp:Label ID="Label7" runat="server" Text='<%# Eval("nombre") %>'></asp:Label>
                                </td>
                                <td class="auto-style6" width="10%">
                                    <asp:Label ID="Label17" runat="server" Text='<%# Eval("apellido") %>'></asp:Label>
                                </td>
                                <td class="auto-style6" width="10%">
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("telefono") %>'></asp:Label>
                                </td>
                                <td class="auto-style6" width="10%">
                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("direccion") %>'></asp:Label>
                                </td>
                                <td class="auto-style6" width="10%">
                                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("correo") %>'></asp:Label>
                                </td>
                                <td class="auto-style6" width="10%">
                                    <asp:Label ID="Label5" runat="server" Text='<%# Eval("password") %>'></asp:Label>
                                </td>
                                <%--<td class="auto-style6" width="10%">
                                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("estado") %>'></asp:Label>
                                </td>--%>
                                <td class="auto-style6" width="10%">
                                    <asp:Label ID="Label18" runat="server" Text='<%# Eval("rol") %>'></asp:Label>
                                </td>
                                <td class="auto-style6" width="10%">
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
                                <asp:AsyncPostBackTrigger ControlID="GridView1" EventName="SelectedIndexChanged" />
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
            <asp:ValidationSummary ValidationGroup="d" ID="_ValidationSummary1" runat="server" />
            <asp:ValidationSummary  ValidationGroup="c" ID="ValidationSummary1" runat="server" />
        </div>
</asp:Content>


