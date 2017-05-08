using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class presentacion_Default : System.Web.UI.Page
{
    DataTable fotos;
    String url = "";
    public DataTable datos()
    {
        producto producto = new producto();
        DataTable productos = producto.obtenerProductos();

        proveedor proveedor = new proveedor();
        DataTable proveedores = proveedor.obtenerProveedores();

        proveedor_producto proveedor_producto = new proveedor_producto();
        _proveedor_producto pp = new _proveedor_producto();

        productos.Columns.Add("proveedores", typeof(System.String));

        foreach (DataRow row in productos.Rows)
        {
            pp.Producto_id = int.Parse(row["id"].ToString()); 
            DataTable psp = proveedor_producto.obtenerProveedoresProducto(pp);

            string ps = "";
            foreach (DataRow r in psp.Rows)
            {
                ps += r["proveedor"] + ", ";
            }
            if(ps.Length > 0 )
                row["proveedores"] = ps.Substring(0, ps.Length -2);  
            else
                row["proveedores"] = "El producto no tiene ningún proveedor."; 
        }

        return productos;
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

        producto producto = new producto();
        _producto p = new _producto();

        TextBox TB_nombre = (TextBox)GridView1.Rows[e.RowIndex].FindControl("_TB_nombre");
        TextBox TB_cantidad = (TextBox)GridView1.Rows[e.RowIndex].FindControl("_TB_cantidad");
        TextBox TB_proveedores = (TextBox)GridView1.Rows[e.RowIndex].FindControl("TB_proveedores");
        TextBox TB_minimo = (TextBox)GridView1.Rows[e.RowIndex].FindControl("_TB_minimo");
        TextBox TB_unidad = (TextBox)GridView1.Rows[e.RowIndex].FindControl("_TB_unidad");

        p.Id = id;
        p.Nombre = TB_nombre.Text;
        p.Cantidad = Int64.Parse(TB_cantidad.Text);
        p.Minimo = int.Parse(TB_minimo.Text);
        p.Unidad_medida = TB_unidad.Text;

        producto.modificarProducto(p);


        proveedor_producto proveedor_producto = new proveedor_producto();
        _proveedor_producto pp = new _proveedor_producto();

        pp.Producto_id = id;
        DataTable psp = proveedor_producto.obtenerProveedoresProducto(pp);

        string[] proveedores = TB_proveedores.Text.Split(',');
        proveedor provee = new proveedor();
        DataTable provees = provee.obtenerProveedores();


        foreach (DataRow r in psp.Rows)
        {
            bool exis = false;
            foreach (string proveedor in proveedores)
            {
                if ( r["proveedor"] == proveedor.Trim())
                {
                    exis = true;
                }
            }
            if (!exis)
            {
                pp.Proveedor_id = int.Parse(r["proveedor_id"].ToString());
                pp.Id = int.Parse(((proveedor_producto.obtenerProveedorProducto(pp)).Rows[0]["id"] + ""));
                proveedor_producto.eliminarProveedorProducto(pp);
            }
        }

        foreach (string proveedor in proveedores)
        {
            bool exis = false;
            foreach (DataRow r in psp.Rows)
            {
                if (r["proveedor"] == proveedor.Trim())
                {
                    exis = true;
                }
            }
            if (!exis)
            {
                foreach (DataRow dr in provees.Rows)
                {
                    if (dr["nombre"].ToString().Trim() == proveedor.Trim())
                    {
                        pp.Proveedor_id = int.Parse(dr["id"].ToString());
                        proveedor_producto.crearProveedorProducto(pp);
                    }
                }
            }
        }

        String script = "<script type='text/javascript'>$('<div>Los datos del producto se han modificado correctamente</div>').dialog({" + "title: 'Modificado'," + "modal: true," + "resizable: false," + "buttons: {" + "Close: function() {" + "$(this).dialog('close');" + "}" + "}" + "});</script>";
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
    }

    [WebMethod]
    public static bool eliminarProducto(Int16 code)
    {
        Int16 id = code;

        producto producto = new producto();
        _producto p = new _producto();

        p.Id = id;

        proveedor_producto proveedor_producto = new proveedor_producto();
        _proveedor_producto pp = new _proveedor_producto();
        pp.Producto_id = id;
        DataTable psp = proveedor_producto.obtenerProveedoresProducto(pp);

        foreach (DataRow proveedor in psp.Rows)
        {
            pp.Id = int.Parse(proveedor["id"] + "");
            proveedor_producto.eliminarProveedorProducto(pp);
        }
        producto.eliminarProducto(p);

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
        producto producto = new producto();
        _producto p = new _producto();
        proveedor proveedor = new proveedor();
        DataTable proveedores = proveedor.obtenerProveedores();
        proveedor_producto proveedor_producto = new proveedor_producto();
        _proveedor_producto pp = new _proveedor_producto();

        p.Nombre = TB_nombre.Text;
        p.Cantidad = Int64.Parse(TB_cantidad.Text);
        p.Minimo = int.Parse(TB_minimo.Text);
        p.Unidad_medida = TB_unidad.Text;

        string _proveedores = ppp.Value;
        String[] _proveedor = _proveedores.Split(',');

        producto.crearProducto(p);

        DataTable productos = producto.obtenerProductos();
        pp.Producto_id = int.Parse(productos.Rows[productos.Rows.Count - 1]["id"].ToString());

        foreach (var pr in _proveedor)
        {
            foreach (DataRow dr in proveedores.Rows)
            {
                if (dr["nombre"].ToString().Trim() == pr.Trim())
                {
                    pp.Proveedor_id = int.Parse(dr["id"].ToString());
                    proveedor_producto.crearProveedorProducto(pp);
                }
            }
        }

        TB_nombre.Text = "";
        TB_cantidad.Text = "";
        TB_proveedores.Text = "";
        TB_unidad.Text = "";
        TB_minimo.Text = "";

        String script = "<script type='text/javascript'>$('<div>El nuevo producto se ha agregado correctamente</div>').dialog({" + "title: 'Agregado'," + "modal: true," + "resizable: false," + "buttons: {" + "Close: function() {" + "$(this).dialog('close');" + "}" + "}" + "});</script>";
        this.RegisterStartupScript("mensaje", script);

        this.GridView1.DataSource = datos();
        this.GridView1.DataBind();
    }
    
    [WebMethod]
    public static bool validarNombre(string code)
    {
        producto producto = new producto();
        DataTable productos = producto.obtenerProductos();
        bool result = true;
        for (int i = 0; i < productos.Rows.Count; i++)
        {
            if (productos.Rows[i]["nombre"].ToString().ToLower().Equals(code.ToLower()))
            {
                result = false;
                break;
            }
        }
        return result;
    }

    [WebMethod]
    public static string obtenerProveedores()
    {
        String daresult = null;
        proveedor proveedor = new proveedor();
        DataTable proveedores = proveedor.obtenerProveedores();

        DataSet ds = new DataSet();
        ds.Tables.Add(proveedores);
        daresult = DataSetToJSON(ds);
        return daresult;
    }

    public static string DataSetToJSON(DataSet ds)
    {

        Dictionary<string, object> dict = new Dictionary<string, object>();
        foreach (DataTable dt in ds.Tables)
        {
            object[] arr = new object[dt.Rows.Count + 1];

            for (int i = 0; i <= dt.Rows.Count - 1; i++)
            {
                arr[i] = dt.Rows[i].ItemArray;
            }

            dict.Add(dt.TableName, arr);
        }

        JavaScriptSerializer json = new JavaScriptSerializer();
        return json.Serialize(dict);
    }
    protected void B_Buscar_Click(object sender, EventArgs e)
    {
        DataTable datos1 = datos();
        DataTable datos2 = new DataTable();

        if (TB_buscar.Text == "")
        {
            GridView1.DataSource = datos1;
            GridView1.DataBind();
        }
        else
        {

            datos2.Columns.Add("id");
            datos2.Columns.Add("nombre");
            datos2.Columns.Add("cantidad");
            datos2.Columns.Add("unidad_medida");
            datos2.Columns.Add("minimo");
            datos2.Columns.Add("proveedores");

            string[] celdas = new string[6];
            int band = 0;
            for (int i = 0; i < datos1.Rows.Count; i++)
            {
                band = 0;
                if ((DDL_opcion.SelectedValue.Equals("Nombre")) &&
                    (datos1.Rows[i]["nombre"].ToString().ToLower().Contains(TB_buscar.Text.ToLower()))
                    || (DDL_opcion.SelectedValue.Equals("Proveedor")) &&
                    datos1.Rows[i]["proveedores"].ToString() != "El producto no tiene ningún proveedor." &&
                    (datos1.Rows[i]["proveedores"].ToString().ToLower().Contains(TB_buscar.Text.ToLower())))
                {
                    band = 1;
                }
                if (band == 1)
                {
                    celdas[0] = datos1.Rows[i]["id"].ToString();
                    celdas[1] = datos1.Rows[i]["nombre"].ToString();
                    celdas[2] = datos1.Rows[i]["cantidad"].ToString();
                    celdas[3] = datos1.Rows[i]["unidad_medida"].ToString();
                    celdas[4] = datos1.Rows[i]["minimo"].ToString();
                    celdas[5] = datos1.Rows[i]["proveedores"].ToString();
                    datos2.Rows.Add(celdas);

                }
            }
            GridView1.DataSource = datos2;
            GridView1.DataBind();
        }
    }
}