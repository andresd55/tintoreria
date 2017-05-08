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
public class controles
{
	public controles()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}
    public DataTable obtenerEstadisticas()
    {
        NpgsqlConnection objetoConexion = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["Npgsql"].ConnectionString);

        DataTable dataTable = new DataTable();

        try
        {
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("sp_obtener_estadisticas", objetoConexion);
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
    public DataTable obtenerPosicionesHis()
    {
        NpgsqlConnection objetoConexion = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["Npgsql"].ConnectionString);

        DataTable dataTable = new DataTable();

        try
        {
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("sp_obtener_historial_posiciones", objetoConexion);
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
    public DataTable obtenerInforme()
    {
        NpgsqlConnection objetoConexion = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["Npgsql"].ConnectionString);

        DataTable dataTable = new DataTable();

        try
        {
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("sp_obtener_informes", objetoConexion);
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
    public DataTable obtenerOpinion()
    {
        NpgsqlConnection objetoConexion = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["Npgsql"].ConnectionString);

        DataTable dataTable = new DataTable();

        try
        {
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("sp_obtener_opinion", objetoConexion);
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
    public DataTable obtenerNivelIncidente()
    {
        NpgsqlConnection objetoConexion = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["Npgsql"].ConnectionString);

        DataTable dataTable = new DataTable();

        try
        {
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("sp_obtener_nivel_incidente", objetoConexion);
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
    public DataTable obtenerEmpresa(DaoControl control)
    {
        NpgsqlConnection objetoConexion = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["Npgsql"].ConnectionString);

        DataTable dataTable = new DataTable();

        try
        {
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("sp_obtener_empresa", objetoConexion);
            dataAdapter.SelectCommand.Parameters.Add("_id_empresa", NpgsqlDbType.Integer).Value = control.Id_control;

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

    public DataTable obtenerEmpresas()
    {
        NpgsqlConnection objetoConexion = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["Npgsql"].ConnectionString);

        DataTable dataTable = new DataTable();

        try
        {
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("sp_obtener_empresas", objetoConexion);
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
    public DataTable obtenerReporteCriterios()
    {
        NpgsqlConnection objetoConexion = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["Npgsql"].ConnectionString);

        DataTable dataTable = new DataTable();

        try
        {
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("sp_obtener_reporte_criterios", objetoConexion);
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
    public DataTable obtenerCrit()
    {
        NpgsqlConnection objetoConexion = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["Npgsql"].ConnectionString);

        DataTable dataTable = new DataTable();

        try
        {
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("sp_obtener_criterios", objetoConexion);
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
    public DataTable obtenerCriterios(DaoControl control)
    {
        NpgsqlConnection objetoConexion = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["Npgsql"].ConnectionString);

        DataTable dataTable = new DataTable();

        try
        {
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("sp_obtener_criterios_empresa", objetoConexion);
            dataAdapter.SelectCommand.Parameters.Add("_id_empresa", NpgsqlDbType.Integer).Value = control.Id_control;

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

    public void guardarInforme(informe incidente)
    {
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["Npgsql"].ConnectionString);

        DataTable dataTable = new DataTable();
        try
        {
            conection.Open();
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("sp_guardar_informe", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            dataAdapter.SelectCommand.Parameters.Add("_identificacion_empresa", NpgsqlDbType.Varchar).Value = incidente.Identificacion_empresa;
            dataAdapter.SelectCommand.Parameters.Add("_id_usuario", NpgsqlDbType.Bigint).Value = incidente.Id_usuario;
            dataAdapter.SelectCommand.Parameters.Add("_identificacion_cliente", NpgsqlDbType.Varchar).Value = incidente.Identificacion_cliente;
            dataAdapter.SelectCommand.Parameters.Add("_fecha_inicio", NpgsqlDbType.Date).Value = incidente.Fecha_inicio;
            dataAdapter.SelectCommand.Parameters.Add("_fecha_final", NpgsqlDbType.Date).Value = incidente.Fecha_inicio;
            dataAdapter.SelectCommand.Parameters.Add("_alcance", NpgsqlDbType.Varchar).Value = incidente.Alcance;
            dataAdapter.SelectCommand.Parameters.Add("_conclusion", NpgsqlDbType.Varchar).Value = incidente.Conclusion;
            dataAdapter.SelectCommand.Parameters.Add("_objetivos", NpgsqlDbType.Varchar).Value = incidente.Objetivos;
            dataAdapter.SelectCommand.Parameters.Add("_recomendacion", NpgsqlDbType.Varchar).Value = incidente.Recomendacion;
            dataAdapter.SelectCommand.Parameters.Add("_identificacion_informe", NpgsqlDbType.Text).Value = incidente.Identificacion_informe;
            dataAdapter.SelectCommand.Parameters.Add("_url", NpgsqlDbType.Text).Value = incidente.Url;

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

    public void guardarIncidente(informe incidente)
    {
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["Npgsql"].ConnectionString);

        DataTable dataTable = new DataTable();
        try
        {
            conection.Open();
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("sp_guardar_incidente", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            dataAdapter.SelectCommand.Parameters.Add("_incidente", NpgsqlDbType.Text).Value = incidente.Incidente;
            dataAdapter.SelectCommand.Parameters.Add("_fecha", NpgsqlDbType.Date).Value = incidente.Fecha;
            dataAdapter.SelectCommand.Parameters.Add("_evidencia", NpgsqlDbType.Varchar).Value = incidente.Evidencia;
            dataAdapter.SelectCommand.Parameters.Add("_opinion", NpgsqlDbType.Text).Value = incidente.Opinion;
            dataAdapter.SelectCommand.Parameters.Add("_control", NpgsqlDbType.Varchar).Value = incidente.Controll;
            dataAdapter.SelectCommand.Parameters.Add("_observaciones", NpgsqlDbType.Varchar).Value = incidente.Observaciones;

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
    public void crearHistorialPosicion(DaoControl incidente)
    {
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["Npgsql"].ConnectionString);

        DataTable dataTable = new DataTable();
        try
        {
            conection.Open();
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("nuevo_historial_posiciones", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            dataAdapter.SelectCommand.Parameters.Add("_posicion", NpgsqlDbType.Integer).Value = incidente.Id_control;
            dataAdapter.SelectCommand.Parameters.Add("_url", NpgsqlDbType.Text).Value = incidente.Nom_control;

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
    public void crearEmpresa(DaoControl incidente)
    {
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["Npgsql"].ConnectionString);

        DataTable dataTable = new DataTable();
        try
        {           
            conection.Open();
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("sp_nueva_empresa", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            dataAdapter.SelectCommand.Parameters.Add("_nombre", NpgsqlDbType.Text).Value = incidente.Nom_empresa;
            dataAdapter.SelectCommand.Parameters.Add("_telefono", NpgsqlDbType.Text).Value = incidente.Telefono_empresa;
            dataAdapter.SelectCommand.Parameters.Add("_direccion", NpgsqlDbType.Text).Value = incidente.Direccion_empresa;
            dataAdapter.SelectCommand.Parameters.Add("_ciudad", NpgsqlDbType.Text).Value = incidente.Ciudad_empresa;
            dataAdapter.SelectCommand.Parameters.Add("_correo", NpgsqlDbType.Text).Value = incidente.Correo_empresa;
            dataAdapter.SelectCommand.Parameters.Add("_productos_ofrecidos", NpgsqlDbType.Text).Value = incidente.Productos_empresa;
            dataAdapter.SelectCommand.Parameters.Add("_Logo", NpgsqlDbType.Text).Value = incidente.Logo_empresa;

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

    public void crearCriterioEmpresa(DaoControl incidente)
    {
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["Npgsql"].ConnectionString);

        DataTable dataTable = new DataTable();
        try
        {
            conection.Open();
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("sp_nuevo_criterio_empresa", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            dataAdapter.SelectCommand.Parameters.Add("_id_empresa", NpgsqlDbType.Integer).Value = incidente.Id_control;
            dataAdapter.SelectCommand.Parameters.Add("_valor_criterio", NpgsqlDbType.Text).Value = incidente.Criterio;

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
    public void crearCriterioEmpresa_emp(DaoControl incidente)
    {
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["Npgsql"].ConnectionString);

        DataTable dataTable = new DataTable();
        try
        {
            conection.Open();
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("sp_nuevo_criterio_empresa_emp", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            dataAdapter.SelectCommand.Parameters.Add("_id_criterio", NpgsqlDbType.Integer).Value = incidente.Id_control;
            dataAdapter.SelectCommand.Parameters.Add("_valor_criterio", NpgsqlDbType.Text).Value = incidente.Criterio;

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
    public void crearCriterio(DaoControl incidente)
    {
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["Npgsql"].ConnectionString);

        DataTable dataTable = new DataTable();
        try
        {
            conection.Open();
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("sp_nuevo_criterio", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            dataAdapter.SelectCommand.Parameters.Add("_nombre", NpgsqlDbType.Text).Value = incidente.Nom_empresa;
            dataAdapter.SelectCommand.Parameters.Add("_tipo", NpgsqlDbType.Text).Value = incidente.Telefono_empresa;

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
    public void modificarCriterios(DaoControl control)
    {
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["Npgsql"].ConnectionString);
        DataTable dataTable = new DataTable();
        try
        {
            conection.Open();
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("sp_modificar_criterios_empresa", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            dataAdapter.SelectCommand.Parameters.Add("_id_criterio_empresa", NpgsqlDbType.Integer).Value = control.Id_criterio;
            dataAdapter.SelectCommand.Parameters.Add("_valor_criterio", NpgsqlDbType.Text).Value = control.Criterio;

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

    public void modificarEmpresa(DaoControl control)
    {
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["Npgsql"].ConnectionString);
        DataTable dataTable = new DataTable();
        try
        {
            conection.Open();
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("sp_modificar_empresa", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            dataAdapter.SelectCommand.Parameters.Add("_id_empresa", NpgsqlDbType.Integer).Value = control.Id_control;
            dataAdapter.SelectCommand.Parameters.Add("_nombre", NpgsqlDbType.Text).Value = control.Nom_empresa;
            dataAdapter.SelectCommand.Parameters.Add("_telefono", NpgsqlDbType.Text).Value = control.Telefono_empresa;
            dataAdapter.SelectCommand.Parameters.Add("_direccion", NpgsqlDbType.Text).Value = control.Direccion_empresa;
            dataAdapter.SelectCommand.Parameters.Add("_ciudad", NpgsqlDbType.Text).Value = control.Ciudad_empresa;
            dataAdapter.SelectCommand.Parameters.Add("_correo", NpgsqlDbType.Text).Value = control.Correo_empresa;
            dataAdapter.SelectCommand.Parameters.Add("_productos_ofrecidos", NpgsqlDbType.Text).Value = control.Productos_empresa;

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
    public void modificarCriterio(DaoControl control)
    {
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["Npgsql"].ConnectionString);
        DataTable dataTable = new DataTable();
        try
        {
            conection.Open();
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("sp_modificar_criterio", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            dataAdapter.SelectCommand.Parameters.Add("_id_criterio", NpgsqlDbType.Integer).Value = control.Id_control;
            dataAdapter.SelectCommand.Parameters.Add("_nom_criterio", NpgsqlDbType.Text).Value = control.Nom_empresa;

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
    public void eliminarEmpresa(DaoControl control)
    {
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["Npgsql"].ConnectionString);
        DataTable dataTable = new DataTable();
        try
        {
            conection.Open();
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("sp_eliminar_empresa", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;

            dataAdapter.SelectCommand.Parameters.Add("id_empresa", NpgsqlDbType.Integer).Value = control.Id_control;

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
    public void eliminarCriterio(DaoControl control)
    {
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["Npgsql"].ConnectionString);
        DataTable dataTable = new DataTable();
        try
        {
            conection.Open();
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("sp_eliminar_criterio", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;

            dataAdapter.SelectCommand.Parameters.Add("_id_criterio", NpgsqlDbType.Integer).Value = control.Id_control;

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
    public void evaluarControl(DaoControl control)
    {
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["Npgsql"].ConnectionString);
        DataTable dataTable = new DataTable();
        try
        {
            conection.Open();
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("sp_evaluar_incidentes", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            dataAdapter.SelectCommand.Parameters.Add("_sugerencias", NpgsqlDbType.Varchar, 200).Value = control.Suegerencias;
            dataAdapter.SelectCommand.Parameters.Add("_id_estado", NpgsqlDbType.Integer).Value = control.Id_estado;
            dataAdapter.SelectCommand.Parameters.Add("_id_riesgo", NpgsqlDbType.Integer).Value = control.Id_riesgo;

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
    public void registroUsuario(DaoControl control)
    {
        MySqlConnection conection = new MySqlConnection(ConfigurationManager.ConnectionStrings["mysql"].ConnectionString);
        DataTable dataTable = new DataTable();
        try
        {
            conection.Open();
            MySqlDataAdapter dataAdapter = new MySqlDataAdapter("sp_registro_usuarios", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            dataAdapter.SelectCommand.Parameters.Add("_num_documento", MySqlDbType.Int16).Value = control.Num_documento;
            dataAdapter.SelectCommand.Parameters.Add("_nombre", MySqlDbType.Text).Value = control.Nombre;
            dataAdapter.SelectCommand.Parameters.Add("_apellido", MySqlDbType.Text).Value = control.Apellido;
            dataAdapter.SelectCommand.Parameters.Add("_telefono", MySqlDbType.Text).Value = control.Telefono;
            dataAdapter.SelectCommand.Parameters.Add("_direccion", MySqlDbType.Text).Value = control.Direccion;
            dataAdapter.SelectCommand.Parameters.Add("_correo", MySqlDbType.Text).Value = control.Correo;
            dataAdapter.SelectCommand.Parameters.Add("_contraseña", MySqlDbType.Text).Value = control.Contraseña;
            dataAdapter.SelectCommand.Parameters.Add("_id_rol", MySqlDbType.Int16).Value = control.Id_rol;

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
    public DataTable login(DaoControl control)
    {
        DataTable Usuario = new DataTable();
        MySqlConnection conection = new MySqlConnection(ConfigurationManager.ConnectionStrings["mysql"].ConnectionString);

        try
        {
            MySqlDataAdapter dataAdapter = new MySqlDataAdapter("sp_login", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            dataAdapter.SelectCommand.Parameters.Add("_correo", MySqlDbType.Text).Value = control.Usuario;
            dataAdapter.SelectCommand.Parameters.Add("_contraseña", MySqlDbType.Text).Value = control.Contraseña;

            conection.Open();
            dataAdapter.Fill(Usuario);
        }
        catch (Exception Ex)
        {
            throw Ex;
        }
        finally
        {
            if (conection != null)
            {
                conection.Close();
            }
        }
        return Usuario;
    }
}