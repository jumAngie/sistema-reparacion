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
    public partial class InsertarClientes : System.Web.UI.Page
    {
        Utilitario util = new Utilitario();
        Cliente cli = new Cliente();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {

                cli.DdlEstado(ddlestadocivil);
                cli.ddldepto(ddlDepartamento);

                string ses = Session["IdCliente_Editar"].ToString();

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

        protected void ddlDepartamento_SelectedIndexChanged(object sender, EventArgs e)
        {
            cli.ddlmuni(ddlMuni,ddlDepartamento.SelectedValue);
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            string sexo = "";

            
            if(txtnombre.Value=="")
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

            if (radiof.Checked==true)
            {
                sexo = "F";
            }
            if(radiom.Checked==true)
            {
                sexo = "M";
            }
           
            if(txtnombre.Value!="" && txtapellido.Value!="" && txtIdentidad.Value !="" && txttelefono.Value != "" 
             && ddlMuni.SelectedValue !="")
            {       
                if(radiof.Checked==true || radiom.Checked==true)
                { 
                DataSet ds = new DataSet();
                string sql = "UDP_InsertCliente '" + txtnombre.Value + "','" + txtapellido.Value + "'" +
                ",'" + txtIdentidad.Value + "','" + ddlestadocivil.SelectedValue + "','" + sexo + "','" + txttelefono.Value + "','" + ddlMuni.SelectedValue + "' ,'" + 1 + "' ";
                ds = util.ObtenerDatos(sql, "TUsu");
                    Limpiar();


                }
            }
            else
            {
                Advertencia.Visible = true;
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
           
        }
        public  void llenarcampos(string id)
        {
            DataSet ds = new DataSet();
            ds = cli.cargardatos(id);

            txtnombre.Value = ds.Tables["T"].Rows[0]["Cliente_Nombre"].ToString();

            txtapellido.Value = ds.Tables["T"].Rows[0]["Cliente_Apellido"].ToString();

            txtIdentidad.Value = ds.Tables["T"].Rows[0]["Cliente_Identidad"].ToString();

            txttelefono.Value = ds.Tables["T"].Rows[0]["Cliente_Telefono"].ToString();

            cli.DdlEstado(ddlestadocivil);
            ddlestadocivil.SelectedValue = ds.Tables["T"].Rows[0]["EstadoCivil_Descripcion"].ToString();

            if (ds.Tables["T"].Rows[0]["Cliente_Genero"].ToString() == "F")
            {
                radiof.Checked = true;
            }
            if (ds.Tables["T"].Rows[0]["Cliente_Genero"].ToString() == "M")
            {
                radiom.Checked = true;
            }

            
            cli.ddlmuni(ddlMuni, ddlDepartamento.SelectedValue);
            ddlMuni.SelectedValue = ds.Tables["T"].Rows[0]["Ciudad_Descripcion"].ToString();

        }
        protected void btnLimpiar_Click(object sender, EventArgs e)
        {
            Limpiar();
        }

        protected void btnEditar_Click(object sender, EventArgs e)
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
                    string sql = "UDP_EditarClientes '" + txtnombre.Value + "','" + txtapellido.Value + "'" +
                    ",'" + txtIdentidad.Value + "','" + ddlestadocivil.SelectedValue + "','" + sexo + "','" + txttelefono.Value + "','" + ddlMuni.SelectedValue + "' ,'" + 1 + "' ";
                    ds = util.ObtenerDatos(sql, "TUsu");
                    Limpiar();
                }
            }
            else
            {
                Advertencia.Visible = true;
            }

        }
           
        public void eliminar()
        {
            DataSet ds = new DataSet();
            string sql = "UDP_EliminarCliente  '" + Session["IdCliente_Editar"].ToString()+ "','" +1+ "' ";
            ds = util.ObtenerDatos(sql, "TUsu");
        }
     
      
    
    
    
    
    
    
    
    
    
    }
}