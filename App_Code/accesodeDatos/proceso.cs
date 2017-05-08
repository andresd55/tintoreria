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

public class proceso
{
    public DataTable obtenerProcesos()
    {
        MySqlConnection conection = new MySqlConnection(ConfigurationManager.ConnectionStrings["mysql"].ConnectionString);
        DataTable dataTable = new DataTable();

        try
        {
            MySqlDataAdapter dataAdapter = new MySqlDataAdapter("sp_obtener_procesos", conection);
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
    public void crearProceso(_proceso p)
    {
        MySqlConnection conection = new MySqlConnection(ConfigurationManager.ConnectionStrings["mysql"].ConnectionString);
        DataTable dataTable = new DataTable();
        try
        {
            conection.Open();
            MySqlDataAdapter dataAdapter = new MySqlDataAdapter("sp_crear_proceso", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            dataAdapter.SelectCommand.Parameters.Add("_nombre", MySqlDbType.Text).Value = p.Nombre;

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