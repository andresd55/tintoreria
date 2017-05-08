<%@ Page Title="" Language="C#" MasterPageFile="~/presentacion/MasterPage.master" AutoEventWireup="true" CodeFile="~/logica/_menu_administrador.aspx.cs" Inherits="presentacion_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
       @font-face{
			font-family: 'titulo';
			src: url('../fonts/Bagad-Bold-Tryout.ttf');
		}
        .t {
            margin: 0 auto;
            margin-top: 10%;
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

    .img{
        margin-top: 120px;
    }
    
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="z-index:-2; background-color:rgba(100, 150, 255,0.5); border-radius:15px; box-shadow:-15px 25px 15px black; width:90%; height:68%; position:absolute; top:14%; left:5%;">
    </div>
    <div class="t">ADMINISTRADOR</div>
    <div class="img">
        <asp:ImageButton ID="IB_cerrar_sesion" runat="server" Height="40px" style="box-shadow:none; border:none; position:absolute; margin-left:84.5%; margin-top:-13.5em;" Width="40px" ImageUrl="~/img/salir.png" OnClick="IB_cerrar_sesion_Click" />
        <asp:Button ID="IB_Procesos" runat="server" class="op titulo3" OnClick="IB_Procesos_Click" Text="SERVICIOS"></asp:Button>
        <asp:Button ID="IB_Orden_trabajo" runat="server" class="op titulo4" OnClick="IB_Orden_trabajo_Click" Text="ORDEN DE TRABAJO"></asp:Button>
        <asp:Button ID="IB_inventario" runat="server" class="op titulo5" OnClick="IB_inventario_Click" Text="INVENTARIO"></asp:Button>
        <asp:Button ID="IB_Proveedores" runat="server" class="op titulo6" OnClick="IB_Proveedores_Click" Text="PROVEEDORES"></asp:Button>
        <asp:Button ID="IB_usuarios" runat="server" class="op titulo7" OnClick="IB_usuarios_Click" Text="USUARIOS"></asp:Button>
    </div>

</asp:Content>


