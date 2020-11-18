<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="WebForm.Views.Admin" MasterPageFile="~/Site.Master" %>

<asp:Content ContentPlaceHolderID="Header" runat="server">
    <title>Quản trị</title>
</asp:Content>
<asp:Content ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <div style="background-color: #ecf0f1; color: #055699; border-bottom: none; font-weight: 600; border-left: 3px solid #055699; padding: 10px">
            Danh sách user
        </div>
        <asp:ListView ID="lvUser" runat="server" GroupPlaceholderID="groupPlaceHolder1"
            ItemPlaceholderID="itemPlaceHolder1" OnPagePropertiesChanging="lvUser_PagePropertiesChanging">
            <LayoutTemplate>
                <table cellpadding="0" cellspacing="0" style="width:100%">
                    <tr>
                        <th>Mã tài khoản
                        </th>
                        <th>Tên tài khoản
                        </th>
                        <th>Ngày tham gia
                        </th>
                        <th>Số lượng tin
                        </th>
                         <th>Tin hoạt động
                        </th>
                         <th>Tin đã đóng
                        </th>
                    </tr>
                    <asp:PlaceHolder runat="server" ID="groupPlaceHolder1"></asp:PlaceHolder>
                    <tr>
                        <td colspan="3">
                            <asp:DataPager ID="DataPagerUser" runat="server" PagedControlID="lvUser" PageSize="10">
                                <Fields>
                                    <asp:NextPreviousPagerField ButtonType="Link" ShowFirstPageButton="false" ShowPreviousPageButton="true"
                                        ShowNextPageButton="false" />
                                    <asp:NumericPagerField ButtonType="Link" />
                                    <asp:NextPreviousPagerField ButtonType="Link" ShowNextPageButton="true" ShowLastPageButton="false" ShowPreviousPageButton="false" />
                                </Fields>
                            </asp:DataPager>
                        </td>
                    </tr>
                </table>
            </LayoutTemplate>
            <GroupTemplate>
                <tr>
                    <asp:PlaceHolder runat="server" ID="itemPlaceHolder1"></asp:PlaceHolder>
                </tr>
            </GroupTemplate>
            <ItemTemplate>
                <td>
                    <%# Eval("Id") %>
                </td>
                <td>
                    <%# Eval("UserName") %>
                </td>
                <td>
                    <%# Eval("RegistrationDate") %>
                </td>
                <td>
                    <%# Eval("TotalPost") %>
                </td>
                <td>
                    <%# Eval("PostActive") %>
                </td>
                <td>
                    <%# Eval("PostClosed") %>
                </td>
            </ItemTemplate>
        </asp:ListView>

    </div>
    <div>
        <div style="background-color: #ecf0f1; color: #055699; border-bottom: none; font-weight: 600; border-left: 3px solid #055699; padding: 10px">
            Danh sách tin được xem nhiều
        </div>
        <asp:ListView ID="lvPost" runat="server" GroupPlaceholderID="groupPlaceHolder1"
            ItemPlaceholderID="itemPlaceHolder1" OnPagePropertiesChanging="lvPost_PagePropertiesChanging">
            <LayoutTemplate>
                <table cellpadding="0" cellspacing="0" style="width:100%">
                    <tr>
                        <th>Mã tin
                        </th>
                        <th>Tiêu đề
                        </th>
                        <th>Ngày đăng
                        </th>
                        <th>Số lượt xem
                        </th>
                        <th>Tên tài khoản
                        </th>
                    </tr>
                    <asp:PlaceHolder runat="server" ID="groupPlaceHolder1"></asp:PlaceHolder>
                    <tr>
                        <td colspan="3">
                            <asp:DataPager ID="DataPagerPost" runat="server" PagedControlID="lvPost" PageSize="10">
                                <Fields>
                                    <asp:NextPreviousPagerField ButtonType="Link" ShowFirstPageButton="false" ShowPreviousPageButton="true"
                                        ShowNextPageButton="false" />
                                    <asp:NumericPagerField ButtonType="Link" />
                                    <asp:NextPreviousPagerField ButtonType="Link" ShowNextPageButton="true" ShowLastPageButton="false" ShowPreviousPageButton="false" />
                                </Fields>
                            </asp:DataPager>
                        </td>
                    </tr>
                </table>
            </LayoutTemplate>
            <GroupTemplate>
                <tr>
                    <asp:PlaceHolder runat="server" ID="itemPlaceHolder1"></asp:PlaceHolder>
                </tr>
            </GroupTemplate>
            <ItemTemplate>
                <td>
                    <%# Eval("Id") %>
                </td>
                <td>
                    <%# Eval("Title") %>
                </td>
                <td>
                    <%# Eval("PostedDate") %>
                </td>
                <td>
                    <%# Eval("CountView") %>
                </td>
                <td>
                    <%# Eval("UserName") %>
                </td>
            </ItemTemplate>
        </asp:ListView>

    </div>
</asp:Content>
