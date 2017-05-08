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

public class _proveedor_producto
{
    int id;

    public int Id
    {
        get { return id; }
        set { id = value; }
    }

    int proveedor_id;

    public int Proveedor_id
    {
        get { return proveedor_id; }
        set { proveedor_id = value; }
    }

    int producto_id;

    public int Producto_id
    {
        get { return producto_id; }
        set { producto_id = value; }
    }
}