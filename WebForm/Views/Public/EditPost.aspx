<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="NewPost.aspx.cs" Inherits="WebForm.Views.Public.NewPost" %>

<asp:Content ContentPlaceHolderID="Header" runat="server">
    <title id="postName" runat="server"></title>
</asp:Content>
<asp:Content ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <h3>Tạo tin</h3>
    </div>
    <hr />
    <div class="form-detail">
        <div class="main-field">
            <div class="post-Item">
                <h4>Tiêu đề</h4>
                <asp:TextBox ID="tbTitle" runat="server" CssClass="input-field">

                </asp:TextBox>
                <asp:RequiredFieldValidator
                    ID="rfvTitle"
                    ControlToValidate="tbTitle"
                    ErrorMessage="Tiêu đề không được để trống"
                    Display="Dynamic"
                    runat="server" ForeColor="Red">
                            * Tiêu đề không được để trống
                </asp:RequiredFieldValidator>
            </div>
            <div class="post-Item">
                <h4>Mô tả</h4>
                <textarea id="tbDes" runat="server" class="input-field">
                </textarea>
            </div>
            <div class="post-Item">
                <h4>Giá</h4>
                <asp:TextBox ID="tbPrice" runat="server" TextMode="Number" CssClass="input-field">

                </asp:TextBox>
            </div>
            <div class="post-Item">
                <h4>Ảnh/video</h4>
                <asp:FileUpload ID="upMedia" runat="server" AllowMultiple="true" ClientIDMode="Static" />
            </div>
            <div id="previewMedia" class="post-Item">
            </div>
        </div>
        <div>
            <button id="btnMoreField" type="button">Mô tả thêm</button>
        </div>
        <div id="more-field" class="more-field" style="display: none">
            <div class="post-Item">
            </div>
            <div class="post-Item">
                <h4>Diện tích</h4>
                <asp:TextBox ID="tbAcreage" runat="server" CssClass="input-field">

                </asp:TextBox>
            </div>
            <div class="post-Item">
                <h4>Giá điện</h4>
                <asp:TextBox ID="tbEprice" runat="server" TextMode="Number" CssClass="input-field">

                </asp:TextBox>
            </div>
            <div class="post-Item">
                <h4>Giá nước</h4>
                <asp:TextBox ID="tbWprice" runat="server" TextMode="Number" CssClass="input-field">

                </asp:TextBox>
            </div>
            <div class="post-Item">
                <h4>Số người tối đa</h4>
                <asp:TextBox ID="tbMaxmem" runat="server" TextMode="Number" CssClass="input-field">

                </asp:TextBox>
            </div>
            <div class="post-Item">
                <h4>Chung chủ</h4>
                <asp:CheckBox ID="cbWithHost" runat="server" CssClass="input-field"></asp:CheckBox>
            </div>
            <div class="post-Item">
                <h4>Khép kín</h4>
                <asp:CheckBox ID="cbSelfContained" runat="server" CssClass="input-field"></asp:CheckBox>
            </div>
            <div class="post-Item">
                <h4>Địa chỉ</h4>
                <asp:TextBox ID="tbAddress" runat="server" CssClass="input-field">

                </asp:TextBox>
            </div>
            <div class="post-Item">
                <h4>Tỉnh</h4>
                <asp:DropDownList ID="dlProvinceId" runat="server" onchange="ChangeProvince()">
                    <asp:ListItem Value="null" Text="Tỉnh thành" Selected="True"></asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="post-Item">
                <h4>Thành phố</h4>
                <asp:DropDownList ID="dlCityId" runat="server">
                </asp:DropDownList>
            </div>
            <div class="post-Item">
                <h4>Quận</h4>
                <asp:DropDownList ID="dlDistrictId" runat="server">
                </asp:DropDownList>
            </div>
            <div class="post-Item">
                <h4>Đường</h4>
                <asp:DropDownList ID="dlLineId" runat="server">
                </asp:DropDownList>
            </div>
        </div>
        <div class="post-Item" style="text-align: center">
            <asp:Button ID="btCreate" runat="server" Text="Tạo" OnClick="btCreate_Click" />

        </div>
    </div>
    <%--<asp:FileUpload ID="uploadFile" runat="server" AllowMultiple="true" />
    <asp:Button ID="btSubmit" runat="server" OnClick="btSubmit_Click" Text="Submit"/>
    <asp:Image runat="server" ID="test"/>
    <video height="300" width="400" id="video" runat="server" controls>
        <source type="video/mp4" src='<%= GetVideoLink() %>'/>
    </video>--%>
    <style>
        .form-detail {
            padding-left: 50px;
            padding-right: 50px;
            padding-top: 20px;
        }

        .input-field {
            width: 100%;
            height: 20px;
            line-height: 20px;
            padding: 5px;
        }

        textarea .input-field {
            width: 100%;
        }

        select {
            height: 50px;
            width: 100%;
        }

        .post-Item {
            margin-bottom: 20px;
        }
    </style>
    <script>
        var btnMoreField = document.getElementById("btnMoreField");
        var moreFieldContainer = document.getElementById("more-field");
        var upMedia = document.getElementById("upMedia");
        var previewContainer = document.getElementById("previewMedia");
        var mediaMetadata = [];
        function MediaObj(name,path) {
            this.Name = name,
            this.Path = path
        }
        btnMoreField.onclick = function () {
            moreFieldContainer.style.display = "initial";
            this.style.display = "none";
        }
        function ChangeProvince() {
            //var xhttp = new XMLHttpRequest();
            //xhttp.onreadystatechange = function () {
            //    if (this.readyState == 4 && this.status == 200) {
            //        alert(this.responseText);
            //    }
            //};
            //xhttp.open("GET", "TestAjax", true);
            //xhttp.send();

            //$('#MainContent_dlProvinceId').append(new Option('text', 'value'));
            //$('#MainContent_dlProvinceId').innerHTML = ""; // clear options
        }
        upMedia.onchange = function (e) {
            console.log(upMedia.files);
            if (upMedia.files.length == 0) {
                previewContainer.empty();
            }
            for (var i = 0; i < upMedia.files.length; i++) {
                console.log(upMedia.files[i]);
                //var item = upMedia.Files[i];
                //var newMedia = new MediaObj(item.name,upMedia.Files[i]);
                //if () {

                //} else {
                //}
            }
            //if (input.files && input.files[0]) {
            //    var reader = new FileReader();

            //    reader.onload = function (e) {
            //        $('#blah').attr('src', e.target.result);
            //    }

            //    reader.readAsDataURL(input.files[0]); // convert to base64 string
            //}
        };
    </script>
</asp:Content>
