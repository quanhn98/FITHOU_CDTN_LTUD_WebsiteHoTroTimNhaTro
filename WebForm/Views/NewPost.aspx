﻿<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="NewPost.aspx.cs" Inherits="WebForm.Views.Public.NewPost" %>

<asp:Content ContentPlaceHolderID="Header" runat="server">
    <title>Tạo tin mới</title>
</asp:Content>
<asp:Content ContentPlaceHolderID="MainContent" runat="server">
    <div style="padding: 10px;">
        <h3 style="text-align: center">Tạo tin</h3>
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
                                <asp:DropDownList ID="dlCityId" runat="server" CssClass="form-control">
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div style="flex-grow: 1; flex-basis: auto; padding-left: 15px">
                            <h4>Quận</h4>
                            <div>
                                <asp:DropDownList ID="dlDistrictId" runat="server" CssClass="form-control">
                                </asp:DropDownList>
                            </div>
                        </div>
                    </div>
                    <div>
                        <h4>Đường/Phố</h4>
                        <div>
                            <asp:DropDownList ID="dlLineId" runat="server" CssClass="form-control">
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
                </div>
            </div>
            <div style="display: flex">
                <div style="flex-grow: 1; flex-basis: auto; padding: 10px; width: 50%">
                    <h4>Media</h4>
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
        </div>
    </div>

    <div style="margin: 20px; text-align: center;">
        <asp:Button ID="btCreate" runat="server" Text="Tạo" OnClick="btCreate_Click" CssClass="btn" />
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
        InitMap();
        function InitMap() {
            tbCoordinatesX.value = 21.0278;
            tbCoordinatesY.value = 105.8342;
            var mapOptions = {
                center: new google.maps.LatLng(21.0278, 105.8342),
                zoom: 15,
                mapTypeId: google.maps.MapTypeId.ROADMAP
            };
            var mapD = new google.maps.Map(map, mapOptions);
            var markerDefault = new google.maps.Marker({
                position: new google.maps.LatLng(21.0278, 105.8342),
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