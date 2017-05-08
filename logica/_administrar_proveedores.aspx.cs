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
        proveedor proveedor = new proveedor();
        DataTable proveedores = proveedor.obtenerProveedores();

        return proveedores;
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
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {

    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }
    protected void GridView1_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {

    }
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        Int16 id = Int16.Parse(GridView1.DataKeys[e.RowIndex].Value.ToString());

        proveedor proveedor = new proveedor();
        _proveedor p = new _proveedor();

        TextBox TB_nombre = (TextBox)GridView1.Rows[e.RowIndex].FindControl("_TB_nombre");
        TextBox TB_telefono = (TextBox)GridView1.Rows[e.RowIndex].FindControl("_TB_telefono");
        TextBox TB_direccion = (TextBox)GridView1.Rows[e.RowIndex].FindControl("_TB_direccion");
        DropDownList DDL_Ciudad = (DropDownList)GridView1.Rows[e.RowIndex].FindControl("DDL_Ciudad");
        TextBox TB_correo = (TextBox)GridView1.Rows[e.RowIndex].FindControl("_TB_correo");
        TextBox TB_observacion = (TextBox)GridView1.Rows[e.RowIndex].FindControl("_TB_observacion");

        p.Id = id;
        p.Nombre = TB_nombre.Text;
        p.Telefono = TB_telefono.Text;
        p.Direccion = TB_direccion.Text;
        p.Ciudad = DDL_Ciudad.SelectedItem.Text + "";
        p.Correo = TB_correo.Text;
        p.Observacion = TB_observacion.Text;

        proveedor.modificarProveedor(p);

        String script = "<script type='text/javascript'>$('<div>Los datos de la empresa se han modificado correctamente</div>').dialog({" + "title: 'Modificado'," + "modal: true," + "resizable: false," + "buttons: {" + "Close: function() {" + "$(this).dialog('close');" + "}" + "}" + "});</script>";
        this.RegisterStartupScript("mensaje", script);
        //this.RegisterStartupScript("mensaje", "<script type='text/javascript'>alert('El control se ha Modificado correctamente');</script>");


        GridView1.EditIndex = -1;
        this.GridView1.DataSource = datos();
        this.GridView1.DataBind();
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

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
                    //()
                    DaParametrizacion p = new DaParametrizacion();
                    DataTable departamento = p.obtenerDepartamento((((System.Data.DataRowView)(e.Row.DataItem)).Row.ItemArray[4] + ""));
                    string nom_departamento = departamento.Rows[0]["nombre"] + "";
                    string id_departamento = departamento.Rows[0]["id"] + "";

                    YourdropDown.SelectedValue = YourdropDown.Items.FindByText(nom_departamento).Value;

                    YourdropDown2.Items.Clear();
                    
                    DataTable ciudades = p.obtenerCiudades(int.Parse(id_departamento));
                    for (int i = 0; i < ciudades.Rows.Count; i++)
                    {
                        YourdropDown2.Items.Add(new ListItem { Text = ciudades.Rows[i]["ciudad_name"] + "", Value = ciudades.Rows[i]["ciudad_id"] + "" });
                    }

                    YourdropDown2.SelectedValue = YourdropDown2.Items.FindByText(((System.Data.DataRowView)(e.Row.DataItem)).Row.ItemArray[4] + "").Value;
                }
            }
        }
    }

    [WebMethod]
    public static bool eliminarProveedor(Int16 code)
    {
        Int16 id = code;

        proveedor proveedor = new proveedor();
        _proveedor p = new _proveedor();
        
        p.Id = id;
        proveedor_producto proveedor_producto = new proveedor_producto();
        _proveedor_producto pp = new _proveedor_producto();
        pp.Proveedor_id = id;
        DataTable psp = proveedor_producto.obtenerProductosProveedor(pp);

        foreach (DataRow producto in psp.Rows)
        {
            pp.Id = int.Parse( producto["id"] + "");
            proveedor_producto.eliminarProveedorProducto(pp);
        }
        proveedor.eliminarProveedor(p);

        return true;
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
    protected void LinkButton1_Click(object sender, EventArgs e)
    {

    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {

    }
    protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
    {
        String script = "<script type='text/javascript'>window.location=\"index.aspx\" </script>";
        this.RegisterStartupScript("mensaje", script);
    }
    protected void ImageButton4_Click(object sender, ImageClickEventArgs e)
    {
        String script = "<script type='text/javascript'>window.location=\"_menu_administrador.aspx\" </script>";
        this.RegisterStartupScript("mensaje", script);
    }
    protected void Button2_Click(object sender, EventArgs e)
    {

    }
    protected void DDL_Ciudad_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        proveedor proveedor = new proveedor();
        _proveedor p = new _proveedor();

        p.Nombre = TB_nombre.Text;
        p.Telefono = TB_telefono.Text;
        p.Correo = TB_correo.Text;
        p.Direccion = TB_direccion.Text;
        p.Ciudad = DDL_Ciudad.SelectedItem.Text + "";
        p.Observacion = TB_observacion.Text;


        proveedor.crearProveedor(p);

        TB_nombre.Text = "";
        TB_telefono.Text = "";
        TB_correo.Text = "";
        TB_direccion.Text = "";
        DDL_Ciudad.SelectedIndex = 0;
        DDL_Departamento.SelectedIndex = 0;
        TB_observacion.Text = "";

        String script = "<script type='text/javascript'>$('<div>El nuevo proveedor se ha agregado correctamente</div>').dialog({" + "title: 'Agregado'," + "modal: true," + "resizable: false," + "buttons: {" + "Close: function() {" + "$(this).dialog('close');" + "}" + "}" + "});</script>";
        this.RegisterStartupScript("mensaje", script);

        this.GridView1.DataSource = datos();
        this.GridView1.DataBind();
    }

    [WebMethod]
    public static bool validarCorreo(string code)
    {
        proveedor proveedor = new proveedor();
        DataTable proveedores = proveedor.obtenerProveedores();
        bool result = true;
        for (int i = 0; i < proveedores.Rows.Count; i++)
        {
            if (proveedores.Rows[i]["correo"].ToString().ToLower().Equals(code.ToLower()))
            {
                result = false;
                break;
            }
        }
        return result;
    }

    [WebMethod]
    public static bool validarNombre(string code)
    {
        proveedor proveedor = new proveedor();
        DataTable proveedores = proveedor.obtenerProveedores();
        bool result = true;
        for (int i = 0; i < proveedores.Rows.Count; i++)
        {
            if (proveedores.Rows[i]["nombre"].ToString().ToLower().Equals(code.ToLower()))
            {
                result = false;
                break;
            }
        }
        return result;
    }
    protected void B_Buscar_Click(object sender, EventArgs e)
    {
        DataTable datos1 = datos();
        DataTable datos2 = new DataTable();

        datos2.Columns.Add("id");
        datos2.Columns.Add("nombre");
        datos2.Columns.Add("telefono");
        datos2.Columns.Add("direccion");
        datos2.Columns.Add("ciudad");
        datos2.Columns.Add("correo");
        datos2.Columns.Add("observacion");


        string[] celdas = new string[7];
        int band = 0;
        for (int i = 0; i < datos1.Rows.Count; i++)
        {
            band = 0;
            if ((DDL_opcion.SelectedValue.Equals("Nombre")) &&
                (datos1.Rows[i]["nombre"].ToString().ToLower().Contains(TB_buscar.Text.ToLower()))
                || (DDL_opcion.SelectedValue.Equals("Ciudad")) &&
                (datos1.Rows[i]["ciudad"].ToString().ToLower().Contains(TB_buscar.Text.ToLower())))
            {
                band = 1;
            }
            if (band == 1)
            {
                celdas[0] = datos1.Rows[i]["id"].ToString();
                celdas[1] = datos1.Rows[i]["nombre"].ToString();
                celdas[2] = datos1.Rows[i]["telefono"].ToString();
                celdas[3] = datos1.Rows[i]["direccion"].ToString();
                celdas[4] = datos1.Rows[i]["ciudad"].ToString();
                celdas[5] = datos1.Rows[i]["correo"].ToString();
                celdas[6] = datos1.Rows[i]["observacion"].ToString();
                datos2.Rows.Add(celdas);

            }
        }
        GridView1.DataSource = datos2;
        GridView1.DataBind();
    }
}