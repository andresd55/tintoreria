using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class presentacion_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void IB_Procesos_Click(object sender, EventArgs e)
    {
        String script = "<script type='text/javascript'>window.location=\"_administrar_servicios.aspx\" </script>";
        this.RegisterStartupScript("mensaje", script);
    }
    protected void IB_Orden_trabajo_Click(object sender, EventArgs e)
    {

    }
    protected void IB_inventario_Click(object sender, EventArgs e)
    {
        String script = "<script type='text/javascript'>window.location=\"_administrar_productos.aspx\" </script>";
        this.RegisterStartupScript("mensaje", script);
    }
    protected void IB_Proveedores_Click(object sender, EventArgs e)
    {
        String script = "<script type='text/javascript'>window.location=\"_administrar_proveedores.aspx\" </script>";
        this.RegisterStartupScript("mensaje", script);
    }
    protected void IB_usuarios_Click(object sender, EventArgs e)
    {
        String script = "<script type='text/javascript'>window.location=\"_administrar_usuarios.aspx\" </script>";
        this.RegisterStartupScript("mensaje", script);
    }
    protected void IB_cerrar_sesion_Click(object sender, ImageClickEventArgs e)
    {
        String script = "<script type='text/javascript'>window.location=\"index.aspx\" </script>";
        this.RegisterStartupScript("mensaje", script);
    }
}