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
    public partial class Servicios_Index : System.Web.UI.Page
    {
        Servicios servi = new Servicios();
        Utilitario util = new Utilitario();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                Session["ID_Servicios"] = "";
                servi.CargarGriv(gvServicios, "");
            }
            else
            {
                string eventtarget = Request["__EVENTTARGET"];
                string eventargument = Request["__EVENTARGUMENT"];

                if (eventtarget == "Editar")
                {
                    llenardatos(eventargument);
                    btneditar.Visible = true;
                    btnguardar.Visible = false;
                    Session["ID_Servicios"] = eventargument;



                    Response.Write("<script src='Content/js/jquery-3.1.1.min.js'></script>");
                    Response.Write("<script src='Content/js/bootstrap.js'></script>");
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "script", "showModal();", true);
                    btneditar.Visible = true;

                }

                if (eventtarget == "Eliminar")
                {
                    Session["ID_Servicios"] = eventargument;
                    eliminar();
                }
            }
        }
        protected void btnguardar_Click1(object sender, EventArgs e)
        {
            if (txtServicio.Text != "")
            {
                DataSet ds = new DataSet();
                int UsuarioMod = Int32.Parse(Session["ID"].ToString());
                string sql = "UDP_InsertarProducto '" + txtServicio.Text + "','" + UsuarioMod + "'";
                ds = util.ObtenerDatos(sql, "TUsu");
                Response.Redirect("Servicios_Index.aspx");
            }
        }

        public void llenardatos(string id)
        {
            DataSet ds = new DataSet();
            ds = servi.cargardatos(id);
            txtServicio.Text = ds.Tables["T"].Rows[0]["tipo_Descripción"].ToString();

        }

        protected void btneditar_Click(object sender, EventArgs e)
        {

            if (txtServicio.Text != "")
            {
                string eliminar = Session["ID_Servicios"].ToString();
                int usu = Int32.Parse(Session["ID"].ToString());
                DataSet ds = new DataSet();
                string sql = "EXEC UDP_EditarTipoDeTrabajo '" + eliminar + "','" + txtServicio.Text + "','" + usu + "' ";
                ds = util.ObtenerDatos(sql, "TUsu");
                txtServicio.Text = "";
                Response.Redirect("Servicios_Index.aspx");
            }
        }

        public void eliminar()
        {
            string eliminar = Session["ID_Servicios"].ToString();
            int usuario = Int32.Parse(Session["ID"].ToString());
            DataSet ds = new DataSet();
            string sql = "UDP_EliminarTipoDeTrabajo  '" + eliminar + "','" + usuario + "' ";
            ds = util.ObtenerDatos(sql, "TUsu");
            Response.Redirect("Servicios_Index.aspx");

        }

        protected void gvProducto_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvServicios.PageIndex = e.NewPageIndex;
            servi.CargarGriv(gvServicios, txtbuscar.Text);
        }

        protected void btnbuscar_Click(object sender, EventArgs e)
        {
            servi.CargarGriv(gvServicios, txtbuscar.Text);
        }
    }
}