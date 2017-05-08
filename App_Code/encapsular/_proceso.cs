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
public class _proceso
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

    string descripcion;

    public string Descripcion
    {
        get { return descripcion; }
        set { descripcion = value; }
    }

    DateTime tiempo_estimado;

    public DateTime Tiempo_estimado
    {
        get { return tiempo_estimado; }
        set { tiempo_estimado = value; }
    }

    int tonalidad_id;

    public int Tonalidad_id
    {
        get { return tonalidad_id; }
        set { tonalidad_id = value; }
    }

}