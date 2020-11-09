<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="NewPost.aspx.cs" Inherits="WebForm.Views.Public.NewPost" %>

<asp:Content ContentPlaceHolderID="Header" runat="server">
    <title>Tạo tin mới</title>
</asp:Content>
<asp:Content ContentPlaceHolderID="MainContent" runat="server">
    <div class="form-detail">
        <div class="main-field panel">
            <div class="panel-heading">
                Thông tin chính
            </div>
            <div class="panel-body">
                <div class="post-Item">
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
                    <textarea id="tbDes" runat="server" class="input-field" placeholder="Mô tả"></textarea>
                </div>
                <div class="post-Item">
                    <span>Giá : </span>
                    <asp:TextBox ID="tbPrice" runat="server" TextMode="Number" CssClass="input-field">

                    </asp:TextBox>
                </div>
            </div>
        </div>
        <div class="more-field panel" style="margin-top: 20px;">
            <div class="panel-heading">
                Ảnh và video
                <button name="btn-collapse" type="button" class="navigator-Collapse">
                    <i class="fa fa-sort-desc" aria-hidden="true"></i>
                </button>
            </div>
            <div class="panel-body hidden">
                <div class="post-Item">
                    <span>Ảnh/video</span>
                    <asp:FileUpload ID="upMedia" runat="server" AllowMultiple="true" ClientIDMode="Static" />
                </div>
                <div id="previewMedia" class="post-Item">
                </div>
            </div>
        </div>
        <div class="more-field panel" style="margin-top: 20px;">
            <div class="panel-heading">
                Mô tả thêm
                <button name="btn-collapse" type="button" class="navigator-Collapse">
                    <i class="fa fa-sort-desc" aria-hidden="true"></i>
                </button>
            </div>
            <div class="panel-body hidden">
                <div class="post-Item">
                    <span>Diện tích</span>
                    <asp:TextBox ID="tbAcreage" runat="server" CssClass="input-field">

                    </asp:TextBox>
                </div>
                <div class="post-Item">
                    <span>Giá điện</span>
                    <asp:TextBox ID="tbEprice" runat="server" TextMode="Number" CssClass="input-field">

                    </asp:TextBox>
                </div>
                <div class="post-Item">
                    <span>Giá nước</span>
                    <asp:TextBox ID="tbWprice" runat="server" TextMode="Number" CssClass="input-field">

                    </asp:TextBox>
                </div>
                <div class="post-Item">
                    <span>Số người tối đa</span>
                    <asp:TextBox ID="tbMaxmem" runat="server" TextMode="Number" CssClass="input-field">

                    </asp:TextBox>
                </div>
                <div class="post-Item">
                    <span>Chung chủ</span>
                    <asp:CheckBox ID="cbWithHost" runat="server" CssClass="input-field"></asp:CheckBox>
                </div>
                <div class="post-Item">
                    <span>Khép kín</span>
                    <asp:CheckBox ID="cbSelfContained" runat="server" CssClass="input-field"></asp:CheckBox>
                </div>
                <div class="post-Item">
                    <span>Địa chỉ</span>
                    <asp:TextBox ID="tbAddress" runat="server" CssClass="input-field">

                    </asp:TextBox>
                </div>
                <div class="post-Item">
                    <span>Tỉnh</span>
                    <asp:DropDownList ID="dlProvinceId" runat="server" onchange="ChangeProvince()">
                        <asp:ListItem Value="null" Text="Tỉnh thành" Selected="True"></asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="post-Item">
                    <span>Thành phố</span>
                    <asp:DropDownList ID="dlCityId" runat="server">
                    </asp:DropDownList>
                </div>
                <div class="post-Item">
                    <span>Quận</span>
                    <asp:DropDownList ID="dlDistrictId" runat="server">
                    </asp:DropDownList>
                </div>
                <div class="post-Item">
                    <span>Đường</span>
                    <asp:DropDownList ID="dlLineId" runat="server">
                    </asp:DropDownList>
                </div>
            </div>
        </div>
    </div>
    <div style="margin: 20px; text-align: center;">
        <asp:Button ID="btCreate" runat="server" Text="Tạo" OnClick="btCreate_Click" CssClass="btn" />
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
        }

        .input-field {
            width: 100%;
            height: 20px;
            line-height: 20px;
            padding: 5px;
            border-radius: 5px;
        }

        textarea .input-field {
            width: 100%;
        }

        select {
            height: 30px;
            width: 100%;
        }

        .post-Item {
            margin-bottom: 20px;
            display: flex;
        }

            .post-Item span {
                width: 50%;
            }

        .mediaItem {
            height: 50px;
            width: 100px;
            object-fit: contain;
            border: 1px solid;
            border-radius: 5px;
            margin: 10px;
        }

        .main-field {
            border: 1px solid;
            border-top: 0px;
        }

        .more-field {
            border: 1px solid;
            border-top: 0px;
        }

        .panel-heading {
            padding: 0px 10px;
            background: #055699;
            color: #FFF;
            height: 40px;
            line-height: 40px;
            font-size: 16px;
        }

        .panel-body {
            padding: 10px;
        }

        .btn {
            display: inline-block;
            margin-bottom: 0;
            font-weight: 400;
            text-align: center;
            vertical-align: middle;
            -ms-touch-action: manipulation;
            touch-action: manipulation;
            cursor: pointer;
            background-image: none;
            border: 1px solid transparent;
            white-space: nowrap;
            padding: 6px 12px;
            line-height: 1.5;
            border-radius: 4px;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
        }

        button.navigator-Collapse {
            float: right;
            margin-top: 10px;
        }

        .hidden {
            display: none !important;
        }
    </style>
    <script>
        var upMedia = document.getElementById("upMedia");
        var previewContainer = document.getElementById("previewMedia");
        var btnCollapse = document.getElementsByName("btn-collapse");
        console.log(btnCollapse);
        var mediaMetadata = [];
        for (var i = 0; i < btnCollapse.length; i++) {
            btnCollapse[i].onclick = function () {
                console.log(this);
                var panel = this.closest(".panel");
                var panelBody = panel.querySelector(".panel-body");
                var checkCollapse = panelBody.classList.contains("hidden");
                if (checkCollapse) {
                    panelBody.classList.remove("hidden");
                } else {
                    panelBody.classList.add("hidden");
                }
            }
        }
        function MediaObj(name, path) {
            this.Name = name,
                this.Path = path
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
            if (upMedia.files.length == 0) {
                previewContainer.innerHTML = "";
            }
            for (var i = 0; i < upMedia.files.length; i++) {
                var item = upMedia.files[i];
                console.log(item);

                var reader = new FileReader();
                reader.onload = function (e) {
                    var newPreview = document.createElement("img");
                    newPreview.className = "mediaItem";
                    newPreview.style.cssText = "";
                    newPreview.src = e.target.result;
                    previewContainer.appendChild(newPreview);
                }
                reader.readAsDataURL(item);
            }
        };
    </script>
</asp:Content>
