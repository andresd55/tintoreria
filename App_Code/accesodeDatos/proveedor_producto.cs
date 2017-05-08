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
public class proveedor_producto
{
    public void eliminarProveedorProducto(_proveedor_producto pp)
    {
        MySqlConnection conection = new MySqlConnection(ConfigurationManager.ConnectionStrings["mysql"].ConnectionString);
        DataTable dataTable = new DataTable();
        try
        {
            conection.Open();
            MySqlDataAdapter dataAdapter = new MySqlDataAdapter("sp_eliminar_proveedor_producto", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;

            dataAdapter.SelectCommand.Parameters.Add("_id", MySqlDbType.Int16).Value = pp.Id;

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
    public DataTable obtenerProveedoresProducto(_proveedor_producto pp)
    {
        MySqlConnection conection = new MySqlConnection(ConfigurationManager.ConnectionStrings["mysql"].ConnectionString);
        DataTable dataTable = new DataTable();

        try
        {
            conection.Open();
            MySqlDataAdapter dataAdapter = new MySqlDataAdapter("sp_obtener_proveedores_producto", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;

            dataAdapter.SelectCommand.Parameters.Add("_producto_id", MySqlDbType.Int16).Value = pp.Producto_id;

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
    public DataTable obtenerProductosProveedor(_proveedor_producto pp)
    {
        MySqlConnection conection = new MySqlConnection(ConfigurationManager.ConnectionStrings["mysql"].ConnectionString);
        DataTable dataTable = new DataTable();

        try
        {
            conection.Open();
            MySqlDataAdapter dataAdapter = new MySqlDataAdapter("sp_obtener_productos_proveedor", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;

            dataAdapter.SelectCommand.Parameters.Add("_proveedor_id", MySqlDbType.Int16).Value = pp.Proveedor_id;

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
    public DataTable obtenerProveedorProducto(_proveedor_producto pp)
    {
        MySqlConnection conection = new MySqlConnection(ConfigurationManager.ConnectionStrings["mysql"].ConnectionString);
        DataTable dataTable = new DataTable();

        try
        {
            conection.Open();
            MySqlDataAdapter dataAdapter = new MySqlDataAdapter("sp_obtener_proveedor_producto", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;

            dataAdapter.SelectCommand.Parameters.Add("_producto_id", MySqlDbType.Int16).Value = pp.Producto_id;
            dataAdapter.SelectCommand.Parameters.Add("_proveedor_id", MySqlDbType.Int16).Value = pp.Proveedor_id;

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
    public void crearProveedorProducto(_proveedor_producto pp)
    {
        MySqlConnection conection = new MySqlConnection(ConfigurationManager.ConnectionStrings["mysql"].ConnectionString);
        DataTable dataTable = new DataTable();
        try
        {
            conection.Open();
            MySqlDataAdapter dataAdapter = new MySqlDataAdapter("sp_crear_proveedor_producto", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            dataAdapter.SelectCommand.Parameters.Add("_proveedor_id", MySqlDbType.Int16).Value = pp.Proveedor_id;
            dataAdapter.SelectCommand.Parameters.Add("_producto_id", MySqlDbType.Int16).Value = pp.Producto_id;

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