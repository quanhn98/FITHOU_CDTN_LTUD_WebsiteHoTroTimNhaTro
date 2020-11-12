<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="WebForm.Views.Public.SignUp" %>
<asp:Content ID="Header" ContentPlaceHolderID="Header" runat="server">
    <title>Đăng kí</title>
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <p id="notice" runat="server" style="color: red; text-align: center"></p>
    <section class="formLogin">
            <h3>Đăng kí</h3>
            <hr>
            <div>
                <table style="width: 100%; margin-bottom: 20px">
                    <tr>
                        <td style="text-align: right">
                            <h4 class="lbLogin">Tên đăng nhập : </h4>
                        </td>
                        <td>
                            <asp:TextBox ID="tbUserName" runat="server" EnableViewState="true"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="tbUserName" Text="* Username không được bỏ trống" Display="Dynamic" ForeColor="Red">
                            </asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right">
                            <h4 class="lbLogin">Mật khẩu : </h4>
                        </td>
                        <td>
                            <asp:TextBox ID="tbPassword" runat="server" TextMode="Password" MaxLength="8"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="tbPassword" Text="* Password không được bỏ trống" Display="Dynamic" ForeColor="Red">
                            </asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right">
                            <h4 class="lbLogin">Số điện thoại : </h4>
                        </td>
                        <td>
                            <asp:TextBox ID="tbPhoneNumber" runat="server" TextMode="Number" MaxLength="10"></asp:TextBox>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="">
                <asp:Button ID="btSignUp" runat="server" Text="Đăng kí" OnClick="btSignUp_Click" />
            </div>
    </section>
    <style>
        .formLogin {
            position: absolute;
            top: 50%;
            left: 50%;
            margin-top: -200px;
            margin-left: -250px;
            width: 500px;
            height: max-content;
            border: 1px solid #e2dede;
            border-radius: 10px;
            text-align: center;
        }

            .formLogin > div {
                margin: 30px 0px;
            }

        .lbLogin {
        }
    </style>
</asp:Content>
