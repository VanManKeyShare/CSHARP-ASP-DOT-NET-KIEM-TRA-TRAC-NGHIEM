using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;

namespace KiemTraKienThuc
{
    public partial class TrangChu : System.Web.UI.Page
    {
        public string Sql_Connection_String = @"Data Source=.\SQLEXPRESS;Initial Catalog=KiemTraKienThuc;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            thong_bao_loi.Text = "";

            if (!IsPostBack)
            {
                string sql_query = "select * from bai_kiem_tra";
                DataTable dt = new DataTable();
                SqlConnection sqlconn = new SqlConnection(Sql_Connection_String);
                try
                {
                    sqlconn.Open();
                    SqlCommand sqlcmd = new SqlCommand(sql_query, sqlconn);
                    SqlDataReader sqlreader = sqlcmd.ExecuteReader();
                    dt.Load(sqlreader);
                    sqlconn.Close();

                    repeater_danh_sach_bai_kiem_tra.DataSource = dt;
                    repeater_danh_sach_bai_kiem_tra.DataBind();
                }
                catch (Exception ex)
                {
                    thong_bao_loi.Text = "TRUY CẬP CSDL KHÔNG THÀNH CÔNG. LỖI CHI TIẾT" + "<br/><br/>" + "\r\n\r\n" + ex.ToString();
                    return;
                }
            }
        }

        protected void btn_mo_bai_kt_Click(object sender, CommandEventArgs e)
        {
            string id_bai_kiem_tra = e.CommandArgument.ToString();

            if (id_bai_kiem_tra != "")
            {
                string sql_query = "select * from cau_hoi where id_bai_kt = @id_bai_kt order by stt asc";
                DataTable dt = new DataTable();
                SqlConnection sqlconn = new SqlConnection(Sql_Connection_String);
                try
                {
                    sqlconn.Open();
                    SqlCommand sqlcmd = new SqlCommand(sql_query, sqlconn);
                    sqlcmd.Parameters.AddWithValue("@id_bai_kt", id_bai_kiem_tra);
                    SqlDataReader sqlreader = sqlcmd.ExecuteReader();
                    dt.Load(sqlreader);
                    sqlconn.Close();

                    if (dt.Rows.Count != 0)
                    {
                        panel_danh_sach_cau_hoi.Visible = true;
                        panel_danh_sach_bai_kiem_tra.Visible = false;

                        id_bai_kt.Value = id_bai_kiem_tra;

                        for (int i = 0; i < dt.Rows.Count; i++)
                        {
                            ds_id_cau_hoi.Value += dt.Rows[i]["id"].ToString() + " ";
                        }
                        ds_id_cau_hoi.Value = ds_id_cau_hoi.Value.Trim();

                        repeater_danh_sach_cau_hoi.DataSource = dt;
                        repeater_danh_sach_cau_hoi.DataBind();
                    }
                    else
                    {
                        thong_bao_loi.Text = "Danh sách câu hỏi của bài kiểm tra này hiện đang rỗng, xin bạn chọn câu khác.<br/><br/>";
                        return;
                    }
                }
                catch (Exception ex)
                {
                    thong_bao_loi.Text = "TRUY CẬP CSDL KHÔNG THÀNH CÔNG. LỖI CHI TIẾT" + "<br/><br/>" + "\r\n\r\n" + ex.ToString();
                    return;
                }
            }
        }

        protected void repeater_danh_sach_cau_hoi_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            HiddenField id_cau_hoi = (HiddenField)e.Item.FindControl("id_cau_hoi");

            if (id_cau_hoi == null) { return; }
            if (id_cau_hoi.Value.ToString() == "") { return; }

