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
using System.Runtime.Serialization;


public class _proceso_servicio
{
    int id;

    public int Id
    {
        get { return id; }
        set { id = value; }
    }

    int proceso_id;

    public int Proceso_id
    {
        get { return proceso_id; }
        set { proceso_id = value; }
    }

    int servicio_id;

    public int Servicio_id
    {
        get { return servicio_id; }
        set { servicio_id = value; }
    }
}