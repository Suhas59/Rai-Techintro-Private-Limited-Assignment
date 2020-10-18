using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace StudentDetails
{
    public partial class studentlist : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                this.BindGrid();
            }
        }

        private void BindGrid()
        {
            // SqlConnection sqlcon = new SqlConnection(@"Data Source=DESKTOP-UF67CRE\SUHAS;Initial Catalog=StudentInfo;Integrated Security=True");
            // string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            using (SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-UF67CRE\SUHAS;Initial Catalog=StudentInfo;Integrated Security=True"))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT * FROM tbl_student"))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            grdStudent.DataSource = dt;
                            grdStudent.DataBind();
                        }
                    }
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Info.aspx");
        }
    }

   
}