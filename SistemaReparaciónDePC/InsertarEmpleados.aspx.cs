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
    public partial class InsertarEmpleados : System.Web.UI.Page
    {
        Cliente cli = new Cliente();
        Utilitario util = new Utilitario();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                cli.DdlEstado(ddlestadocivil);
                cli.ddldepto(ddlDepartamento);
            }
        }

        protected void ddlDepartamento_SelectedIndexChanged(object sender, EventArgs e)
        {
            cli.ddlmuni(ddlMuni, ddlDepartamento.SelectedValue);
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            string sexo = "";


            if (txtnombre.Value == "")
            {
                lblNombre.Visible = true;
            }
            if (txtapellido.Value == "")
            {
                lblapellido.Visible = true;
            }
            if (txtIdentidad.Value == "")
            {
                lblidentidad.Visible = true;
            }
            if (txttelefono.Value == "")
            {
                lbltelefono.Visible = true;
            }
            if (ddlMuni.SelectedValue == "")
            {
                lblLugar.Visible = true;
            }
            if (ddlestadocivil.SelectedValue == "")
            {
                lblEstado.Visible = true;
            }
            if (txtpuesto.Value == "")
            {
                lblPuesto.Visible = true;
            }

            if (radiof.Checked == true)
            {
                sexo = "F";
            }
            if (radiom.Checked == true)
            {
                sexo = "M";
            }

            if (txtnombre.Value != "" && txtapellido.Value != "" && txtIdentidad.Value != "" && txttelefono.Value != ""
             && ddlMuni.SelectedValue != "")
            {
                if (radiof.Checked == true || radiom.Checked == true)
                {
                    DataSet ds = new DataSet();
                    string sql = "UDP_InsertarEmpleados '" + txtnombre.Value + "','" + txtapellido.Value + "'" +
                    ",'" + txtIdentidad.Value + "','" + ddlestadocivil.SelectedValue + "','" + sexo + "','" + txttelefono.Value + "','" + ddlMuni.SelectedValue + "','" + txtpuesto.Value + "' ,'" + 1 + "' ";
                    ds = util.ObtenerDatos(sql, "TUsu");
                    //Limpiar();
                }
            }
        }
        public void Limpiar()
        {
            txtnombre.Value = "";
            txtapellido.Value = "";
            txtIdentidad.Value = "";
            txttelefono.Value = "";
            ddlestadocivil.SelectedValue = "0";
            ddlDepartamento.SelectedValue = "0";
            ddlMuni.SelectedValue = "";
            radiof.Checked = false;
            radiom.Checked = false;
            txtpuesto.Value = "";
        }
        protected void btnLimpiar_Click(object sender, EventArgs e)
        {
            Limpiar();
        }
    }

}