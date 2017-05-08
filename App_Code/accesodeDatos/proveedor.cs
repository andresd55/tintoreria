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
using Npgsql;
using NpgsqlTypes;
using MySql.Data.MySqlClient;

/// <summary>
/// Descripción breve de usuario
/// </summary>
public class proveedor
{
    public void modificarProveedor(_proveedor p)
    {
        MySqlConnection conection = new MySqlConnection(ConfigurationManager.ConnectionStrings["mysql"].ConnectionString);
        DataTable dataTable = new DataTable();
        try
        {
            conection.Open();
            MySqlDataAdapter dataAdapter = new MySqlDataAdapter("sp_modificar_proveedor", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            dataAdapter.SelectCommand.Parameters.Add("_id", MySqlDbType.Int16).Value = p.Id;
            dataAdapter.SelectCommand.Parameters.Add("_nombre", MySqlDbType.Text).Value = p.Nombre;
            dataAdapter.SelectCommand.Parameters.Add("_telefono", MySqlDbType.Text).Value = p.Telefono;
            dataAdapter.SelectCommand.Parameters.Add("_direccion", MySqlDbType.Text).Value = p.Direccion;
            dataAdapter.SelectCommand.Parameters.Add("_ciudad", MySqlDbType.Text).Value = p.Ciudad;
            dataAdapter.SelectCommand.Parameters.Add("_correo", MySqlDbType.Text).Value = p.Correo;
            dataAdapter.SelectCommand.Parameters.Add("_observacion", MySqlDbType.Text).Value = p.Observacion;

            dataAdapter.Fill(dataTable);

        }
        catch (Exception e)
        {
            throw e;
        }
        finally
        {
            if (conection != null)
            {
                conection.Close();
            }
        }
    }
    public void eliminarProveedor(_proveedor p)
    {
        MySqlConnection conection = new MySqlConnection(ConfigurationManager.ConnectionStrings["mysql"].ConnectionString);
        DataTable dataTable = new DataTable();
        try
        {
            conection.Open();
            MySqlDataAdapter dataAdapter = new MySqlDataAdapter("sp_eliminar_proveedor", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;

            dataAdapter.SelectCommand.Parameters.Add("_id", MySqlDbType.Int16).Value = p.Id;

            dataAdapter.Fill(dataTable);

        }
        catch (Exception e)
        {
            throw e;
        }
        finally
        {
            if (conection != null)
            {
                conection.Close();
            }
        }
    }
    public DataTable obtenerProveedores()
    {
        MySqlConnection conection = new MySqlConnection(ConfigurationManager.ConnectionStrings["mysql"].ConnectionString);
        DataTable dataTable = new DataTable();

        try
        {
            MySqlDataAdapter dataAdapter = new MySqlDataAdapter("sp_obtener_proveedores", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;

            conection.Open();

            dataAdapter.Fill(dataTable);
        }
        catch (Exception e)
        {
            throw e;
        }
        finally
        {
            if (conection != null)
            {
                conection.Close();
            }
        }
        return dataTable;
    }
    public void crearProveedor(_proveedor p)
    {
        MySqlConnection conection = new MySqlConnection(ConfigurationManager.ConnectionStrings["mysql"].ConnectionString);
        DataTable dataTable = new DataTable();
        try
        {
            conection.Open();
            MySqlDataAdapter dataAdapter = new MySqlDataAdapter("sp_crear_proveedor", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            dataAdapter.SelectCommand.Parameters.Add("_nombre", MySqlDbType.Text).Value = p.Nombre;
            dataAdapter.SelectCommand.Parameters.Add("_telefono", MySqlDbType.Text).Value = p.Telefono;
            dataAdapter.SelectCommand.Parameters.Add("_correo", MySqlDbType.Text).Value = p.Correo;
            dataAdapter.SelectCommand.Parameters.Add("_direccion", MySqlDbType.Text).Value = p.Direccion;
            dataAdapter.SelectCommand.Parameters.Add("_ciudad", MySqlDbType.Text).Value = p.Ciudad;
            dataAdapter.SelectCommand.Parameters.Add("_observacion", MySqlDbType.Text).Value = p.Observacion;

            dataAdapter.Fill(dataTable);

        }
        catch (Exception e)
        {
            throw e;
        }
        finally
        {
            if (conection != null)
            {
                conection.Close();
            }
        }
    }
}