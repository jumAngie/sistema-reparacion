using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SistemaReparaciónDePC.Clases;

namespace SistemaReparaciónDePC
{
    public partial class Usuarios_Admin : System.Web.UI.Page
    {
        Usuarios usu = new Usuarios();
        Utilitario util = new Utilitario();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                usu.ddlEmpleado(ddlEmpleado);

                if (Session.Count > 0)
                {

                    string ses = Session["IdUsuario_Editar"].ToString();
                    if (ses != "")
                    {
                        LlenarCampos(ses);
                        btnEditar.Visible = true;
                        btnGuardar.Visible = false;
                        txtContraseña.Visible = false;
                        ddlEmpleado.Visible = false;
                        ckAdmin.Visible = false;
                        
                    }
                    else
                    {
                        btnEditar.Visible = false;
                        btnGuardar.Visible = true;
                        
                    }
                }
            }
        }

        public void LlenarCampos(string ID)
        {
            DataSet ds = usu.cargardatos(ID);

            txtUsuario.Value = ds.Tables["t"].Rows[0]["Usuario_Usuario"].ToString();
            
            
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            string Contraseña = txtContraseña.Value;
            string Usuario = txtUsuario.Value;
            int EsAdmin;
            string Empleado = ddlEmpleado.SelectedValue;
            string sesion = Session["ID"].ToString();
            if (ckAdmin.Checked)
            {
                EsAdmin = 1;
            }
            else
            {
                EsAdmin = 0;
            }


            if (Contraseña == "" || Usuario == "" || Empleado == "0")
            {
                if (Contraseña == "")
                {
                    lblContraseña.Visible = true;
                }
                if (Usuario == "")
                {
                    lblUsuario.Visible = true;
                }
                if (Empleado == "0")
                {
                    lblEmpleado.Visible = true;
                }
                if (Contraseña != "")
                {
                    lblContraseña.Visible = false;
                }
                if (Usuario != "")
                {
                    lblUsuario.Visible = false;
                }
                if (Empleado != "0")
                {
                    lblEmpleado.Visible = false;
                }
            }
            else
            {
                int Emp = Int32.Parse(Empleado);
                int Modi = Int32.Parse(sesion);
                try
                {
                    lblUsuarioRepetido.Visible = false;
                    usu.InsertarUsuarios(Usuario, Emp, Contraseña, EsAdmin, Modi);
                    Limpiar();
                    
                }
                catch (Exception)
                {
                    lblUsuarioRepetido.Visible = true;
                }
                
               
            }
        }

        public void Limpiar()
        {
            lblUsuario.Visible = false;
            lblEmpleado.Visible = false;
            lblContraseña.Visible = false;
            txtContraseña.Value = "";
            txtUsuario.Value = "";
            if (ckAdmin.Checked)
            {
                ckAdmin.Checked = false;
            }
            ddlEmpleado.SelectedValue = "0";
        }

        protected void btnEditar_Click(object sender, EventArgs e)
        {
            if (txtUsuario.Value == "")
            {
                lblUsuario.Visible = true;
            }
            else
            {
                lblUsuario.Visible = false;
                int sesion = Int32.Parse(Session["IdUsuario_Editar"].ToString());
                int modi = Int32.Parse(Session["ID"].ToString());
                DataSet ds = new DataSet();
                string sql = "EXEC UDP_EditarUsuarios "+ sesion + ", '"+txtUsuario.Value+"',"+modi;
                ds = util.ObtenerDatos(sql, "TUsu");
                Limpiar();
                Response.Redirect("Usuarios_Index.aspx");

            }
        }
    }
}