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
public class _producto
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

    Int64 cantidad;

    public Int64 Cantidad
    {
        get { return cantidad; }
        set { cantidad = value; }
    }
    int proveedor_id;

    public int Proveedor_id
    {
        get { return proveedor_id; }
        set { proveedor_id = value; }
    }

    string unidad_medida;

    public string Unidad_medida
    {
        get { return unidad_medida; }
        set { unidad_medida = value; }
    }

    int minimo;

    public int Minimo
    {
        get { return minimo; }
        set { minimo = value; }
    }

}