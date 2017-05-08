using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Npgsql;
using System.Configuration;
using NpgsqlTypes;
using System.Data;
using MySql.Data.MySqlClient;


    public class DaParametrizacion
    {
        public DataTable obtenerRoles()
        {
            DataTable roles = new DataTable();
            MySqlConnection conection = new MySqlConnection(ConfigurationManager.ConnectionStrings["mysql"].ConnectionString);

            try
            {
                MySqlDataAdapter dataAdapter = new MySqlDataAdapter("sp_obtener_roles", conection);
                dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;

                conection.Open();
                dataAdapter.Fill(roles);
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
            return roles;
        }
        public DataTable obtenerDepartamento(string ciudad)
        {
            DataTable departamentos = new DataTable();
            MySqlConnection conection = new MySqlConnection(ConfigurationManager.ConnectionStrings["mysql"].ConnectionString);

            try
            {
                MySqlDataAdapter dataAdapter = new MySqlDataAdapter("sp_obtener_departamento", conection);
                dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
                dataAdapter.SelectCommand.Parameters.Add("_ciudad", MySqlDbType.Text).Value = ciudad;

                conection.Open();
                dataAdapter.Fill(departamentos);
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
            return departamentos;
        }
        public DataTable obtenerDepartamentos()
        {
            DataTable departamentos = new DataTable();
            MySqlConnection conection = new MySqlConnection(ConfigurationManager.ConnectionStrings["mysql"].ConnectionString);

            try
            {
                MySqlDataAdapter dataAdapter = new MySqlDataAdapter("sp_obtener_departamentos", conection);
                dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;

                conection.Open();
                dataAdapter.Fill(departamentos);
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
            return departamentos;
        }
        public DataTable obtenerCiudades(int departamentoId)
        {
            DataTable departamentos = new DataTable();
            MySqlConnection conection = new MySqlConnection(ConfigurationManager.ConnectionStrings["mysql"].ConnectionString);

            try
            {
                MySqlDataAdapter dataAdapter = new MySqlDataAdapter("sp_obtener_ciudades", conection);
                dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
                dataAdapter.SelectCommand.Parameters.Add("_departamento_id", MySqlDbType.Int16).Value = departamentoId;

                conection.Open();
                dataAdapter.Fill(departamentos);
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
            return departamentos;
        }


        public DataTable obtenerBarrios(int ciudadId)
        {
            DataTable departamentos = new DataTable();
            NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["Npgsql"].ConnectionString);

            try
            {
                NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("usuarios.f_obtener_barrios", conection);
                dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
                dataAdapter.SelectCommand.Parameters.Add("_ciudad_id", NpgsqlDbType.Integer).Value = ciudadId;

                conection.Open();
                dataAdapter.Fill(departamentos);
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
            return departamentos;
        }
    }

