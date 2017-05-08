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

public class usuario
{
    public void modificarUsuario(_usuario u)
    {
        MySqlConnection conection = new MySqlConnection(ConfigurationManager.ConnectionStrings["mysql"].ConnectionString);
        DataTable dataTable = new DataTable();
        try
        {
            conection.Open();
            MySqlDataAdapter dataAdapter = new MySqlDataAdapter("sp_modificar_usuario", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            dataAdapter.SelectCommand.Parameters.Add("_id", MySqlDbType.Int16).Value = u.Id;
            dataAdapter.SelectCommand.Parameters.Add("_num_documento", MySqlDbType.Int16).Value = u.Documento;
            dataAdapter.SelectCommand.Parameters.Add("_nombre", MySqlDbType.Text).Value = u.Nombre;
            dataAdapter.SelectCommand.Parameters.Add("_apellido", MySqlDbType.Text).Value = u.Apellido;
            dataAdapter.SelectCommand.Parameters.Add("_telefono", MySqlDbType.Text).Value = u.Telefono;
            dataAdapter.SelectCommand.Parameters.Add("_direccion", MySqlDbType.Text).Value = u.Direccion;
            dataAdapter.SelectCommand.Parameters.Add("_correo", MySqlDbType.Text).Value = u.Correo;
            dataAdapter.SelectCommand.Parameters.Add("_contraseña", MySqlDbType.Text).Value = u.Password;
            dataAdapter.SelectCommand.Parameters.Add("_estado", MySqlDbType.Int16).Value = u.Estado;
            dataAdapter.SelectCommand.Parameters.Add("_id_rol", MySqlDbType.Int16).Value = u.Rol_id;

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
    public void eliminarUsuario(_usuario u)
    {
        MySqlConnection conection = new MySqlConnection(ConfigurationManager.ConnectionStrings["mysql"].ConnectionString);
        DataTable dataTable = new DataTable();
        try
        {
            conection.Open();
            MySqlDataAdapter dataAdapter = new MySqlDataAdapter("sp_eliminar_usuario", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;

            dataAdapter.SelectCommand.Parameters.Add("_id", MySqlDbType.Int16).Value = u.Id;

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
    public DataTable obtenerUsuarios()
    {
        MySqlConnection objetoConexion = new MySqlConnection(ConfigurationManager.ConnectionStrings["mysql"].ConnectionString);

        DataTable dataTable = new DataTable();

        try
        {
            MySqlDataAdapter dataAdapter = new MySqlDataAdapter("sp_obtener_usuario", objetoConexion);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;

            objetoConexion.Open();
            dataAdapter.Fill(dataTable);
        }
        catch (Exception e)
        {
            throw e;
        }
        finally
        {
            if (objetoConexion != null)
            {
                objetoConexion.Close();
            }
        }
        return dataTable;
    }
    public void registroUsuario(_usuario u)
    {
        MySqlConnection conection = new MySqlConnection(ConfigurationManager.ConnectionStrings["mysql"].ConnectionString);
        DataTable dataTable = new DataTable();
        try
        {
            conection.Open();
            MySqlDataAdapter dataAdapter = new MySqlDataAdapter("sp_registro_usuarios", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            dataAdapter.SelectCommand.Parameters.Add("_num_documento", MySqlDbType.Int16).Value = u.Documento;
            dataAdapter.SelectCommand.Parameters.Add("_nombre", MySqlDbType.Text).Value = u.Nombre;
            dataAdapter.SelectCommand.Parameters.Add("_apellido", MySqlDbType.Text).Value = u.Apellido;
            dataAdapter.SelectCommand.Parameters.Add("_telefono", MySqlDbType.Text).Value = u.Telefono;
            dataAdapter.SelectCommand.Parameters.Add("_direccion", MySqlDbType.Text).Value = u.Direccion;
            dataAdapter.SelectCommand.Parameters.Add("_correo", MySqlDbType.Text).Value = u.Correo;
            dataAdapter.SelectCommand.Parameters.Add("_contraseña", MySqlDbType.Text).Value = u.Password;
            dataAdapter.SelectCommand.Parameters.Add("_id_rol", MySqlDbType.Int16).Value = u.Rol_id;

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