<%@ Page Title="" Language="C#" MasterPageFile="~/presentacion/MasterPage.master" AutoEventWireup="true" CodeFile="~/logica/buscar_empresa.aspx.cs" Inherits="presentacion_Default" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script src="../js/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.23/jquery-ui.min.js" type="text/javascript"></script>
    <link href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/themes/Cupertino/jquery-ui.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
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
            background-color:rgb(151,160,61);
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
            width:10%;
            text-align: center;
             background-image: linear-gradient(to top,#97A03D,#DFE1A2);
            margin-left:38%;
            margin-top:260px;
            color: white;
            position:absolute;
        }
        .boton:hover{
            /*background-image: linear-gradient(to bottom,rgba(0,180,180,1),rgba(0,250,250,1));*/
            background-color:  rgb(107,122,255);
            cursor:pointer;
        }
        .boton2{
            height: 23px; 
            width:70%;
            text-align: center;
            background-image: linear-gradient(to top,rgb(107,122,255),rgb(0,0,255));
            margin-left:15%;
            margin-top:50px;
            color: white;
            position:absolute;
        }
        .boton2:hover{
            background-image: linear-gradient(to bottom,transparent,transparent);
            /*background-image: linear-gradient(to bottom,rgba(0,180,180,1),rgba(0,250,250,1));*/
            background-color:  rgb(107,122,255);
            cursor:pointer;
        }
        .des{
            margin-left:8%;
            display:inline-block;
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
            margin-top: 1%;
            border-radius:5px;
            width:90%;
        }
        #ContentPlaceHolder1_abc {
				width:100%;
				height:100%;
				/*opacity:.95;*/
				top:0;
				left:0;
				/*display:none;*/
				position:fixed;
				background: rgba(0, 0, 0, 0.9);
				overflow:auto
			}
			img#close {
			position:absolute;
			right:-14px;
			top:-14px;
			cursor:pointer
			}
			div#popupContact {

			position:absolute;
			left:50%;
			top:17%;
			margin-left:-20em;
			}
			.form {
			width:40em;
			height: 20em;
			padding:10px 50px;
			border:2px solid gray;
			border-radius:10px;
			background: rgba(255, 255, 255, 0.99);
			}
    </style>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="background-color:rgba(206, 209, 145,0.9); border-radius:15px; box-shadow:-15px 25px 15px black; width:95%; height:145%; position:absolute; margin-top:-15PX; margin-left:30PX; z-index:-3;">
    </div>
        <div class="titulo">Administrar Incidentes</div>
                    <fieldset class="datos">
                        <asp:ImageButton ID="ImageButton9" runat="server" Height="40px" style="position:absolute; border:none; margin-left:9px; margin-top:10px;" Width="40px" ImageUrl="~/img/back.png" OnClick="ImageButton9_Click" />
                        <center>
                        <div class="in">BUSCAR EMPRESA</div>
                        </center>

        <br />
        <div class="grid"> 
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="fila">
            <br />
            <br />
                <span class="etiqueta">
                    <asp:Label ID="L_Busqueda" runat="server" Style="text-align: center; margin-left:50px; " Text="Busqueda:"></asp:Label>
                </span>
                <span >
                    <asp:DropDownList ID="DDL_opcion" runat="server">
                    <asp:ListItem>Nombre</asp:ListItem>
                    <asp:ListItem>Ciudad</asp:ListItem>
                    <asp:ListItem>Producto</asp:ListItem>
                    </asp:DropDownList>
                    <asp:TextBox ID="TB_busqueda" runat="server" MaxLength="50" Height="16px" Width="150px"></asp:TextBox>

                    <br />
                <br />
                    
                </span>
                
            
                <asp:Button ID="B_Aceptar" Class="boton" runat="server" Text="Buscar" OnClick="B_Aceptar_Click" Style="height: 26px; top: 0px; left: -1px;" />
            </div>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" style="text-align: center; margin: 0 auto;" DataKeyNames="id_empresa" OnRowDeleting="GridView1_RowDeleting" AllowPaging="True"  BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" Width="100%" OnPageIndexChanging="GridView1_PageIndexChanging" PageSize="5" OnRowDataBound="GridView1_RowDataBound" OnRowCommand="GridView1_RowCommand">
            <AlternatingRowStyle BackColor="#E1EAEF" />
            <Columns>
                <asp:TemplateField>
                    <HeaderTemplate>
                        <table class="header">
                            <tr>
                                <td class="h_des" width="10%">
                                    <asp:Label ID="Label13" runat="server" Text="LogoTipo"></asp:Label>
                                </td>
                                <td class="auto-style6" width="11%">
                                    <asp:Label ID="Label14" runat="server" Text="Nombre"></asp:Label>
                                </td>
                                <td class="auto-style6" width="11%">
                                    <asp:Label ID="Label8" runat="server" Text="Teléfono"></asp:Label>
                                </td>
                                <td class="auto-style6" width="11%">
                                    <asp:Label ID="Label9" runat="server" Text="Dirección"></asp:Label>
                                </td>
                                <td class="auto-style6" width="11%">
                                    <asp:Label ID="Label10" runat="server" Text="Ciudad"></asp:Label>
                                </td>
                                <td class="auto-style6" width="13%">
                                    <asp:Label ID="Label11" runat="server" Text="Correo"></asp:Label>
                                </td>
                                <td class="auto-style6" width="13%">
                                    <asp:Label ID="Label12" runat="server" Text="Productos ofrecidos"></asp:Label>
                                </td>
                                <td class="auto-style6" width="10%">
                                    <asp:Label ID="Label19" runat="server" Text="Ver Detalle"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <table class="auto-style5">
                            <tr>
                                <td class="h_des" width="9%">
                                    <asp:Image ID="Image1" runat="server" Height="100px" ImageUrl='<%#Eval("[logo]") %>' Width="100px" style="border-radius:50%;"/>
                                </td>
                                <td class="auto-style6" width="11%">
                                    <asp:Label ID="Label7" runat="server" Text='<%# Eval("nombre") %>'></asp:Label>
                                </td>
                                <td class="auto-style6" width="11%">
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("telefono") %>'></asp:Label>
                                </td>
                                <td class="auto-style6" width="11%">
                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("direccion") %>'></asp:Label>
                                </td>
                                <td class="auto-style6" width="11%">
                                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("ciudad") %>'></asp:Label>
                                </td>
                                <td class="auto-style6" width="13%">
                                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("correo") %>'></asp:Label>
                                </td>
                                <td class="auto-style6" width="13%">
                                    <asp:Label ID="Label5" runat="server" Text='<%# Eval("productos_ofrecidos") %>'></asp:Label>
                                </td>
                                <td class="auto-style6" width="10%">
                                    <asp:LinkButton  style="margin-left:0px; "  CommandArgument='<%# Eval("id_empresa") %>' ID="LinkButton3" runat="server"  OnClick="LinkButton3_Click"><asp:Image ID="Image2" runat="server" Height="40px" ImageUrl="~/img/ver_detalle.png" Width="40px" /></asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
            
                <div id="abc" style="display:none;" runat="server">
		            <div id="popupContact">
                        <div id="carga" style="display:none;" runat='server'>
                            <div id="form" class="form" runat="server">
                                
                            </div>
	                    </div>	
                    </div>	
		        </div>
            
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
       <script>
           window.onload = function(){
               div_hide();
           }
           var grid = document.getElementById("<%=GridView1.ClientID%>");
           var inputs = grid.getElementsByTagName("Label7");
           console.log(inputs.value);
           function div_show() {
               document.getElementById('ContentPlaceHolder1_carga').style.display = "block";
               document.getElementById('ContentPlaceHolder1_abc').style.display = "block";
           }
           //Function to Hide Popup
           function div_hide() {
               document.getElementById('ContentPlaceHolder1_carga').style.display = "none";
               document.getElementById('ContentPlaceHolder1_abc').style.display = "none";
           }
    </script>
</asp:Content>