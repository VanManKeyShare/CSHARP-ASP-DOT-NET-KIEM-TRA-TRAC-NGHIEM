<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TrangChu.aspx.cs" Inherits="KiemTraKienThuc.TrangChu" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Trang Chủ</title>
</head>
<body>
<form id="Form1" runat="server">
<div>
    <asp:Label ID="thong_bao_loi" runat="server" Text=""></asp:Label>

    <asp:Panel ID="panel_danh_sach_bai_kiem_tra" runat="server">
        <asp:Repeater ID="repeater_danh_sach_bai_kiem_tra" runat="server">
            <HeaderTemplate>
                <table>
                <tr>
                    <td><div style="font-weight: bold;">Danh sách bài kiểm tra</div><br /></td>
                </tr>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td>
                        <div><%# Eval("ten_bai_kiem_tra") %></div>
                        <div><%# Eval("ghi_chu") %></div>
                        <div><asp:Button ID="btn_mo_bai_kt" runat="server" Text="Mở bài kiểm tra" OnCommand="btn_mo_bai_kt_Click" CommandArgument='<%# Eval("id") %>'/></div>
                        <br />
                    </td>
                </tr>
            </ItemTemplate>
            <FooterTemplate>
                </table>
            </FooterTemplate>
        </asp:Repeater>
    </asp:Panel>

    <asp:Panel ID="panel_danh_sach_cau_hoi" runat="server" Visible="false">
        <asp:HiddenField ID="id_bai_kt" runat="server" />
        <asp:HiddenField ID="ds_id_cau_hoi" runat="server" />
        <asp:Repeater ID="repeater_danh_sach_cau_hoi" runat="server" onitemdatabound="repeater_danh_sach_cau_hoi_ItemDataBound">
            <HeaderTemplate>
                <table>
                <tr>
                    <td><div style="font-weight: bold;">Danh sách cây hỏi</div><br /></td>
                </tr>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td>
                        <asp:HiddenField ID="id_cau_hoi" runat="server" Value='<%# Eval("id") %>' />
                        <%# Eval("tieu_de_cau_hoi")%> (<%# Eval("diem")%>) điểm
                        <br />
                        <%# Eval("noi_dung_cau_hoi") %>
                        <br />
                        <asp:Repeater ID="repeater_danh_sach_cau_tra_loi" runat="server">
                            <HeaderTemplate>
                                <table>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td><label><input type="radio" name="dap_an_cau_hoi[<%# Eval("id_cau_hoi") %>]" value='<%# Eval("id") %>'/><%# Eval("noi_dung_tra_loi_a") %></label></td>
                                </tr>
                            </ItemTemplate>
                            <FooterTemplate>
                                </table>
                            </FooterTemplate>
                        </asp:Repeater>
                        <br />
                    </td>
                </tr>
            </ItemTemplate>
            <FooterTemplate>
                </table>
            </FooterTemplate>
        </asp:Repeater>
        <br />
        <div><asp:Button ID="btn_nop_bai_kt" runat="server" Text="Nộp bài kiểm tra" onclick="btn_nop_bai_kt_Click"/></div>
    </asp:Panel>

    <asp:Panel ID="panel_show_dap_an" runat="server" Visible="false">
        <asp:Repeater ID="repeater_danh_sach_cau_hoi_show_dap_an" runat="server" onitemdatabound="repeater_danh_sach_cau_hoi_show_dap_an_ItemDataBound">
            <HeaderTemplate>
                <table>
                <tr>
                    <td><div style="font-weight: bold;">Danh sách cây hỏi</div><br /></td>
                </tr>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td>
                        <asp:HiddenField ID="id_cau_hoi" runat="server" Value='<%# Eval("id") %>' />
                        <%# Eval("tieu_de_cau_hoi")%> (<%# Eval("diem")%>) điểm
                        <br />
                        <%# Eval("noi_dung_cau_hoi") %>
                        <br />
                        <asp:Repeater ID="repeater_danh_sach_cau_tra_loi" runat="server">
                            <HeaderTemplate>
                                <table>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td><%# Eval("noi_dung_tra_loi_b") %></td>
                                </tr>
                            </ItemTemplate>
                            <FooterTemplate>
                                </table>
                            </FooterTemplate>
                        </asp:Repeater>
                        <br />
                    </td>
                </tr>
            </ItemTemplate>
            <FooterTemplate>
                </table>
            </FooterTemplate>
        </asp:Repeater>
    </asp:Panel>

</div>
</form>
</body>
</html>
