<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UpdateProfile.aspx.cs" Inherits="WebForm.Views.UpdateProfile" %>
<asp:Content ID="Header" ContentPlaceHolderID="Header" runat="server">
    <title>Cập nhật thông tin</title>
</asp:Content>
<asp:Content ContentPlaceHolderID="MainContent" runat="server">
   <p id="notice" runat="server" style="color: red; text-align: center"></p>
    <section class="formLogin">
            <h3>Thông tin</h3>
            <hr>
            <div>
                <table style="width: 100%; margin-bottom: 20px">
                    <tr>
                        <td style="text-align: right">
                            <h4 class="lbLogin">Họ và tên : </h4>
                        </td>
                        <td>
                            <asp:TextBox ID="tbFullName" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right">
                            <h4 class="lbLogin">Số điện thoại : </h4>
                        </td>
                        <td>
                            <asp:TextBox ID="tbPhoneNumber" runat="server" TextMode="Number" MaxLength="10"></asp:TextBox>
                        </td>
                        <td>
                            <asp:ValidationSummary runat="server" ControlToValidate="tbPhoneNumber" Text="* Số điện thoại không hợp lệ" Display="Dynamic" ForeColor="Red" 
                                ValidationExpression="^\+?\d{1,3}?[- .]?\(?(?:\d{2,3})\)?[- .]?\d\d\d[- .]?\d\d\d\d$">
                            </asp:ValidationSummary>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="">
                <asp:Button ID="btnUpdate" runat="server" Text="Cập nhật" OnClick="btnUpdate_Click" />
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
    <script>
        var term = "sample1";
        var re = new RegExp("^([a-z0-9]{5,})$");
        if (re.test(term)) {
            console.log("Valid");
        } else {
            console.log("Invalid");
        }
    </script>
</asp:Content>