using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Runtime.Serialization.Json;
using System.Web.Script.Serialization;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;

public partial class presentacion_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void B_Buscar_Click(object sender, EventArgs e)
    {

    }
    protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
    {
        String script = "<script type='text/javascript'>window.location=\"index.aspx\" </script>";
        this.RegisterStartupScript("mensaje", script);
    }
    protected void ImageButton4_Click(object sender, ImageClickEventArgs e)
    {
        String script = "<script type='text/javascript'>window.location=\"_menu_administrador.aspx\" </script>";
        this.RegisterStartupScript("mensaje", script);
    }
    protected void Button1_Click(object sender, EventArgs e)
    {

    }
    [WebMethod]
    public static string obtenerProductos()
    {
        String daresult = null;
        producto producto = new producto();
        DataTable productos = producto.obtenerProductos();

        DataSet ds = new DataSet();
        ds.Tables.Add(productos);
        daresult = DataSetToJSON(ds);
        return daresult;
    }

    [WebMethod]
    public static string agregarServicio(string servicio, Object procesos)
    {
        Object b = procesos;
        string a = servicio;

        producto producto = new producto();
        DataTable d_products = producto.obtenerProductos();

        _servicio s = new _servicio();
        servicio ser = new servicio();

        _proceso p = new _proceso();
        proceso proces = new proceso();

        _proceso_servicio ps = new _proceso_servicio();
        proceso_servicio proceso_servicio = new proceso_servicio();

        _producto_proceso pps = new _producto_proceso();
        producto_proceso producto_proceso = new producto_proceso();

        s.Nombre = servicio;
        ser.crearServicio(s);

        DataTable servicios = ser.obtenerServicios();
        ps.Servicio_id = int.Parse(servicios.Rows[servicios.Rows.Count - 1]["id"].ToString());

        IEnumerable enumerable = procesos as IEnumerable;

        foreach (string proceso in enumerable)
        {
            PP produ = JsonConvert.DeserializeObject<PP>(proceso);
            p.Nombre = produ.nombre;
            proces.crearProceso(p);
            
            DataTable procesos2 = proces.obtenerProcesos();
            ps.Proceso_id = int.Parse(procesos2.Rows[procesos2.Rows.Count - 1]["id"].ToString());

            proceso_servicio.crearProcesoServicio(ps);

            foreach (string prod in produ.productos)
            {
                PPPP pr = JsonConvert.DeserializeObject<PPPP>(prod);

                foreach (DataRow dr in d_products.Rows)
                {
                    if (dr["nombre"].ToString().Trim() == pr.nombre.Trim())
                    {
                        pps.Producto_id = int.Parse(dr["id"].ToString());
                        pps.Proceso_id = ps.Proceso_id;
                        pps.Cantidad = pr.valor;
                        producto_proceso.crearProductoProceso(pps);
                    }
                }
            }

        }
        

        return "";
    }
    public class PP
    {
        public string nombre { get; set; }
        public IList<string> productos { get; set; }
    }
    public class PPPP
    {
        public string nombre { get; set; }
        public string valor { get; set; }
    }
    public static string DataSetToJSON(DataSet ds)
    {

        Dictionary<string, object> dict = new Dictionary<string, object>();
        foreach (DataTable dt in ds.Tables)
        {
            object[] arr = new object[dt.Rows.Count + 1];

            for (int i = 0; i <= dt.Rows.Count - 1; i++)
            {
                arr[i] = dt.Rows[i].ItemArray;
            }

            dict.Add(dt.TableName, arr);
        }

        JavaScriptSerializer json = new JavaScriptSerializer();
        return json.Serialize(dict);
    }
    protected void Button1_Click1(object sender, EventArgs e)
    {
        int i = 0;
    }

    
}