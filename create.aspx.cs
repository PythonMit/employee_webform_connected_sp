using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace employee_webform_connected_sp
{
    public partial class create : System.Web.UI.Page
    {
        SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["webformempConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public void clear()
        {
            txtaddress.Text = "";
            DropDownList1.ClearSelection();
            txtdob.Text = "";
            txtemail.Text = "";
            txtmob.Text = "";
            txtname.Text = "";
            txtsal.Text = "";
            if (radgenf.Checked)
            {
                radgenf.Checked = false;
            }
            else
            {
                radgenm.Checked = false;
            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            
            cmd.Connection = cn; cn.Open();
            cmd= new SqlCommand("ins_empdata",cn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@name", txtname.Text);
            cmd.Parameters.AddWithValue("@email", txtemail.Text);
            cmd.Parameters.AddWithValue("@mob", txtmob.Text);
            cmd.Parameters.AddWithValue("@designation", DropDownList1.SelectedItem.Value);
            cmd.Parameters.AddWithValue("@dob",txtdob.Text);
            cmd.Parameters.AddWithValue("@salary",txtsal.Text);
            cmd.Parameters.AddWithValue("@address", txtaddress.Text);
            if (radgenm.Checked)
            {
                cmd.Parameters.AddWithValue("@gender", radgenm.Text);
            }
            else
            {
                cmd.Parameters.AddWithValue("@gender", radgenf.Text);
            }

            int i= cmd.ExecuteNonQuery();
            Response.Write("insert record" + i);
            cmd.Dispose();
            cn.Close();
            clear();

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            clear();
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("displayemp.aspx");
        }
    }
}