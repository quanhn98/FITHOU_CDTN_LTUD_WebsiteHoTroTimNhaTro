<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="WebForm.Views.ChangePassword" %>
<asp:Content ID="Header" ContentPlaceHolderID="Header" runat="server">
    <title>Đổi mật khẩu</title>
</asp:Content>
<asp:Content ContentPlaceHolderID="MainContent" runat="server">
   <p id="notice" runat="server" style="color: red; text-align: center"></p>
    <section class="formLogin">
            <h3>Đổi mật khẩu</h3>
            <hr>
            <div>
                <table style="width: 100%; margin-bottom: 20px">
                    <tr>
                        <td style="text-align: right">
                            <h4 class="lbLogin">Mật khẩu cũ : </h4>
                        </td>
                        <td>
                            <asp:TextBox ID="tbPasswordOld" runat="server" TextMode="Password" MaxLength="8" ClientIDMode="Static"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="tbPasswordOld" Text="* Password cũ không được bỏ trống" Display="Dynamic" ForeColor="Red" >
                            </asp:RequiredFieldValidator>
                        </td>
                    </tr>
                     <tr>
                        <td style="text-align: right">
                            <h4 class="lbLogin">Mật khẩu mới : </h4>
                        </td>
                        <td>
                            <asp:TextBox ID="tbNewPass" runat="server" TextMode="Password" MaxLength="8" onkeyup='check();' ClientIDMode="Static"></asp:TextBox>
                        </td>
                    </tr>
                     <tr>
                        <td style="text-align: right">
                        </td>
                        <td>
                            <span id="newPassMessage">

                            </span>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="tbNewPass" Text="* Nhập mật khẩu mới" Display="Dynamic" ForeColor="Red">
                            </asp:RequiredFieldValidator>
                        </td>
                    </tr>
                     <tr>
                        <td style="text-align: right">
                            <h4 class="lbLogin">Nhập lại mật khẩu mới : </h4>
                        </td>
                        <td>
                            <asp:TextBox ID="tbNewPassCf" runat="server" TextMode="Password" MaxLength="8" ClientIDMode="Static" onkeyup='checkCf();'></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right">
                        </td>
                        <td>
                             <span id="newPassCfMessage">

                            </span>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="tbNewPassCf" Text="*Nhập lại mật khẩu mới" Display="Dynamic" ForeColor="Red">
                            </asp:RequiredFieldValidator>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="">
                <asp:Button ID="btnUpdate" runat="server" Text="Cập nhật" OnClick="btnUpdate_Click" ClientIDMode="Static"/>
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
        var btnUpdate = document.getElementById("btnUpdate");
        var newPassMessage = document.getElementById("newPassMessage");
        var newPassCfMessage = document.getElementById("newPassCfMessage");
        var oldPasss = document.getElementById("tbPasswordOld");
        var tbNewPass = document.getElementById("tbNewPass");
        var tbNewPassCf = document.getElementById("tbNewPassCf");
        function check() {
            if (oldPasss.value.trim() === tbNewPass.value.trim()) {
                newPassMessage.innerText = "Mật khẩu mới phải khác mật khẩu cũ";
                btnUpdate.disabled = true;
                return;
            } else {
                newPassMessage.innerText = "";
                btnUpdate.disabled = false;
            }
            if (tbNewPass.value.trim() !== tbNewPassCf.value.trim()) {
                newPassCfMessage.innerText = "Nhập lại mật khẩu không khớp";
                btnUpdate.disabled = true;
                return;
            } else {
                newPassCfMessage.innerText = "";
                btnUpdate.disabled = false;
            }
        }
        function checkCf() {
            if (tbNewPass.value.trim() !== tbNewPassCf.value.trim()) {
                newPassCfMessage.innerText = "Nhập lại mật khẩu không khớp";
                btnUpdate.disabled = true;
                return;
            } else {
                newPassCfMessage.innerText = "";
                btnUpdate.disabled = false;
            }
        }
        //var term = "sample1";
        //var re = new RegExp("^([a-z0-9]{5,})$");
        //if (re.test(term)) {
        //    console.log("Valid");
        //} else {
        //    console.log("Invalid");
        //}
    </script>
</asp:Content>