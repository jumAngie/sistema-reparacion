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
    public partial class Insertar_Reparaciones : System.Web.UI.Page
    {
        Reparacion rep = new Reparacion();
        Utilitario util = new Utilitario();
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                rep.DDLcliente(ddlcliente);
                rep.DDLproducto(ddlproducto);
                rep.DDLTipodetrabajo(ddltipodetrabajo);
                rep.DDempleado(ddlempleado);

                if (Session.Count > 0)
                {

                    string ses = Session["IdReparacion_Editar"].ToString();
                    if (ses != "")
                    {
                        llenarcampos(ses);
                        btnEditar.Visible = true;
                        btnGuardar.Visible = false;
                    }
                    else
                    {
                        btnEditar.Visible = false;
                        btnGuardar.Visible = true;
                    }
                }




            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if(ddlcliente.SelectedValue == "0")
            {
                Lblcliente.Visible = true;
            }
            if(ddlempleado.SelectedValue=="0")
            {
                Lblempleado.Visible = true;
            }
            if(ddlproducto.SelectedValue=="0")
            {
                lblproducto.Visible = true;
            }
            if(ddltipodetrabajo.SelectedValue=="0")
            {
                lbltipodetrabajor.Visible = true;
            }
            if(txtreparacion.Value =="")
            {
                lblreparacion.Visible = true;
            }

            if(ddlcliente.SelectedValue !="" && ddlempleado.SelectedValue !="" && ddlproducto.SelectedValue !="" && ddlcliente.SelectedValue != "" && txtreparacion.Value !="")
            { 
            DataSet ds = new DataSet();
            string sql = "UDP_InsertarReparaciones '" + ddltipodetrabajo.SelectedValue + "','" + ddlproducto.SelectedValue + "','" + ddlcliente.SelectedValue + "'" +
                ",'" + ddlempleado.SelectedValue + "','" + txtreparacion.Value + "','" + 1 + "'";
            ds = util.ObtenerDatos(sql, "t");                        
            Limpiar();
                Response.Redirect("Reparacion_Index.aspx");

            }

        }

        public void Limpiar()
        {
            
            txtreparacion.Value ="";
            ddlempleado.SelectedValue = "0";
            ddlproducto.SelectedValue = "0";
            ddltipodetrabajo.SelectedValue = "0";
            ddlcliente.SelectedValue = "0";

        }
    
        public void llenarcampos(string id)
        {
            DataSet ds = new DataSet();
            ds = rep.cargardatos(id);


            rep.DDLcliente(ddlcliente);
            ddlcliente.SelectedValue = ds.Tables["T"].Rows[0]["rep_Cliente"].ToString();
            
            rep.DDLproducto(ddlproducto);
            ddlproducto.SelectedValue = ds.Tables["T"].Rows[0]["rep_Producto"].ToString();

            rep.DDLTipodetrabajo(ddltipodetrabajo);
            ddltipodetrabajo.SelectedValue = ds.Tables["T"].Rows[0]["rep_TipodeTrabajo"].ToString();

            rep.DDempleado(ddlempleado);
            ddlempleado.SelectedValue = ds.Tables["T"].Rows[0]["rep_Empleado"].ToString();

            txtreparacion.Value = ds.Tables["T"].Rows[0]["rep_EstadoReparacion"].ToString();

        }

        protected void btnEditar_Click(object sender, EventArgs e)
        {

            string id = Session["IdReparacion_Editar"].ToString();
            if (ddlcliente.SelectedValue == "0")
            {
                Lblcliente.Visible = true;
            }
            if (ddlempleado.SelectedValue == "0")
            {
                Lblempleado.Visible = true;
            }
            if (ddlproducto.SelectedValue == "0")
            {
                lblproducto.Visible = true;
            }
            if (ddltipodetrabajo.SelectedValue == "0")
            {
                lbltipodetrabajor.Visible = true;
            }
            if (txtreparacion.Value == "")
            {
                lblreparacion.Visible = true;
            }

            if (ddlcliente.SelectedValue != "" && ddlempleado.SelectedValue != "" && ddlproducto.SelectedValue != "" && ddlcliente.SelectedValue != "" && txtreparacion.Value != "")
            {
              
                
                DataSet ds = new DataSet();
                string sql = "UDP_EditarReparacion '" + id + "','" + ddltipodetrabajo.SelectedValue + "','" + ddlproducto.SelectedValue + "','" + ddlcliente.SelectedValue + "'" +
                    ",'" + ddlempleado.SelectedValue + "','" + txtreparacion.Value + "','" + 1 + "'";
                ds = util.ObtenerDatos(sql, "t");                
                Limpiar();
                Response.Redirect("Reparacion_Index.aspx");
            }

        }
        public void ELIMINAR()
        {
            string NUMERO= Session["IdReparacion_Editar"].ToString();
            DataSet ds = new DataSet();
            string sql = "UDP_EliminarReparacion '" + NUMERO + "'";
            Limpiar();
        }



    }
}