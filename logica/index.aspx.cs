using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;
using System.Text;
using System.IO;

public partial class presentacion_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        DaoControl control = new DaoControl();
        controles controles = new controles();

        control.Num_documento = Int32.Parse(TextBox1.Text);
        control.Nombre = TextBox2.Text;
        control.Apellido = "";
        control.Telefono = TB_telefono.Text;
        control.Direccion = TB_direccion.Text;
        control.Correo = TextBox4.Text;
        control.Contraseña = Encrypt(TextBox5.Text);
        control.Id_rol = 5;

        controles.registroUsuario(control);
        this.RegisterStartupScript("mensaje", "<script type='text/javascript'>alert('Se ha registrado correctamente');</script>");
        TextBox1.Text = ""; TextBox2.Text = "";  TextBox4.Text = ""; TextBox5.Text = ""; TB_direccion.Text = ""; TB_telefono.Text = "";
    }
    protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
    {
    }
    protected void LoginUsuario_Authenticate(object sender, AuthenticateEventArgs e)
    {
        
    }

    [WebMethod]
    public static bool validarCorreo(string code)
    {
        controles controles = new controles();
        DataTable usuarios = controles.obtenerUsuarios();
        bool result = true;
        for (int i = 0; i < usuarios.Rows.Count; i++)
        {
            if (usuarios.Rows[i]["correo"].ToString().ToLower().Equals(code.ToLower()))
            {
                result = false;
                break;
            }
        }
        return result;
    }

    [WebMethod]
    public static bool validarCedula(string code)
    {
        controles controles = new controles();
        DataTable usuarios = controles.obtenerUsuarios();
        bool result = true;
        for (int i = 0; i < usuarios.Rows.Count; i++)
        {
            if (usuarios.Rows[i]["documento"].ToString().ToLower().Equals(code.ToLower()))
            {
                result = false;
                break;
            }
        }
        return result;
    }

    protected void Login1_LoginError(object sender, EventArgs e)
    {

    }

    [WebMethod]
    public static string login(string correo, string pass)
    {
        DaoControl control = new DaoControl();
        controles controles = new controles();

        control.Usuario = correo;
        control.Contraseña = Encrypt(pass);

        String script ="";
        if (!(controles.login(control).Rows.Count > 0))
        {
            script = "$('<div>Correo o contraseña incorrecto </div>').dialog({" + "title: 'Error!'," + "modal: true," + "resizable: false," + "buttons: {" + "Close: function() {" + "$(this).dialog('close');" + "}" + "}" + "});";
            //this.RegisterStartupScript("mensaje", script);
        }
        else
        {
            if (controles.login(control).Rows[0].ItemArray[9].ToString().Equals("3"))
            {
                script = "$('<div>Bienvenid@ " + "Gerente" + "</div>').dialog({" + "title: 'Iniciaste sesión correctamente :)'," + "modal: true," + "resizable: false," + "buttons: {" + "Close: function() {" + "$(this).dialog('Aceptar'); window.location=\"menu_gerente.aspx\"" + "}" + "}" + "});";
                //this.RegisterStartupScript("mensaje", script);
            }
            if (controles.login(control).Rows[0].ItemArray[9].ToString().Equals("2"))
            {
                script = "$('<div>Bienvenid@ " + "Administrativo" + "</div>').dialog({" + "title: 'Iniciaste sesión correctamente :)'," + "modal: true," + "resizable: false," + "buttons: {" + "Close: function() {" + "$(this).dialog('Aceptar'); window.location=\"menu_administrativos.aspx\"" + "}" + "}" + "});";
                //this.RegisterStartupScript("mensaje", script);
            }
            if (controles.login(control).Rows[0].ItemArray[9].ToString().Equals("100"))
            {
                script = "$('<div>Bienvenid@ " + "Administrador" + "</div>').dialog({" + "title: 'Iniciaste sesión correctamente :)'," + "modal: true," + "resizable: false," + "buttons: {" + "Close: function() {" + "$(this).dialog('Aceptar'); window.location=\"_menu_administrador.aspx\"" + "}" + "}" + "});";
                //this.RegisterStartupScript("mensaje", script);
               // this.RegisterStartupScript("mensaje", "<script type='text/javascript'>alert('Bienvenido administrador');window.location=\"administrador.aspx\";</script>");
            }
            
        }
        return script;
    }

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        this.RegisterStartupScript("mensaje", "<script type='text/javascript'>window.open(\"manual.pdf\");</script>");
    }


    private static string Encrypt(string clearText)
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

}