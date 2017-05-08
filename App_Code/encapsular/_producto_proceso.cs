using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Runtime.Serialization;

public class _producto_proceso
{
    int id;

    public int Id
    {
        get { return id; }
        set { id = value; }
    }

    int producto_id;

    public int Producto_id
    {
        get { return producto_id; }
        set { producto_id = value; }
    }

    int proceso_id;

    public int Proceso_id
    {
        get { return proceso_id; }
        set { proceso_id = value; }
    }

    string cantidad;

    public string Cantidad
    {
        get { return cantidad; }
        set { cantidad = value; }
    }
}