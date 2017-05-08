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
public class _usuario
{
    int id;

    public int Id
    {
        get { return id; }
        set { id = value; }
    }
    string documento;

    public string Documento
    {
        get { return documento; }
        set { documento = value; }
    }
    string nombre;

    public string Nombre
    {
        get { return nombre; }
        set { nombre = value; }
    }
    string apellido;

    public string Apellido
    {
        get { return apellido; }
        set { apellido = value; }
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
    string correo;

    public string Correo
    {
        get { return correo; }
        set { correo = value; }
    }
    string password;

    public string Password
    {
        get { return password; }
        set { password = value; }
    }
    int estado;

    public int Estado
    {
        get { return estado; }
        set { estado = value; }
    }
    int rol_id;

    public int Rol_id
    {
        get { return rol_id; }
        set { rol_id = value; }
    }

}
