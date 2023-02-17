﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SistemaReparaciónDePC.Clases;

namespace SistemaReparaciónDePC
{
    public partial class Restablecer_Contraseña : System.Web.UI.Page
    {
        Utilitario util = new Utilitario();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRestablecer_Click(object sender, EventArgs e)
        {
            string Usuario = txtUsuario.Value;
            DataSet ds = util.ObtenerDatos("EXEC UDP_VerificarUsuario '" + Usuario + "'", "T");

            if (ds.Tables["T"].Rows.Count > 0)
            {
                lblErrorUsuario.Visible = false;
            }
            else
            {
                lblErrorUsuario.Visible = true;
            }
        }
    }
}