using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class presentacion_Default : System.Web.UI.Page
{
    public DataTable datos()
    {
        usuario usuario = new usuario();
        DataTable usuarios = usuario.obtenerUsuarios();
        DaParametrizacion d = new DaParametrizacion();
        DataTable roles = d.obtenerRoles();

        usuarios.Columns.Add("rol", typeof(System.String));

        foreach (DataRow row in usuarios.Rows)
        {
            row["password"] = Decrypt(row["password"] + "");
            foreach (DataRow rol in roles.Rows)
            {
                if(rol[0]+"" == row["id_rol"]+"")
                    row["rol"] = rol[1];
            }
        }

        return usuarios;
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        // Response.Cache.SetNoStore();
        if (!IsPostBack)
        {
            this.GridView1.DataSource = datos();
            this.GridView1.DataBind();
        }
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {

    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }
    protected void GridView1_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {

    }
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        Int16 id = Int16.Parse(GridView1.DataKeys[e.RowIndex].Value.ToString());

        usuario usuario = new usuario();
        _usuario u = new _usuario();

        TextBox TB_documento = (TextBox)GridView1.Rows[e.RowIndex].FindControl("_TB_documento");
        TextBox TB_nombre = (TextBox)GridView1.Rows[e.RowIndex].FindControl("_TB_nombre");
        TextBox TB_apellido = (TextBox)GridView1.Rows[e.RowIndex].FindControl("_TB_apellido");
        TextBox TB_telefono = (TextBox)GridView1.Rows[e.RowIndex].FindControl("_TB_telefono");
        TextBox TB_direccion = (TextBox)GridView1.Rows[e.RowIndex].FindControl("_TB_direccion");
        TextBox TB_correo = (TextBox)GridView1.Rows[e.RowIndex].FindControl("_TB_correo");
        TextBox TB_password = (TextBox)GridView1.Rows[e.RowIndex].FindControl("_TB_password");
        DropDownList _DropDownList1 = (DropDownList)GridView1.Rows[e.RowIndex].FindControl("_DropDownList1");

        u.Id = id;
        u.Documento = TB_documento.Text;
        u.Nombre = TB_nombre.Text;
        u.Apellido = TB_apellido.Text;
        u.Telefono = TB_telefono.Text;
        u.Direccion = TB_direccion.Text;
        u.Correo = TB_correo.Text;
        u.Password = Encrypt(TB_password.Text);
        u.Estado = 1;
        u.Rol_id = int.Parse(_DropDownList1.SelectedValue + "");

        usuario.modificarUsuario(u);

        String script = "<script type='text/javascript'>$('<div>El usuario se han modificado correctamente</div>').dialog({" + "title: 'Modificado'," + "modal: true," + "resizable: false," + "buttons: {" + "Close: function() {" + "$(this).dialog('close');" + "}" + "}" + "});</script>";
        this.RegisterStartupScript("mensaje", script);
        //this.RegisterStartupScript("mensaje", "<script type='text/javascript'>alert('El control se ha Modificado correctamente');</script>");


        GridView1.EditIndex = -1;
        this.GridView1.DataSource = datos();
        this.GridView1.DataBind();
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            DataRowView dRowView1 = (DataRowView)e.Row.DataItem;
            if ((e.Row.RowState = DataControlRowState.Edit) > 0)
            {
                DropDownList YourdropDown = (DropDownList)e.Row.FindControl("DropDownList1") as DropDownList;
                if (YourdropDown != null)
                {
                    string rol = ((System.Data.DataRowView)(e.Row.DataItem)).Row.ItemArray[10] + "";
                    //DaParametrizacion d = new DaParametrizacion();
                    //roles = 

                    YourdropDown.SelectedValue = YourdropDown.Items.FindByText(rol).Value;
                }
            }
        }
    }

    [WebMethod]
    public static bool eliminarUsuario(Int16 code)
    {
        Int16 id = code;

        usuario usuario = new usuario();
        _usuario u = new _usuario();

        u.Id = id;

        usuario.eliminarUsuario(u);

        return true;
    }
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        this.GridView1.DataSource = datos();
        this.GridView1.DataBind();
    }
    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        this.GridView1.DataSource = datos();
        this.GridView1.DataBind();
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {

    }
    protected void LinkButton2_Click(object sender, EventArgs e)
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
    protected void Button2_Click(object sender, EventArgs e)
    {

    }
    protected void DDL_Ciudad_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        usuario usuario = new usuario();
        _usuario u = new _usuario();

        u.Documento = TextBox1.Text;
        u.Nombre = TextBox2.Text;
        u.Apellido = TextBox3.Text;
        u.Telefono = TB_telefono.Text;
        u.Correo = TextBox4.Text;
        u.Direccion = TB_direccion.Text;
        u.Password = Encrypt(TextBox5.Text);
        u.Rol_id = int.Parse(DropDownList1.SelectedValue + "");


        usuario.registroUsuario(u);

        TextBox1.Text ="";
        TextBox2.Text ="";
        TextBox3.Text = "";
        TB_telefono.Text = "";
        TextBox4.Text = "";
        TB_direccion.Text = "";
        TextBox5.Text = "";
        DropDownList1.SelectedValue  = "1";

        String script = "<script type='text/javascript'>$('<div>El usuario se ha agregado correctamente</div>').dialog({" + "title: 'Agregado'," + "modal: true," + "resizable: false," + "buttons: {" + "Close: function() {" + "$(this).dialog('close');" + "}" + "}" + "});</script>";
        this.RegisterStartupScript("mensaje", script);

        this.GridView1.DataSource = datos();
        this.GridView1.DataBind();
    }

    private string Encrypt(string clearText)
    {
        string EncryptionKey = "7'xIa9?]c2?VB:R";
        byte[] clearBytes = Encoding.Unicode.GetBytes(clearText);
        using (Aes encryptor = Aes.Create())
        {
            Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
            encryptor.Key = pdb.GetBytes(32);
            encryptor.IV = pdb.GetBytes(16);
            using (MemoryStream ms = new MemoryStream())
            {
                using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateEncryptor(), CryptoStreamMode.Write))
                {
                    cs.Write(clearBytes, 0, clearBytes.Length);
                    cs.Close();
                }
                clearText = Convert.ToBase64String(ms.ToArray());
            }
        }
        return clearText;
    }

    private string Decrypt(string cipherText)
    {
        string EncryptionKey = "7'xIa9?]c2?VB:R";
        byte[] cipherBytes = Convert.FromBase64String(cipherText);
        using (Aes encryptor = Aes.Create())
        {
            Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
            encryptor.Key = pdb.GetBytes(32);
            encryptor.IV = pdb.GetBytes(16);
            using (MemoryStream ms = new MemoryStream())
            {
                using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateDecryptor(), CryptoStreamMode.Write))
                {
                    cs.Write(cipherBytes, 0, cipherBytes.Length);
                    cs.Close();
                }
                cipherText = Encoding.Unicode.GetString(ms.ToArray());
            }
        }
        return cipherText;
    }

    [WebMethod]
    public static bool validarCorreo(string code)
    {
        proveedor proveedor = new proveedor();
        DataTable proveedores = proveedor.obtenerProveedores();
        bool result = true;
        for (int i = 0; i < proveedores.Rows.Count; i++)
        {
            if (proveedores.Rows[i]["correo"].ToString().ToLower().Equals(code.ToLower()))
            {
                result = false;
                break;
            }
        }
        return result;
    }

    [WebMethod]
    public static bool validarNombre(string code)
    {
        proveedor proveedor = new proveedor();
        DataTable proveedores = proveedor.obtenerProveedores();
        bool result = true;
        for (int i = 0; i < proveedores.Rows.Count; i++)
        {
            if (proveedores.Rows[i]["nombre"].ToString().ToLower().Equals(code.ToLower()))
            {
                result = false;
                break;
            }
        }
        return result;
    }
    protected void B_Buscar_Click(object sender, EventArgs e)
    {
        DataTable datos1 = datos();
        DataTable datos2 = new DataTable();

        datos2.Columns.Add("id");
        datos2.Columns.Add("documento");
        datos2.Columns.Add("nombre");
        datos2.Columns.Add("apellido");
        datos2.Columns.Add("telefono");
        datos2.Columns.Add("direccion");
        datos2.Columns.Add("correo");
        datos2.Columns.Add("password");
        datos2.Columns.Add("estado");
        datos2.Columns.Add("id_rol");


        string[] celdas = new string[10];
        int band = 0;
        for (int i = 0; i < datos1.Rows.Count; i++)
        {
            band = 0;
            if ((DDL_opcion.SelectedValue.Equals("Nombre")) &&
                (datos1.Rows[i]["nombre"].ToString().ToLower().Contains(TB_buscar.Text.ToLower()))
                || (DDL_opcion.SelectedValue.Equals("Apellido")) &&
                (datos1.Rows[i]["apellido"].ToString().ToLower().Contains(TB_buscar.Text.ToLower()))
                || (DDL_opcion.SelectedValue.Equals("Cedula")) &&
                (datos1.Rows[i]["documento"].ToString().ToLower().Contains(TB_buscar.Text.ToLower()))
                || (DDL_opcion.SelectedValue.Equals("Correo")) &&
                (datos1.Rows[i]["correo"].ToString().ToLower().Contains(TB_buscar.Text.ToLower()))
                )
            {
                band = 1;
            }
            if (band == 1)
            {
                celdas[0] = datos1.Rows[i]["id"].ToString();
                celdas[1] = datos1.Rows[i]["documento"].ToString();
                celdas[2] = datos1.Rows[i]["nombre"].ToString();
                celdas[3] = datos1.Rows[i]["apellido"].ToString();
                celdas[4] = datos1.Rows[i]["telefono"].ToString();
                celdas[5] = datos1.Rows[i]["direccion"].ToString();
                celdas[6] = datos1.Rows[i]["correo"].ToString();
                celdas[7] = datos1.Rows[i]["password"].ToString();
                celdas[8] = datos1.Rows[i]["estado"].ToString();
                celdas[9] = datos1.Rows[i]["id_rol"].ToString();
                datos2.Rows.Add(celdas);

            }
        }

        DaParametrizacion d = new DaParametrizacion();
        DataTable roles = d.obtenerRoles();

        datos2.Columns.Add("rol", typeof(System.String));

        foreach (DataRow row in datos2.Rows)
        {
            foreach (DataRow rol in roles.Rows)
            {
                if (rol[0] + "" == row["id_rol"] + "")
                    row["rol"] = rol[1];
            }
        }

        GridView1.DataSource = datos2;
        GridView1.DataBind();
    }
}