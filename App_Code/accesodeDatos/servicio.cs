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
public class servicio
{
    public DataTable obtenerServicios()
    {
        MySqlConnection conection = new MySqlConnection(ConfigurationManager.ConnectionStrings["mysql"].ConnectionString);
        DataTable dataTable = new DataTable();

        try
        {
            MySqlDataAdapter dataAdapter = new MySqlDataAdapter("sp_obtener_servicios", conection);
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
    public void crearServicio(_servicio s)
    {
        MySqlConnection conection = new MySqlConnection(ConfigurationManager.ConnectionStrings["mysql"].ConnectionString);
        DataTable dataTable = new DataTable();
        try
        {
            conection.Open();
            MySqlDataAdapter dataAdapter = new MySqlDataAdapter("sp_crear_servicio", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            dataAdapter.SelectCommand.Parameters.Add("_nombre", MySqlDbType.Text).Value = s.Nombre;

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