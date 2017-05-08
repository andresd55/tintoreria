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

/// <summary>
/// Descripción breve de DaoUsuario
/// </summary>
/// 
/// 
public class _tonalidad
{
    int id;

    public int Id
    {
        get { return id; }
        set { id = value; }
    }
    string nombre;

    public string Nombre
    {
        get { return nombre; }
        set { nombre = value; }
    }
    string color;

    public string Color
    {
        get { return color; }
        set { color = value; }
    }
}
