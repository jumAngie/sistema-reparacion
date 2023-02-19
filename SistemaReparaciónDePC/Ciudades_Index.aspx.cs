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
    public partial class Ciudades_Index : System.Web.UI.Page
    {
        Ciudades ciu = new Ciudades();
        Utilitario util = new Utilitario();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["ID_Ciudades"] = "";
                ciu.CargarGriv(gvCiudades, "");
                ciu.ddldepto(ddlDepto);
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
                    Session["ID_Ciudades"] = eventargument;


                    Response.Write("<script src='Content/js/jquery-3.1.1.min.js'></script>");
                    Response.Write("<script src='Content/js/bootstrap.js'></script>");
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "script", "showModal();", true);
                    btnCerrar.Visible = true;
                    modalcerrar.Visible = false;
                }
            }

        }

        protected void btnCerrar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Ciudades_Index.aspx");
        }

        protected void btnbuscar_Click(object sender, EventArgs e)
        {
            ciu.CargarGriv(gvCiudades, txtbuscar.Text);
        }

        protected void gvCiudades_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvCiudades.PageIndex = e.NewPageIndex;
            ciu.CargarGriv(gvCiudades, txtbuscar.Text);
        }

        protected void btnguardar_Click(object sender, EventArgs e)
        {
            if (txtCiudades.Text != "")
            {
                int Usuario = Int32.Parse(Session["ID"].ToString());
                DataSet ds = new DataSet();
                string sql = "EXEC UDP_InsertarCiudades '" + txtCiudades.Text + "', "+ddlDepto.SelectedValue+"," + Usuario;
                ds = util.ObtenerDatos(sql, "TUsu");
                Response.Redirect("Ciudades_Index.aspx");
            }
        }

        public void LlenarDatos(string ID)
        {
            DataSet ds = new DataSet();
            ds = ciu.cargardatos(ID);
            txtCiudades.Text = ds.Tables["T"].Rows[0]["Ciudad_Descripcion"].ToString();

            ciu.ddldepto(ddlDepto);
            ddlDepto.SelectedValue = ds.Tables["T"].Rows[0]["Ciudad_DepartamentoId"].ToString();
        }

        protected void btneditar_Click(object sender, EventArgs e)
        {
            if (txtCiudades.Text != "")
            {
                string eliminar = Session["ID_Ciudades"].ToString();
                DataSet ds = new DataSet();
                string sql = "EXEC UDP_EditarDatos_Ciudad '" + eliminar + "','" + txtCiudades.Text + "', "+ddlDepto.SelectedValue + "," + Int32.Parse(Session["ID"].ToString());
                ds = util.ObtenerDatos(sql, "TUsu");
                txtCiudades.Text = "";
                Response.Redirect("Ciudades_Index.aspx");
            }
        }
    }
}