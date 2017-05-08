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

public class producto
{
    public void modificarProducto(_producto p)
    {
        MySqlConnection conection = new MySqlConnection(ConfigurationManager.ConnectionStrings["mysql"].ConnectionString);
        DataTable dataTable = new DataTable();
        try
        {
            conection.Open();
            MySqlDataAdapter dataAdapter = new MySqlDataAdapter("sp_modificar_producto", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            dataAdapter.SelectCommand.Parameters.Add("_id", MySqlDbType.Int16).Value = p.Id;
            dataAdapter.SelectCommand.Parameters.Add("_nombre", MySqlDbType.Text).Value = p.Nombre;
            dataAdapter.SelectCommand.Parameters.Add("_cantidad", MySqlDbType.Int64).Value = p.Cantidad;
            dataAdapter.SelectCommand.Parameters.Add("_unidad_medida", MySqlDbType.Text).Value = p.Unidad_medida;
            dataAdapter.SelectCommand.Parameters.Add("_minimo", MySqlDbType.Int16).Value = p.Minimo;

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
    public void eliminarProducto(_producto p)
    {
        MySqlConnection conection = new MySqlConnection(ConfigurationManager.ConnectionStrings["mysql"].ConnectionString);
        DataTable dataTable = new DataTable();
        try
        {
            conection.Open();
            MySqlDataAdapter dataAdapter = new MySqlDataAdapter("sp_eliminar_producto", conection);
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
    public DataTable obtenerProductos()
    {
        MySqlConnection conection = new MySqlConnection(ConfigurationManager.ConnectionStrings["mysql"].ConnectionString);
        DataTable dataTable = new DataTable();

        try
        {
            MySqlDataAdapter dataAdapter = new MySqlDataAdapter("sp_obtener_productos", conection);
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
    public void crearProducto(_producto p)
    {
        MySqlConnection conection = new MySqlConnection(ConfigurationManager.ConnectionStrings["mysql"].ConnectionString);
        DataTable dataTable = new DataTable();
        try
        {
            conection.Open();
            MySqlDataAdapter dataAdapter = new MySqlDataAdapter("sp_crear_producto", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            dataAdapter.SelectCommand.Parameters.Add("_nombre", MySqlDbType.Text).Value = p.Nombre;
            dataAdapter.SelectCommand.Parameters.Add("_cantidad", MySqlDbType.Int64).Value = p.Cantidad;
            dataAdapter.SelectCommand.Parameters.Add("_unidad_medida", MySqlDbType.Text).Value = p.Unidad_medida;
            dataAdapter.SelectCommand.Parameters.Add("_minimo", MySqlDbType.Int16).Value = p.Minimo;

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