using System;
using System.Data;
using System.Data.SqlClient;

namespace StudentDetails
{
    public partial class Info : System.Web.UI.Page
    {
        SqlConnection sqlcon = new SqlConnection(@"Data Source=DESKTOP-UF67CRE\SUHAS;Initial Catalog=StudentInfo;Integrated Security=True");
        SqlCommand sqlcmd;

        string id;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnsavenext_Click(object sender, EventArgs e)
        {
            if (sqlcon.State == ConnectionState.Closed)
            {
                sqlcon.Open();
                SqlCommand sqlcmd = new SqlCommand("Insert Into tbl_student values('"+txtfirstname.Text+"','"+txtmidlename.Text+"','"+txtlastname.Text+ "','','','','','','','','');SELECT SCOPE_IDENTITY();", sqlcon);
               
                int id = Convert.ToInt32(sqlcmd.ExecuteScalar());
                hidid.Value = id.ToString();
                sqlcon.Close();
                diveducationinfo.Style.Add("display", "block");
                divbasicinfo.Style.Add("display", "none");
                divotherinfo.Style.Add("display", "none");

               // Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('Basic Details saved successfully');", true);

            }
        }

        protected void btnupdate_Click(object sender, EventArgs e)
        {
            if (sqlcon.State == ConnectionState.Closed)
            {
                sqlcon.Open();
                SqlCommand sqlcmd = new SqlCommand("Update tbl_student set Collage='" + txtcollage.Text + "',Degree='" + txtdegree.Text + "',Specialisation='" + txtspecialisation.Text + "',PassingDate='" + txtdate.Text + "' where ID='" + hidid.Value +"'", sqlcon);
                sqlcmd.ExecuteNonQuery();
              
                sqlcon.Close();

                diveducationinfo.Style.Add("display", "none");
                divbasicinfo.Style.Add("display", "none");
                divotherinfo.Style.Add("display", "block");
                //Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('Education Details saved successfully');", true);
            }
        }

        protected void savesubmit_Click(object sender, EventArgs e)
        {
            if (sqlcon.State == ConnectionState.Closed)
            {
                sqlcon.Open();
                SqlCommand sqlcmd = new SqlCommand("Update tbl_student set Allergies='" + txtallergies.Text + "',Hobbies='" + txthobbies.Text + "',City='" + txtcity.Text + "',DateOfBirth='" + txtdateofbirth.Text + "' where ID='" + hidid.Value + "'", sqlcon);
                sqlcmd.ExecuteNonQuery();
                sqlcon.Close();
                Response.Redirect("studentlist.aspx");
                Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('Other Details saved successfully');", true);
            }
        }

        protected void btncancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Studentlist.aspx");
        }




        protected void btncancel2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Studentlist.aspx");
        }

        protected void btncancel5_Click(object sender, EventArgs e)
        {
            Response.Redirect("Studentlist.aspx");
        }
    }
}