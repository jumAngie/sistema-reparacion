using SistemaReparaciónDePC.Clases;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SistemaReparaciónDePC
{
    public partial class Producto_Indez : System.Web.UI.Page
    {
        producto pro = new producto();
        Utilitario util = new Utilitario();
        protected void Page_Load(object sender, EventArgs e)
        {



            if (!IsPostBack)
            {

                Session["idproducto_Editar"] = "";
                pro.CargarGriv(gvProducto, "");
            }
            else
            {
                string eventtarget = Request["__EVENTTARGET"];
                string eventargument = Request["__EVENTARGUMENT"];

                if (eventtarget == "EditarProducto")
                {
                    llenardatos(eventargument);
                    btneditar.Visible = true;
                    btnguardar.Visible = false;
                    Session["idproducto_Editar"] = eventargument;
                    //Response.Redirect("InsertarEmpleados.aspx");
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "script", "showModal();", true);
                }

                if (eventtarget == "EliminarProducto")
                {
                    Session["idproducto_Editar"] = eventargument;
                    ////ins.Eliminar();
                    //Response.Redirect("Empleado_Index.aspx");
                }
                                  

        }


    }

        protected void btnbuscar_Click(object sender, EventArgs e)
        {
            pro.CargarGriv(gvProducto, txtbuscar.Text);
        }

        protected void gvProducto_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvProducto.PageIndex = e.NewPageIndex;
            pro.CargarGriv(gvProducto, txtbuscar.Text);
        }

        protected void btnmodal_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "script", "showModal();", true);
        }
        
        
        
        protected void btnguardar_Click1(object sender, EventArgs e)
        {
            DataSet ds = new DataSet();
            string sql = "UDP_InsertarProducto '" + txtproducto.Text + "','" + 1 + "'";
            ds = util.ObtenerDatos(sql, "TUsu");
            Response.Redirect("Producto_Indez.aspx");
        
        }
        public void llenardatos(string id)
        {
            DataSet ds = new DataSet();
            ds = pro.cargardatos(id);
            txtproducto.Text = ds.Tables["T"].Rows[0]["pro_Descripción"].ToString();

        }
        protected void btneditar_Click(object sender, EventArgs e)
        {

        }
   
        public void eliminar()
        {
            string eliminar = Session["idproducto_Editar"].ToString();
            DataSet ds = new DataSet();
            string sql = "UDP_EliminarProducto  '" + eliminar + "','" + 1 + "' ";
            ds = util.ObtenerDatos(sql, "TUsu");
        }
    
    
    }
}