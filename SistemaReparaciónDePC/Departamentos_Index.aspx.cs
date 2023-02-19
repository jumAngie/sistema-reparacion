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
    public partial class Departamentos_Index : System.Web.UI.Page
    {
        Departamentos dep = new Departamentos();
        Utilitario util = new Utilitario();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["ID_Deptos"] = "";
                dep.CargarGriv(gvDeptos, "");
            }
            else
            {
                string eventtarget = Request["__EVENTTARGET"];
                string eventargument = Request["__EVENTARGUMENT"];

                if (eventtarget == "Editar")
                {
                    LlenarDatos(eventargument);
                    btneditar.Visible = true;
                    btnguardar.Visible = false;
                    Session["ID_Deptos"] = eventargument;


                    Response.Write("<script src='Content/js/jquery-3.1.1.min.js'></script>");
                    Response.Write("<script src='Content/js/bootstrap.js'></script>");
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "script", "showModal();", true);
                    btnCerrar.Visible = true;
                    modalcerrar.Visible = false;
                }
            }
        }
        protected void btnbuscar_Click(object sender, EventArgs e)
        {
            dep.CargarGriv(gvDeptos, txtbuscar.Text);
        }

        protected void btnCerrar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Departamentos_Index.aspx");
        }

        protected void gvDeptos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvDeptos.PageIndex = e.NewPageIndex;
            dep.CargarGriv(gvDeptos, txtbuscar.Text);
        }

        protected void btnguardar_Click(object sender, EventArgs e)
        {
            if (txtDepto.Text != "")
            {
                int Usuario = Int32.Parse(Session["ID"].ToString());
                DataSet ds = new DataSet();
                string sql = "EXEC UDP_InsertarDeptos '" + txtDepto.Text + "','" + Usuario + "'";
                ds = util.ObtenerDatos(sql, "TUsu");
                Response.Redirect("Departamentos_Index.aspx");
            }
        }
        
        public void LlenarDatos(string ID)
        {
            DataSet ds = new DataSet();
            ds = dep.cargardatos(ID);
            txtDepto.Text = ds.Tables["T"].Rows[0]["Departamento_Descripcion"].ToString();
        }

        protected void btneditar_Click(object sender, EventArgs e)
        {
            if (txtDepto.Text != "")
            {
                string eliminar = Session["ID_Deptos"].ToString();
                DataSet ds = new DataSet();
                string sql = "UDP_EditarDatos_Deptos '" + eliminar + "','" + txtDepto.Text + "','" + Int32.Parse(Session["ID"].ToString()) + "' ";
                ds = util.ObtenerDatos(sql, "TUsu");
                txtDepto.Text = "";
                Response.Redirect("Departamentos_Index.aspx");
            }
        }
    }
}