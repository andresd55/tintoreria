using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class presentacion_Default : System.Web.UI.Page
{
    DataTable fotos;
    String url = "";
    public DataTable datos()
    {
        controles Obtener = new controles();
        DataTable Mostrar = Obtener.obtenerEmpresas();

        return Mostrar;
    }
    public DataTable criterios(Int16 id)
    {
        controles Obtener = new controles();
        DaoControl control = new DaoControl();
        control.Id_control = id;
        DataTable Mostrar = Obtener.obtenerCriterios(control);

        return Mostrar;
    }
    public DataTable empresas(Int16 id)
    {
        controles Obtener = new controles();
        DaoControl control = new DaoControl();
        control.Id_control = id;
        DataTable Mostrar = Obtener.obtenerEmpresa(control);

        return Mostrar;
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        // Response.Cache.SetNoStore();
        if (!IsPostBack)
        {
            this.GridView1.DataSource = datos();
            this.GridView1.DataBind();
        }



    }
    protected void GridView3_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        
        abc.Style.Add("display", "block");  

    }
    protected void DDL_Ciudad_SelectedIndexChanged(object sender, EventArgs e)
    {
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
    }
    protected void TextBox2_TextChanged(object sender, EventArgs e)
    {

    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void Button2_Click1(object sender, EventArgs e)
    {

    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {

    }
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        Int16 id = Int16.Parse(GridView1.DataKeys[e.RowIndex].Value.ToString());

        DaoControl control = new DaoControl();
        controles controles = new controles();

        TextBox TB_nombre2 = (TextBox)GridView1.Rows[e.RowIndex].FindControl("TB_nombre");
        TextBox TB_telefono2 = (TextBox)GridView1.Rows[e.RowIndex].FindControl("TB_telefono");
        TextBox TB_direccion2 = (TextBox)GridView1.Rows[e.RowIndex].FindControl("TB_direccion");
        TextBox TB_correo2 = (TextBox)GridView1.Rows[e.RowIndex].FindControl("TB_correo");
        TextBox TB_productos2 = (TextBox)GridView1.Rows[e.RowIndex].FindControl("TB_productos");
        DropDownList DDL_ciudad2 = (DropDownList)GridView1.Rows[e.RowIndex].FindControl("DDL_Ciudad");

        DropDownList nivel = GridView1.Rows[e.RowIndex].FindControl("DDL_nivel") as DropDownList;

        control.Id_control = id;
        control.Nom_empresa = TB_nombre2.Text;
        control.Telefono_empresa = TB_telefono2.Text;
        control.Direccion_empresa = TB_direccion2.Text;
        control.Ciudad_empresa = DDL_ciudad2.SelectedItem.Text + "";
        control.Correo_empresa = TB_correo2.Text;
        control.Productos_empresa = TB_productos2.Text;

        controles.modificarEmpresa(control);

        String script = "<script type='text/javascript'>$('<div>Los datos de la empresa se han Modificado correctamente</div>').dialog({" + "title: 'Modificado'," + "modal: true," + "resizable: false," + "buttons: {" + "Close: function() {" + "$(this).dialog('close');" + "}" + "}" + "});</script>";
        this.RegisterStartupScript("mensaje", script);
        //this.RegisterStartupScript("mensaje", "<script type='text/javascript'>alert('El control se ha Modificado correctamente');</script>");


        GridView1.EditIndex = -1;
        this.GridView1.DataSource = datos();
        this.GridView1.DataBind();
    }
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        this.GridView1.DataSource = datos();
        this.GridView1.DataBind();
    }
    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        this.GridView1.DataSource = datos();
        this.GridView1.DataBind();
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
    }

    protected void Button2_Click2(object sender, EventArgs e)
    {
        this.RegisterStartupScript("mensaje", "<script type='text/javascript'>window.location=\"administrador.aspx\";</script>");
    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        GridView1.DataSource = datos();
        GridView1.DataBind();
        GridView1.Focus();
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            DataRowView dRowView1 = (DataRowView)e.Row.DataItem;
            if ((e.Row.RowState = DataControlRowState.Edit) > 0)
            {
                DropDownList YourdropDown = (DropDownList)e.Row.FindControl("DDL_Departamento") as DropDownList;
                DropDownList YourdropDown2 = (DropDownList)e.Row.FindControl("DDL_Ciudad") as DropDownList;
                if (YourdropDown != null)
                {
                    //YourdropDown.SelectedValue = ((System.Data.DataRowView)(e.Row.DataItem)).Row.ItemArray[8] +"";
                    //YourdropDown2.SelectedValue = ((System.Data.DataRowView)(e.Row.DataItem)).Row.ItemArray[9] + "";	
                    //YourdropDown2.SelectedValue = "2";
                    YourdropDown.SelectedValue = YourdropDown.Items.FindByText(((System.Data.DataRowView)(e.Row.DataItem)).Row.ItemArray[10] + "").Value;

                    YourdropDown2.Items.Clear();
                    DaParametrizacion p = new DaParametrizacion();
                    DataTable ciudades = p.obtenerCiudades(int.Parse((((System.Data.DataRowView)(e.Row.DataItem)).Row.ItemArray[9] + "")));
                    for (int i = 0; i < ciudades.Rows.Count; i++)
                    {
                        YourdropDown2.Items.Add(new ListItem { Text = ciudades.Rows[i]["ciudad_name"] + "", Value = ciudades.Rows[i]["ciudad_id"] + "" });
                    }

                    YourdropDown2.SelectedValue = YourdropDown2.Items.FindByText(((System.Data.DataRowView)(e.Row.DataItem)).Row.ItemArray[4] + "").Value;
                }
            }
        }

    }
    protected void B_Aceptar_Click(object sender, EventArgs e)
    {
        GridView1.PageIndex = 0;

        DataTable datos1 = datos();
        DataTable datos2 = new DataTable();

        datos2.Columns.Add("id_empresa");
        datos2.Columns.Add("logo");
        datos2.Columns.Add("nombre");
        datos2.Columns.Add("telefono");
        datos2.Columns.Add("direccion");
        datos2.Columns.Add("ciudad");
        datos2.Columns.Add("correo");
        datos2.Columns.Add("productos_ofrecidos");


        string[] celdas = new string[8];
        int band = 0;
        for (int i = 0; i < datos1.Rows.Count; i++)
        {
            band = 0;
            if ((DDL_opcion.SelectedValue.Equals("Nombre")) &&
                (datos1.Rows[i]["nombre"].ToString().ToLower().Contains(TB_busqueda.Text.ToLower()))
                || (DDL_opcion.SelectedValue.Equals("Ciudad")) &&
                (datos1.Rows[i]["ciudad"].ToString().ToLower().Contains(TB_busqueda.Text.ToLower()))
                || (DDL_opcion.SelectedValue.Equals("Producto")) &&
                (datos1.Rows[i]["productos_ofrecidos"].ToString().ToLower().Contains(TB_busqueda.Text.ToLower())))
            {
                band = 1;
            }
            if (band == 1)
            {
                celdas[0] = datos1.Rows[i]["id_empresa"].ToString();
                celdas[1] = datos1.Rows[i]["logo"].ToString();
                celdas[2] = datos1.Rows[i]["nombre"].ToString();
                celdas[3] = datos1.Rows[i]["telefono"].ToString();
                celdas[4] = datos1.Rows[i]["direccion"].ToString();
                celdas[5] = datos1.Rows[i]["ciudad"].ToString();
                celdas[6] = datos1.Rows[i]["correo"].ToString();
                celdas[7] = datos1.Rows[i]["productos_ofrecidos"].ToString();
                datos2.Rows.Add(celdas);

            }
        }
        GridView1.DataSource = datos2;
        GridView1.DataBind();
    }
    protected void LinkButton3_Click(object sender, EventArgs e)
    {
        
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        Int16 id = Int16.Parse(e.CommandArgument.ToString());

        DataTable crit = criterios(id);
        DataTable empresa = empresas(id);

        string nombre = empresa.Rows[0].ItemArray[1].ToString();
        string imagen = empresa.Rows[0].ItemArray[7].ToString();

        abc.Style.Add("display", "block");
        carga.Style.Add("display", "block");
        string hh = "    <center>" +
            "<img id='close' src='../img/cerrar.png' onclick ='div_hide()'>" +
            "<div style='margin-top:10px;'>" +
                "<img id='Img1' src='" + imagen.Replace("~", "..") + "' width='40px' height='40px' style='border-radius:50%; margin-left:-600px;'>" +
                "<span style='margin-top:10px; position:absolute; margin-left:20px;'>" + nombre + "</span>" +
            "</div>" +
            "<div style=' max-height:200px; margin-top:20px; width:640px; overflow-y: auto; background:#B4B951'>" +
                "<table style='background:#F8F6BD;  margin-top:1px; margin-left:1px; width:620px; border: solid 1px black;'>" +
                    "<b><tr style='background-color:rgb(151,160,61); color:white;'></b>" +
                        "<td style='border: solid 1px black;'><center><span>Criterio</span></center></td>" +
                        "<td style='border: solid 1px black;'><center><span>Tipo</span></center></td>" +
                        "<td style='border: solid 1px black;'><center><span>valor</span></center></td>" +
                    "</tr>";
        for (int i = 0; i < crit.Rows.Count; i++)
        {
            hh += "<tr>" +
                    "<td style='border: solid 1px black;'><center><span>"+ crit.Rows[i].ItemArray[4].ToString() +"</span></center></td>" +
                    "<td style='border: solid 1px black;'><center><span>" + crit.Rows[i].ItemArray[5].ToString() + "</span></center></td>" +
                    "<td style='border: solid 1px black;'><center><span>" + crit.Rows[i].ItemArray[3].ToString() + "</span></center></td>" +
                "</tr>";
        }
        hh += "</table>" +
    "</div>" +
"</center>";

        form.InnerHtml = hh;
    }
    protected void ImageButton9_Click(object sender, ImageClickEventArgs e)
    {
        String script = "<script type='text/javascript'>window.location='menu_administrativos.aspx'; </script>";
        this.RegisterStartupScript("mensaje", script);
    }
}