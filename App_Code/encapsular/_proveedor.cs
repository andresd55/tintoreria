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
public class _proveedor
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
    string telefono;

    public string Telefono
    {
        get { return telefono; }
        set { telefono = value; }
    }
    string direccion;

    public string Direccion
    {
        get { return direccion; }
        set { direccion = value; }
    }
    string ciudad;

    public string Ciudad
    {
        get { return ciudad; }
        set { ciudad = value; }
    }
    string correo;

    public string Correo
    {
        get { return correo; }
        set { correo = value; }
    }
    string observacion;

    public string Observacion
    {
        get { return observacion; }
        set { observacion = value; }
    }

}