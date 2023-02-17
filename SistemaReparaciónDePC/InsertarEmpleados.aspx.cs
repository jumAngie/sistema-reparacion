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
        Empleado emp = new Empleado();
        Cliente cli = new Cliente();
        Utilitario util = new Utilitario();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                cli.DdlEstado(ddlestadocivil);
                cli.ddldepto(ddlDepartamento);

                if (Session.Count > 0)
                {

                    string ses = Session["IdEmpleado_Editar"].ToString();
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
            if (ddlMuni.SelectedValue == "0")
            {
                lblLugar.Visible = true;
            }
            if (ddlestadocivil.SelectedValue == "0")
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
            if (sexo == "")
            {
                lblSexo.Visible = true;
            }
            ////
            if (txtnombre.Value != "")
            {
                lblNombre.Visible = false;
            }
            if (txtapellido.Value != "")
            {
                lblapellido.Visible = false;
            }
            if (txtIdentidad.Value != "")
            {
                lblidentidad.Visible = false;
            }
            if (txttelefono.Value != "")
            {
                lbltelefono.Visible = false;
            }
            if (ddlMuni.SelectedValue != "0")
            {
                lblLugar.Visible = false;
            }
            if (ddlestadocivil.SelectedValue != "0")
            {
                lblEstado.Visible = false;
            }
            if (txtpuesto.Value != "")
            {
                lblPuesto.Visible = false;
            }
            if (sexo != "")
            {
                lblSexo.Visible = false;
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

            //labels
            lblSexo.Visible = false;
            lblNombre.Visible = false;
            lblidentidad.Visible = false;
        }
        protected void btnLimpiar_Click(object sender, EventArgs e)
        {
            Limpiar();
        }
         
        public void llenarcampos(string id )
        {
            DataSet ds = new DataSet();
            DataSet dl = new DataSet();
            ds = emp.cargardatos(id);
         

            txtnombre.Value = ds.Tables["T"].Rows[0]["Empleado_Nombre"].ToString();

            txtapellido.Value = ds.Tables["T"].Rows[0]["Empleado_Apellido"].ToString();

            txtIdentidad.Value = ds.Tables["T"].Rows[0]["Empleado_Identidad"].ToString();

            txttelefono.Value = ds.Tables["T"].Rows[0]["Empleado_Telefono"].ToString();


            emp.DdlEstado(ddlestadocivil);
            ddlestadocivil.SelectedValue = ds.Tables["T"].Rows[0]["Empleado_EstadoCivilId"].ToString();


            if (ds.Tables["T"].Rows[0]["Empleado_Genero"].ToString() == "F")
            {
                radiof.Checked = true;
            }
            if (ds.Tables["T"].Rows[0]["Empleado_Genero"].ToString() == "M")
            {
                radiom.Checked = true;
            }

            emp.ddldepto(ddlDepartamento);
            ddlDepartamento.SelectedValue = ds.Tables["T"].Rows[0]["Ciudad_DepartamentoId"].ToString();

            emp.ddlmuni(ddlMuni, ddlDepartamento.SelectedValue);
            ddlMuni.SelectedValue = ds.Tables["T"].Rows[0]["Empleado_CiudadId"].ToString();

            txtpuesto.Value = ds.Tables["T"].Rows[0]["Empleado_Puesto"].ToString();        
        }

        protected void btnEditar_Click(object sender, EventArgs e)
        {
            string sexo = "";
          string ideditar =  Session["IdEmpleado_Editar"].ToString();

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
                    string sql = "UDP_EditarEmpleados '" + ideditar + "','" + txtnombre.Value + "','" + txtapellido.Value + "'" +
                    ",'" + txtIdentidad.Value + "','" + ddlestadocivil.SelectedValue + "','" + sexo + "','" + txttelefono.Value + "','" + ddlMuni.SelectedValue + "','" + txtpuesto.Value + "' ,'" + 1 + "' ";
                    ds = util.ObtenerDatos(sql, "TUsu");
                    //Limpiar();
                }
            }
        }
          public  void Eliminar()
          {
            string eliminar = Session["IdEmpleado_Editar"].ToString();
            DataSet ds = new DataSet();
            string sql = "UDP_EliminarEmpleado  '" + eliminar + "','" + 1 + "' ";
            ds = util.ObtenerDatos(sql, "TUsu");
         
        }
    
    
    
    
    }

}