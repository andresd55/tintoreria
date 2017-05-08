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
public class DaoControl
{
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

    Int32 id_criterio;

    public Int32 Id_criterio
    {
        get { return id_criterio; }
        set { id_criterio = value; }
    }
    String criterio;

    public String Criterio
    {
        get { return criterio; }
        set { criterio = value; }
    }
    Int32 num_documento;

    public Int32 Num_documento
    {
        get { return num_documento; }
        set { num_documento = value; }
    }
    String nombre;

    public String Nombre
    {
        get { return nombre; }
        set { nombre = value; }
    }
    String apellido;

    public String Apellido
    {
        get { return apellido; }
        set { apellido = value; }
    }
    String usuario;

    public String Usuario
    {
        get { return usuario; }
        set { usuario = value; }
    }
    String contraseña;

    public String Contraseña
    {
        get { return contraseña; }
        set { contraseña = value; }
    }
    Int32 id_rol;

    public Int32 Id_rol
    {
        get { return id_rol; }
        set { id_rol = value; }
    }

    String nom_control;

    public String Nom_control
    {
        get { return nom_control; }
        set { nom_control = value; }
    }
    String descripcion;

    public String Descripcion
    {
        get { return descripcion; }
        set { descripcion = value; }
    }
    Int16 id_usuario;

    public Int16 Id_usuario
    {
        get { return id_usuario; }
        set { id_usuario = value; }
    }
    String nom_riesgo;

    public String Nom_riesgo
    {
        get { return nom_riesgo; }
        set { nom_riesgo = value; }
    }
    Int16 id_estado;

    public Int16 Id_estado
    {
        get { return id_estado; }
        set { id_estado = value; }
    }
    Int16 id_control;

    public Int16 Id_control
    {
        get { return id_control; }
        set { id_control = value; }
    }
    Int16 id_riesgo;

    public Int16 Id_riesgo
    {
        get { return id_riesgo; }
        set { id_riesgo = value; }
    }
    String suegerencias;

    public String Suegerencias
    {
        get { return suegerencias; }
        set { suegerencias = value; }
    }


    ///////////////////7
    string nom_empresa;

    public string Nom_empresa
    {
        get { return nom_empresa; }
        set { nom_empresa = value; }
    }
    string telefono_empresa;

    public string Telefono_empresa
    {
        get { return telefono_empresa; }
        set { telefono_empresa = value; }
    }
    string direccion_empresa;

    public string Direccion_empresa
    {
        get { return direccion_empresa; }
        set { direccion_empresa = value; }
    }
    string ciudad_empresa;

    public string Ciudad_empresa
    {
        get { return ciudad_empresa; }
        set { ciudad_empresa = value; }
    }
    string correo_empresa;

    public string Correo_empresa
    {
        get { return correo_empresa; }
        set { correo_empresa = value; }
    }
    string productos_empresa;

    public string Productos_empresa
    {
        get { return productos_empresa; }
        set { productos_empresa = value; }
    }
    string logo_empresa;

    public string Logo_empresa
    {
        get { return logo_empresa; }
        set { logo_empresa = value; }
    }
}