            string sql_query = "select * from cau_tra_loi where id_cau_hoi = @id_cau_hoi order by stt asc";
            DataTable dt = new DataTable();
            SqlConnection sqlconn = new SqlConnection(Sql_Connection_String);
            try
            {
                sqlconn.Open();
                SqlCommand sqlcmd = new SqlCommand(sql_query, sqlconn);
                sqlcmd.Parameters.AddWithValue("@id_cau_hoi", id_cau_hoi.Value.ToString());
                SqlDataReader sqlreader = sqlcmd.ExecuteReader();
                dt.Load(sqlreader);
                sqlconn.Close();

                if (dt.Rows.Count != 0)
                {
                    Repeater r2 = (Repeater)e.Item.FindControl("repeater_danh_sach_cau_tra_loi");
                    r2.DataSource = dt;
                    r2.DataBind();
                }
            }
            catch (Exception ex)
            {
                thong_bao_loi.Text = "TRUY CẬP CSDL KHÔNG THÀNH CÔNG. LỖI CHI TIẾT" + "<br/><br/>" + "\r\n\r\n" + ex.ToString();
                return;
            }
        }

        private double Lay_Diem(int id_bai_kt, int id_cau_hoi, int id_cau_tra_loi)
        {
            double diem = 0;

            string sql_query = "select cau_hoi.stt, cau_hoi.id_bai_kt as id_bai_kt, cau_hoi.id as id_cau_hoi, cau_tra_loi.id as id_cau_tra_loi, cau_hoi.diem";
            sql_query += "\r\n";
            sql_query += "from cau_hoi, cau_tra_loi";
            sql_query += "\r\n";
            sql_query += "where cau_hoi.id = cau_tra_loi.id_cau_hoi";
            sql_query += "\r\n";
            sql_query += "and cau_hoi.id_bai_kt = @id_bai_kt";
            sql_query += "\r\n";
            sql_query += "and cau_hoi.id = @id_cau_hoi";
            sql_query += "\r\n";
            sql_query += "and cau_tra_loi.id = @id_cau_tra_loi";
            sql_query += "\r\n";
            sql_query += "and cau_tra_loi.dap_an_dung = 1";
            sql_query += "\r\n";
            sql_query += "order by cau_hoi.stt asc";

            DataTable dt = new DataTable();
            SqlConnection sqlconn = new SqlConnection(Sql_Connection_String);
            try
            {
                sqlconn.Open();
                SqlCommand sqlcmd = new SqlCommand(sql_query, sqlconn);
                sqlcmd.Parameters.AddWithValue("@id_bai_kt", id_bai_kt);
                sqlcmd.Parameters.AddWithValue("@id_cau_hoi", id_cau_hoi);
                sqlcmd.Parameters.AddWithValue("@id_cau_tra_loi", id_cau_tra_loi);
                SqlDataReader sqlreader = sqlcmd.ExecuteReader();
                dt.Load(sqlreader);
                sqlconn.Close();

                if (dt.Rows.Count == 0)
                {
                    diem = 0;
                }
                else
                {
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        diem += double.Parse(dt.Rows[i][4].ToString());
                    }
                }
            }
            catch (Exception ex)
            {
                thong_bao_loi.Text = "TRUY CẬP CSDL KHÔNG THÀNH CÔNG. LỖI CHI TIẾT" + "<br/><br/>" + "\r\n\r\n" + ex.ToString();
                diem = 0;
            }

            return diem;
        }

        protected void btn_nop_bai_kt_Click(object sender, EventArgs e)
        {
            double tong_diem_dat_duoc = 0;

            if (id_bai_kt.Value.ToString() != "")
            {
                string[] danh_sach_id_cau_hoi_array = ds_id_cau_hoi.Value.ToString().Split(' ');
                if (danh_sach_id_cau_hoi_array.Length != 0)
                {
                    for (int i = 0; i < danh_sach_id_cau_hoi_array.Length; i++)
                    {
                        if (!string.IsNullOrEmpty(Request.Form["dap_an_cau_hoi[" + danh_sach_id_cau_hoi_array[i] + "]"]))
                        {
                            string id_cau_hoi = danh_sach_id_cau_hoi_array[i];
                            string id_cau_tra_loi = Request.Form["dap_an_cau_hoi[" + id_cau_hoi + "]"];

                            double diem = Lay_Diem(int.Parse(id_bai_kt.Value.ToString()), int.Parse(id_cau_hoi), int.Parse(id_cau_tra_loi));

                            if (diem == 0)
                            {
                                Response.Write("Câu " + (i + 1) + " - Sai <br/>");
                            }
                            else
                            {
                                Response.Write("Câu " + (i + 1) + " - Đúng. Bạn đạt được " + diem + " điểm <br/>");
                                tong_diem_dat_duoc = tong_diem_dat_duoc + diem;
                            }
                        }
                    }

                    Response.Write("<br/>Tổng điểm bài kiểm tra là : " + tong_diem_dat_duoc + " điểm. <br/><br/>");

                    ShowCauHoiVaDapAn(id_bai_kt.Value.ToString());
                }
            }
        }

        protected void ShowCauHoiVaDapAn(string id_bai_kt)
        {
            string sql_query = "select * from cau_hoi where id_bai_kt = @id_bai_kt order by stt asc";
            DataTable dt = new DataTable();
            SqlConnection sqlconn = new SqlConnection(Sql_Connection_String);
            try
            {
                sqlconn.Open();
                SqlCommand sqlcmd = new SqlCommand(sql_query, sqlconn);
                sqlcmd.Parameters.AddWithValue("@id_bai_kt", id_bai_kt);
                SqlDataReader sqlreader = sqlcmd.ExecuteReader();
                dt.Load(sqlreader);
                sqlconn.Close();

                if (dt.Rows.Count != 0)
                {
                    panel_show_dap_an.Visible = true;
                    panel_danh_sach_cau_hoi.Visible = false;

                    repeater_danh_sach_cau_hoi_show_dap_an.DataSource = dt;
                    repeater_danh_sach_cau_hoi_show_dap_an.DataBind();
                }
                else
                {
                    thong_bao_loi.Text = "Danh sách câu hỏi của bài kiểm tra này hiện đang rỗng, xin bạn chọn câu khác.<br/><br/>";
                    return;
                }
            }
            catch (Exception ex)
            {
                thong_bao_loi.Text = "TRUY CẬP CSDL KHÔNG THÀNH CÔNG. LỖI CHI TIẾT" + "<br/><br/>" + "\r\n\r\n" + ex.ToString();
                return;
            }
        }

        protected void repeater_danh_sach_cau_hoi_show_dap_an_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            HiddenField id_cau_hoi = (HiddenField)e.Item.FindControl("id_cau_hoi");

            if (id_cau_hoi == null) { return; }
            if (id_cau_hoi.Value.ToString() == "") { return; }

            string sql_query = "select * from cau_tra_loi where id_cau_hoi = @id_cau_hoi order by stt asc";
            DataTable dt = new DataTable();
            SqlConnection sqlconn = new SqlConnection(Sql_Connection_String);
            try
            {
                sqlconn.Open();
                SqlCommand sqlcmd = new SqlCommand(sql_query, sqlconn);
                sqlcmd.Parameters.AddWithValue("@id_cau_hoi", id_cau_hoi.Value.ToString());
                SqlDataReader sqlreader = sqlcmd.ExecuteReader();
                dt.Load(sqlreader);
                sqlconn.Close();

                if (dt.Rows.Count != 0)
                {
                    Repeater r2 = (Repeater)e.Item.FindControl("repeater_danh_sach_cau_tra_loi");
                    r2.DataSource = dt;
                    r2.DataBind();
                }
            }
            catch (Exception ex)
            {
                thong_bao_loi.Text = "TRUY CẬP CSDL KHÔNG THÀNH CÔNG. LỖI CHI TIẾT" + "<br/><br/>" + "\r\n\r\n" + ex.ToString();
                return;
            }
        }

    }
}