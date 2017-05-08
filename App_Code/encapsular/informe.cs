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

/// <summary>
/// Summary description for informe
/// </summary>
public class informe
{
        string identificacion_informe;
        string identificacion_empresa;
        string url;
        Int64 id_usuario;

        string identificacion_cliente;
        DateTime fecha_inicio;
        DateTime fecha_final;
        string alcance;
        string incidente;
        DateTime fecha;
        string evidencia;
        string opinion;
        string controll;
        string observaciones;
        string conclusion;
        string objetivos;
        string recomendacion;

    public string Identificacion_empresa
    {
        get
        {
            return identificacion_empresa;
        }

        set
        {
            identificacion_empresa = value;
        }
    }

    public long Id_usuario
    {
        get
        {
            return id_usuario;
        }

        set
        {
            id_usuario = value;
        }
    }

    public string Identificacion_cliente
    {
        get
        {
            return identificacion_cliente;
        }

        set
        {
            identificacion_cliente = value;
        }
    }

    public DateTime Fecha_inicio
    {
        get
        {
            return fecha_inicio;
        }

        set
        {
            fecha_inicio = value;
        }
    }

    public DateTime Fecha_final
    {
        get
        {
            return fecha_final;
        }

        set
        {
            fecha_final = value;
        }
    }

    public string Alcance
    {
        get
        {
            return alcance;
        }

        set
        {
            alcance = value;
        }
    }

    public DateTime Fecha
    {
        get
        {
            return fecha;
        }

        set
        {
            fecha = value;
        }
    }

    public string Evidencia
    {
        get
        {
            return evidencia;
        }

        set
        {
            evidencia = value;
        }
    }

    public string Controll
    {
        get
        {
            return controll;
        }

        set
        {
            controll = value;
        }
    }

    public string Observaciones
    {
        get
        {
            return observaciones;
        }

        set
        {
            observaciones = value;
        }
    }

    public string Conclusion
    {
        get
        {
            return conclusion;
        }

        set
        {
            conclusion = value;
        }
    }

    public string Objetivos
    {
        get
        {
            return objetivos;
        }

        set
        {
            objetivos = value;
        }
    }

    public string Recomendacion
    {
        get
        {
            return recomendacion;
        }

        set
        {
            recomendacion = value;
        }
    }

    public string Incidente
    {
        get
        {
            return incidente;
        }

        set
        {
            incidente = value;
        }
    }

    public string Opinion
    {
        get
        {
            return opinion;
        }

        set
        {
            opinion = value;
        }
    }

    public string Identificacion_informe
    {
        get
        {
            return identificacion_informe;
        }

        set
        {
            identificacion_informe = value;
        }
    }

    public string Url
    {
        get
        {
            return url;
        }

        set
        {
            url = value;
        }
    }
}