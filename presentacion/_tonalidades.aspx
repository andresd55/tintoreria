<%@ Page Title="" Language="C#" MasterPageFile="~/presentacion/MasterPage.master" AutoEventWireup="true" CodeFile="~/logica/_tonalidades.aspx.cs" Inherits="presentacion_Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        table {
    border-collapse: collapse;
}
        table, th, td {
    border: 1px solid black;
}
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
        .op:hover{
            cursor:pointer;
        }
        .op{
            text-align:center;
            color: #000;
            text-shadow: 1px 1px 1px #2DBEE8;
            font-family: 'Times New Roman';

            width:13%;
            font-size:1em;
            height:7em;
            text-align:center;
            background-color:rgba(255,255,255,0.9);
            border:solid 1px black;
            box-shadow:inset 0 0 15px gray;
            border-radius:50%;
        }
        .titulo3 {
            margin: 0 auto;
            margin-top: -3%;
            margin-left: 8%;
            padding: -50px;
            padding-top:10px;
            padding-bottom:10px;
            
        }
        .titulo4 {
            margin: 0 auto;
            margin-top: -10%;
            margin-left: 4%;
            padding-top:10px;
            padding-bottom:10px;
        }
        .titulo5 {
            margin: 0 auto;
            margin-top: -10%;
            margin-left: 4%;
            padding-top:10px;
            padding-bottom:10px;
        }
        .titulo6 {
            margin: 0 auto;
            margin-top: -10%;
            margin-left: 4%;
            padding-top:10px;
            padding-bottom:10px;
        }
        .titulo7 {
            margin: 0 auto;
            margin-top: -10%;
            margin-left: 4%;
            padding-top:10px;
            padding-bottom:10px;
        }
        .header{
            width: 100%;
            background-color:#175480;
            color:white;
        }

    .img{
        margin-top: 120px;
    }
    
    </style>
    <script src="../js/jscolor.js"></script>
    <script type="text/javascript" src="../js/jssor.slider.min.js"></script>
    <script src="../js/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.23/jquery-ui.min.js" type="text/javascript"></script>
    <link href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/themes/Cupertino/jquery-ui.css"
        rel="stylesheet" type="text/css" />
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
        function showConfirm(event, e) {
            event.preventDefault();
            var $myDialog = $('<div></div>')
            .html('¿Esta seguro que desea eliminar esta tonalidad?')
            .dialog({
                autoOpen: false,
                title: 'Eliminar Tonalidad',
                modal: true,
                resizable: false,
                buttons: {
                    "Aceptar": function () {
                        $(this).dialog("close");
                        $.ajax({
                            type: "POST",
                            url: "_tonalidades.aspx/eliminarTonalidad",
                            data: "{'code': " + e.value + "}",
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            async: false,
                            success: function (msg) {
                                
                                $('<div>La tonalidad se ha eliminado correctamente</div>')
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
       
        function validar_nombre(sender, e) {
            var isValid;
            $.ajax({
                type: "POST",
                url: "_tonalidades.aspx/validarNombreTonalidad",
                data: "{'code': '" + document.getElementById('<%= TB_Nombre.ClientID %>').value + "'}",
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
    <div class="t">TONALIDADES</div>
    <div style="background-color:rgba(255,255,255,0.9);
            border:solid 1px black;
            box-shadow:inset 0 0 15px gray; width:39%; margin:0 auto; margin-left:10%; margin-top:0.5em;">
        <div style="margin-left:1em; margin-top:0.5em; padding-top:0em; display:inline-block;">Nueva Tonalidad:</div>
        <div style="margin-left:3%; padding-bottom:2em;">
            <span>Nombre:
                <asp:TextBox ID="TB_Nombre" runat="server" ValidateEmptyString="true" ></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TB_Nombre" ErrorMessage="Digite el nombre del color" ForeColor="Red">*</asp:RequiredFieldValidator>
                <asp:CustomValidator ValidateEmptyText="true" ID="CustomValidator2" runat="server" ControlToValidate="TB_Nombre" ErrorMessage="Ya existe una tonalidad con el mismo nombre" ForeColor="Red" ClientValidationFunction="validar_nombre">*</asp:CustomValidator>
            </span>
            <span style="margin-left:0em;">
                Color:
                <button id="styleInput" class="jscolor 
                    {valueElement:'ContentPlaceHolder1_valueInput', styleElement:'styleInput'}" style="cursor:pointer; position:absolute; border:1px solid black; width:5em; height:5em; border-radius:50%; margin-top:-1em;">
                </button>
                <input runat="server" id="valueInput" type="hidden" name="color" value=""/> 
             </span>
             <span style="margin-left:-0em;"> 
                 <asp:Button ID="B_Crear" runat="server" class="boton" style="width:20%;" OnClick="B_Crear_Click" Text="Crear"></asp:Button>
             </span>
        </div>
    </div>
    <div style="background-color:rgba(255,255,255,0.9);
            border:solid 1px black; position:absolute;
            box-shadow:inset 0 0 15px gray; width:39%; margin:0 auto; margin-left:50%; margin-top:-5.6em;">
        <div style="margin-left:1em; margin-top:0.5em; padding-top:0em; display:inline-block;">Buscar Tonalidad:</div>
        <div style="margin-left:3%; padding-bottom:2em;">
            <span>Nombre:
                <asp:TextBox ID="TB_buscar" runat="server" ValidateEmptyString="true" ></asp:TextBox>
            </span>
             <span style="margin-left:-5em;"> 
                 <asp:Button ID="Button1" runat="server" class="boton" style="width:20%;" OnClick="B_Buscar_Click" Text="Buscar" CausesValidation="False"></asp:Button>
             </span>
        </div>
    </div>
    <div id="validation_dialog" style="display: none">
        <asp:ValidationSummary ID="ValidationSummary3" runat="server" />
    </div>

    <div style="background-color:rgba(255,255,255,0.9);
            border:solid 1px black;
            box-shadow:inset 0 0 15px gray; width:80%; margin:0 auto; margin-top:0.5em; height:18.5em; overflow-y: scroll; overflow-x: hidden;">
            <asp:GridView emptydatatext="No hay tonalidades creadas." ShowHeaderWhenEmpty="True" ID="GridView1" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" style="text-align: center; margin: 0 auto;" DataKeyNames="id" OnRowDeleting="GridView1_RowDeleting"  BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" Width="100%" OnRowDataBound="GridView1_RowDataBound">
            <AlternatingRowStyle BackColor="#E1EAEF" />
            <Columns>
                <asp:TemplateField>
                    <HeaderTemplate>
                        <table class="header">
                            <tr>
                                <td style="width:65.6%">
                                    <asp:Label ID="Label13" runat="server" Text="Nombre Tonalidad"></asp:Label>
                                </td>
                                <td  style="width:28.2%">
                                    <asp:Label ID="Label3" runat="server" Text="Color"></asp:Label>
                                </td>
                                <td style="width:25%">
                                    <asp:Label ID="Label1" runat="server" Text="Eliminar"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <table >
                            <tr>
                                <td style="width:65.6%">
                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("nombre") %>'></asp:Label>
                                </td>
                                <td style="width:28.2%">
                                    <center>
                                        <p runat="server" id="p_color" style="width:80%; height:3em; background-color:red;" ></p>
                                    </center>
                                </td>
                                <td style="width:25%;">
                                    <asp:ImageButton Value='<%# Eval("id") %>' OnClientClick="return showConfirm(event, this);" style="margin-left:0px; box-shadow:none; border:none;" ID="ImageButton1" runat="server"  Height="5%" ImageUrl="~/img/delete.png" Width="70%"></asp:ImageButton>
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>


</asp:Content>

