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
public class producto_proceso
{
    public void crearProductoProceso(_producto_proceso pp)
    {
        MySqlConnection conection = new MySqlConnection(ConfigurationManager.ConnectionStrings["mysql"].ConnectionString);
        DataTable dataTable = new DataTable();
        try
        {
            conection.Open();
            MySqlDataAdapter dataAdapter = new MySqlDataAdapter("sp_crear_producto_proceso", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            dataAdapter.SelectCommand.Parameters.Add("_producto_id", MySqlDbType.Int16).Value = pp.Producto_id;
            dataAdapter.SelectCommand.Parameters.Add("_proceso_id", MySqlDbType.Int64).Value = pp.Proceso_id;
            dataAdapter.SelectCommand.Parameters.Add("_cantidad", MySqlDbType.Text).Value = pp.Cantidad;

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