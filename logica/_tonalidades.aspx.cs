using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.Services;

public partial class presentacion_Default : System.Web.UI.Page
{
    public DataTable datos()
    {
        tonalidad tonalidad = new tonalidad();
        DataTable Mostrar = tonalidad.obtenerTonalidades();

        return Mostrar;
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetNoStore();
        if (!IsPostBack)
        {
            this.GridView1.DataSource = datos();
            this.GridView1.DataBind();
        }
    }
    protected void B_Crear_Click(object sender, EventArgs e)
    {
        Page.Validate();
        if (Page.IsValid)
        {
            
            tonalidad tonalidad = new tonalidad();
            _tonalidad t = new _tonalidad();

            t.Nombre = TB_Nombre.Text;
            t.Color = valueInput.Value;

            tonalidad.crearTonalidad(t);
            String script = "<script type='text/javascript'>$('<div>La nueva tonalidad se ha creado correctamente</div>').dialog({" + "title: 'Correcto'," + "modal: true," + "resizable: false," + "buttons: {" + "Close: function() {" + "$(this).dialog('close');" + "}" + "}" + "});</script>";
            this.RegisterStartupScript("mensaje", script);

            TB_Nombre.Text = ""; valueInput.Value = "·fff";

            this.GridView1.DataSource = datos();
            this.GridView1.DataBind();
            // servervalidate should have been called
        }
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {

    }
    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {

    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        /*Int16 id = Int16.Parse(GridView1.DataKeys[e.RowIndex].Value.ToString());

        tonalidad tonalidad = new tonalidad();
        _tonalidad t = new _tonalidad();


        t.Id = id;
        tonalidad.eliminarTonalidad(t);

        String script = "<script type='text/javascript'>$('<div>La tonalidad se ha eliminado correctamente</div>').dialog({" + "title: 'Eliminado'," + "modal: true," + "resizable: false," + "buttons: {" + "Close: function() {" + "$(this).dialog('close');" + "}" + "}" + "});</script>";
        this.RegisterStartupScript("mensaje", script);
        //this.RegisterStartupScript("mensaje", "<script type='text/javascript'>alert('El control se ha eliminado correctamente');</script>");

        this.GridView1.DataSource = datos();
        this.GridView1.DataBind();*/
    }
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {

    }
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {

    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            var p = (HtmlGenericControl)e.Row.FindControl("p_color");
            p.Style.Add("background-color", "#" + ((System.Data.DataRowView)(e.Row.DataItem)).Row.ItemArray[2]);


            //color
            //((System.Data.DataRowView)(e.Row.DataItem)).Row.ItemArray[2]
        }
    }
    protected void LinkButton3_Click(object sender, EventArgs e)
    {
        /*
        ImageButton lbtn = (ImageButton)sender;
        GridViewRow row = (GridViewRow)lbtn.NamingContainer;
        int rowIndex = Convert.ToInt32(lbtn.Attributes["RowIndex"]);
        if (row != null)
        {
            Int16 id = Int16.Parse(GridView1.DataKeys[rowIndex].Value.ToString());

            tonalidad tonalidad = new tonalidad();
            _tonalidad t = new _tonalidad();


            t.Id = id;
            tonalidad.eliminarTonalidad(t);

            String script = "<script type='text/javascript'>$('<div>La tonalidad se ha eliminado correctamente</div>').dialog({" + "title: 'Eliminado'," + "modal: true," + "resizable: false," + "buttons: {" + "Close: function() {" + "$(this).dialog('close');" + "}" + "}" + "});</script>";
            this.RegisterStartupScript("mensaje", script);
            //this.RegisterStartupScript("mensaje", "<script type='text/javascript'>alert('El control se ha eliminado correctamente');</script>");

            this.GridView1.DataSource = datos();
            this.GridView1.DataBind();
        }*/
    }

    [WebMethod]
    public static bool eliminarTonalidad(Int16 code)
    {
        Int16 id = code;

        tonalidad tonalidad = new tonalidad();
        _tonalidad t = new _tonalidad();


        t.Id = id;
        tonalidad.eliminarTonalidad(t);

        return true;
    }

    [WebMethod]
    public static bool validarNombreTonalidad(string code)
    {
        tonalidad tonalidad = new tonalidad();
        DataTable tonalidades = tonalidad.obtenerTonalidades();
        bool result = true;
        for (int i = 0; i < tonalidades.Rows.Count; i++)
        {
            if (tonalidades.Rows[i]["nombre"].ToString().ToLower().Equals(code.ToLower()))
            {
                result = false;
                break;
            }
        }
        return result;
    }

    [WebMethod]
    public static bool validarColorTonalidad(string code)
    {
        tonalidad tonalidad = new tonalidad();
        DataTable tonalidades = tonalidad.obtenerTonalidades();
        bool result = true;
        for (int i = 0; i < tonalidades.Rows.Count; i++)
        {
            if (tonalidades.Rows[i]["color"].ToString().ToLower().Equals(code.ToLower()))
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

        if(TB_buscar.Text == ""){
            GridView1.DataSource = datos1;
            GridView1.DataBind();
        }
        else{
            datos2.Columns.Add("id");
            datos2.Columns.Add("nombre");
            datos2.Columns.Add("color");
        
            string[] celdas = new string[3];
            int band = 0;
            for (int i = 0; i < datos1.Rows.Count; i++)
            {
                band = 0;
                if ( datos1.Rows[i]["nombre"].ToString().ToLower().Contains(TB_buscar.Text.ToLower()))
                {
                    band = 1;
                }
                if (band == 1)
                {
                    celdas[0] = datos1.Rows[i]["id"].ToString();
                    celdas[1] = datos1.Rows[i]["nombre"].ToString();
                    celdas[2] = datos1.Rows[i]["color"].ToString();
                    datos2.Rows.Add(celdas);

                }
            }
            GridView1.DataSource = datos2;
            GridView1.DataBind();
        }
    }
}