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
    public partial class displayemp : System.Web.UI.Page
    {
        SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["webformempConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        SqlDataReader dr;

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
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                refreshdata();
            }
        }
        public void refreshdata()
        {
           

            cn.Open();
            cmd.Connection = cn;
            cmd= new SqlCommand("Displayemplist",cn);
            cmd.CommandType = CommandType.StoredProcedure;

            dr = cmd.ExecuteReader();
            GridView1.DataSource = dr;
            GridView1.DataBind();
            dr.Close();
            cmd.Dispose();
            cn.Close();

        }
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            refreshdata();
        }
        private static void ShowAlertMessage(string error)
        {
            System.Web.UI.Page page = System.Web.HttpContext.Current.Handler as System.Web.UI.Page;
            if (page != null)
            {
                error = error.Replace("'", "\'");
                System.Web.UI.ScriptManager.RegisterStartupScript(page, page.GetType(), "err_msg", "alert('" + error + "');", true);
            }
        }
        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int empid = Convert.ToInt16(GridView1.DataKeys[e.RowIndex].Values["id"].ToString());
            cn.Open();
            cmd.Connection= cn;
            cmd = new SqlCommand("delemp", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id",empid);
            int i=cmd.ExecuteNonQuery();
           
            if (i !=0)
            {

                ShowAlertMessage("Record Is Deleted Successfully");
                GridView1.EditIndex = -1;
                cn.Close();
                cmd.Dispose();
                refreshdata();
            }
            else
            {
                ShowAlertMessage("Failed");
                cn.Close();
                cmd.Dispose();
                refreshdata();
            }

            

           
           
        }
        public void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {

            uptable.Visible = true;
            GridView1.EditIndex = e.NewEditIndex;

            int RowIndex = e.NewEditIndex;
            Label empid = (Label)GridView1.Rows[RowIndex].FindControl("lblid");
            Session["id"] = empid.Text;

             txtname.Text = ((Label)GridView1.Rows[RowIndex].FindControl("lblname")).Text.ToString();
            txtemail.Text = ((Label)GridView1.Rows[RowIndex].FindControl("lblemail")).Text.ToString();
           txtmob.Text = ((Label)GridView1.Rows[RowIndex].FindControl("lblemob")).Text.ToString();
            DropDownList1.SelectedValue = ((Label)GridView1.Rows[RowIndex].FindControl("lbldesignation")).Text.ToString();
            var date= ((Label)GridView1.Rows[RowIndex].FindControl("lbldob")).Text.ToString();
            txtdob.Text = DateTime.Parse(date).ToString("yyyy-MM-dd");
            txtsal.Text = ((Label)GridView1.Rows[RowIndex].FindControl("lblsalary")).Text.ToString();
            txtaddress.Text = ((Label)GridView1.Rows[RowIndex].FindControl("lbladdress")).Text.ToString();
          
           string gender  = ((Label)GridView1.Rows[RowIndex].FindControl("lblgender")).Text.ToString();
            if (gender == "Male")
            {
                radgenm.Checked = true;
            }
            else { radgenf.Checked = true; }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("create.aspx");
        }

        protected void up_click(object sender, EventArgs e)
        {
            cn.Open();
            cmd.Connection = cn;
            cmd = new SqlCommand("up_empdata",cn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id", Session["id"]);
            cmd.Parameters.AddWithValue("@name", txtname.Text);
            cmd.Parameters.AddWithValue("@email", txtemail.Text);
            cmd.Parameters.AddWithValue("@mob", txtmob.Text);
            cmd.Parameters.AddWithValue("@designation", DropDownList1.SelectedItem.Value);
            cmd.Parameters.AddWithValue("@dob", txtdob.Text);
            cmd.Parameters.AddWithValue("@salary", txtsal.Text);
            cmd.Parameters.AddWithValue("@address", txtaddress.Text);
            if (radgenm.Checked)
            {
                cmd.Parameters.AddWithValue("@gender", radgenm.Text);
            }
            else
            {
                cmd.Parameters.AddWithValue("@gender", radgenf.Text);
            }
            int i = cmd.ExecuteNonQuery();
            Response.Write("update record" + i);
            cmd.Dispose();
            cn.Close();
            refreshdata();
            clear();
        }
        protected void can_click(object sender, EventArgs e)
        {

            Response.Redirect("displayemp.aspx");
        }
        protected void getemp_Click(object sender, EventArgs e)
        {
            int id =Convert.ToInt32(getemp.Text);
            cn.Open();
            cmd.Connection = cn;
            cmd = new SqlCommand("getempbyid",cn);
            cmd.CommandType= CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id", id);
            dr=cmd.ExecuteReader();
            if (dr.Read())
            {
                uptable.Visible = true;
                rowid.Visible = true;
                Labeldeg.Visible = true;
                txtid.Text = dr["id"].ToString();
                txtname.Text = dr[1].ToString();
                txtemail.Text = dr[2].ToString();
                txtmob.Text = dr[3].ToString();
                Labeldeg.Text = dr[4].ToString();
                    string d= dr[5].ToString();
                txtdob.Text= DateTime.Parse(d).ToString("yyyy-MM-dd");
                txtsal.Text = dr[6].ToString();
                txtaddress.Text = dr[7].ToString();
                string gender =dr[8].ToString();
                if (gender == "Male")
                {
                    radgenm.Checked = true;
                }
                else { radgenf.Checked = true; }

            }
            btnup.Visible = false;
            btncan.Visible = false;
            DropDownList1.Visible = false;
            cn.Close();
            cmd.Dispose();

        }
        protected void edit_Click(object sender, EventArgs e)
        {
           
            Response.Redirect("update.aspx");
        }
    }
}