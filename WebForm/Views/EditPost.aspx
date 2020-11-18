<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditPost.aspx.cs" Inherits="WebForm.Views.Public.EditPost"  EnableEventValidation="false" %>

<asp:Content ContentPlaceHolderID="Header" runat="server">
    <title id="postTitle" runat="server"></title>
</asp:Content>
<asp:Content ContentPlaceHolderID="MainContent" runat="server">
    <div style="padding: 10px;">
        <h3 style="text-align: center">Sửa tin</h3>
        <div>
            <div style="background-color: #ecf0f1; color: #055699; border-bottom: none; font-weight: 600; border-left: 3px solid #055699; padding: 10px">
                Nhập thông tin chi tiết 
            </div>
            <div style="display: flex">
                <div style="flex-grow: 1; flex-basis: auto; padding: 10px; width: 50%">
                    <div style="">
                        <h4>Tiêu đề</h4>
                        <div>
                            <asp:TextBox ID="tbTitle" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator
                                ID="rfvTitle"
                                ControlToValidate="tbTitle"
                                ErrorMessage="Tiêu đề không được để trống"
                                Display="Dynamic"
                                runat="server" ForeColor="Red">
                            * Tiêu đề không được để trống
                            </asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div style="">
                        <h4>Mô tả</h4>
                        <div>
                            <textarea id="tbDes" runat="server" class="form-control" style="width: 100%"></textarea>
                        </div>
                    </div>
                    <div style="display: flex">
                        <div style="flex-grow: 1; flex-basis: 0; padding-right: 15px; width: 50%">
                            <h4>Giá</h4>
                            <div>
                                <asp:TextBox ID="tbPrice" runat="server" CssClass="form-control" TextMode="Number" ToolTip="Đơn vị nghìn đồng"></asp:TextBox>
                                <asp:RequiredFieldValidator
                                    ID="RequiredFieldValidator2"
                                    ControlToValidate="tbPrice"
                                    ErrorMessage="Giá không được để trống"
                                    Display="Dynamic"
                                    runat="server" ForeColor="Red">
                            * Giá không được để trống
                                </asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div style="flex-grow: 1; flex-basis: 0; padding-left: 15px">
                            <h4>Diện tích</h4>
                            <div>
                                <asp:TextBox ID="tbAcreage" runat="server" CssClass="form-control" TextMode="Number" ToolTip="Đơn vị m2"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                </div>
                <div style="flex-grow: 1; flex-basis: auto; padding: 10px; width: 50%">
                    <div style="display: flex">
                        <div style="flex-grow: 1; flex-basis: auto; padding-right: 15px">
                            <h4>Thành phố</h4>
                            <div>
                                <asp:DropDownList ID="dlCityId" runat="server" CssClass="form-control" ClientIDMode="Static">
                                     <asp:ListItem Text="---Thành phố---" Value=""></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div style="flex-grow: 1; flex-basis: auto; padding-left: 15px">
                            <h4>Quận</h4>
                            <div>
                                <asp:DropDownList ID="dlDistrictId" runat="server" CssClass="form-control" ClientIDMode="Static">
                                     <asp:ListItem Text="---Quận huyện---" Value=""></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                    </div>
                    <div>
                        <h4>Đường/Phố</h4>
                        <div>
                            <asp:DropDownList ID="dlLineId" runat="server" CssClass="form-control" ClientIDMode="Static">
                                 <asp:ListItem Text="---Đường phố---" Value=""></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div>
                        <h4>Địa chỉ cụ thể</h4>
                        <div>
                            <asp:TextBox ID="tbAddress" runat="server" CssClass="form-control">
                            </asp:TextBox>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div>
            <div style="background-color: #ecf0f1; color: #055699; border-bottom: none; font-weight: 600; border-left: 3px solid #055699; padding: 10px">
                Thông tin bổ sung
            </div>
            <div style="display: flex">
                <div style="flex-grow: 1; flex-basis: auto; padding: 10px; width: 50%">
                    <div>
                        <h4>Giá điện</h4>
                        <div>
                            <asp:TextBox ID="tbEprice" TextMode="Number" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                    <div>
                        <h4>Giá nước</h4>
                        <div>
                            <asp:TextBox ID="tbWprice" TextMode="Number" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                    <div>
                        <h4>Số thành viên tối đa</h4>
                        <div>
                            <asp:TextBox ID="tbMaxmem" TextMode="Number" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <div style="flex-grow: 1; flex-basis: auto; padding: 10px; width: 50%">
                    <div style="background: #ecf0f1; padding: 50px;">
                        <div class="" style="width: 50%; display: inline;">
                            <asp:CheckBox ID="cbWithHost" runat="server"></asp:CheckBox>
                            <label for="dexe">Chung chủ </label>
                        </div>
                        <div class="" style="width: 50%; display: inline;">
                            <asp:CheckBox ID="cbSelfContained" runat="server"></asp:CheckBox>
                            <label for="dexe">Khép kín </label>
                        </div>
                    </div>
                    <div>
                        <h4>Số điện thoại</h4>
                        <div>
                            <asp:TextBox ID="tbPhoneNumber" TextMode="Number" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                </div>
            </div>
            <div style="display: flex">
                <div style="flex-grow: 1; flex-basis: auto; padding: 10px; width: 50%">
                    <h4>Ảnh</h4>
                    <div>
                        <asp:FileUpload ID="upMedia" runat="server" AllowMultiple="true" ClientIDMode="Static" />
                        <div id="previewMedia" class="post-Item"></div>
                    </div>
                </div>
                <div style="flex-grow: 1; flex-basis: auto; padding: 10px; width: 50%">
                    <h4>Định vị</h4>
                    <div>
                        <div id="map" style="height:400px">
                        </div>
                    </div>
                </div>
            </div>
            <asp:TextBox ID="tbCoordinatesX" runat="server" ClientIDMode="Static" CssClass="hidden"/>
            <asp:TextBox ID="tbCoordinatesY" runat="server" ClientIDMode="Static" CssClass="hidden"/>
            <asp:TextBox ID="PostId" runat="server" CssClass="hidden"></asp:TextBox>
        </div>
    </div>

    <div style="margin: 20px; text-align: center;">
        <asp:Button ID="btnBack" runat="server" Text="Trờ về" OnClick="btnBack_Click" CssClass="btn" />
        <asp:Button ID="btnUpdate" runat="server" Text="Cập nhật" OnClick="btnUpdate_Click" CssClass="btn" />
    </div>
    <style>
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
    </style>
    <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false"></script>
    <script>
        var upMedia = document.getElementById("upMedia");
        var previewContainer = document.getElementById("previewMedia");
        var btnCollapse = document.getElementsByName("btn-collapse");
        var map = document.getElementById("map");
        var tbCoordinatesX = document.getElementById("tbCoordinatesX");
        var tbCoordinatesY = document.getElementById("tbCoordinatesY");
        var dlCityId = document.getElementById("dlCityId");
        var dlDistrictId = document.getElementById("dlDistrictId");
        var dlLineId = document.getElementById("dlLineId");
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
        dlCityId.addEventListener("change", function () {
            var xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function () {
                if (this.readyState == 4 && this.status == 200) {
                    var m = this.responseText;
                    console.log(m);
                    BindDistrictSelect(this.responseText);
                }
            };
            var params = JSON.stringify({ cityId: this.value });
            xhttp.open("POST", "/Views/TestAjax.aspx/GetDistrict");
            xhttp.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
            xhttp.send(params);
        });
        function BindDistrictSelect(data) {
            dlDistrictId.innerHTML = "";
            dlLineId.innerHTML = "";
            dlLineId.appendChild(new Option("---Đường phố---", ""));
            var dataJson = JSON.parse(data);
            dataJson = JSON.parse(dataJson.d);
            dlDistrictId.appendChild(new Option("---Quận huyện---", ""));
            for (var i = 0; i < dataJson.length; i++) {
                dlDistrictId.appendChild(new Option(dataJson[i].Name, dataJson[i].Id));
            }
        }
        dlDistrictId.addEventListener("change", function () {
            var xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function () {
                if (this.readyState == 4 && this.status == 200) {
                    var m = this.responseText;
                    console.log(m);
                    BindLineSelect(this.responseText);
                }
            };
            var params = JSON.stringify({ districtId: this.value });
            xhttp.open("POST", "/Views/TestAjax.aspx/GetLine");
            xhttp.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
            xhttp.send(params);
        });
        function BindLineSelect(data) {
            dlLineId.innerHTML = "";
            var dataJson = JSON.parse(data);
            dataJson = JSON.parse(dataJson.d);
            dlLineId.appendChild(new Option("---Đường phố---", ""));
            for (var i = 0; i < dataJson.length; i++) {
                dlLineId.appendChild(new Option(dataJson[i].Name, dataJson[i].Id));
            }
        }
        InitMap();
        function InitMap() {
            var mapOptions = {
                center: new google.maps.LatLng(tbCoordinatesX.value, tbCoordinatesY.value),
                zoom: 15,
                mapTypeId: google.maps.MapTypeId.ROADMAP
            };
            var mapD = new google.maps.Map(map, mapOptions);
            var markerDefault = new google.maps.Marker({
                position: new google.maps.LatLng(tbCoordinatesX.value, tbCoordinatesY.value),
                map: mapD,
                draggable: true,
                title: "Drag me!"
            });
            var latlng = new google.maps.LatLng(-34.397, 150.644);
            var mapOptions = {
                zoom: 5,
                center: latlng
            }
            google.maps.event.addListener(markerDefault, 'dragend', function (event) {
                tbCoordinatesX.value = event.latLng.lat();
                tbCoordinatesY.value = event.latLng.lng();
            });
        }
    </script>
</asp:Content>