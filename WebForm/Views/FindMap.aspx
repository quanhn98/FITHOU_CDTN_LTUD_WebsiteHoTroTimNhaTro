<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FindMap.aspx.cs" Inherits="WebForm.Views.FindMap" MasterPageFile="~/Site.Master" %>

<asp:Content ContentPlaceHolderID="Header" runat="server">
    <title id="DetailTitle" runat="server">Tìm kiếm trên bản đồ</title>
</asp:Content>
<asp:Content ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .main-content .container {
            width: 100% !important;
            display: flex;
        }
    </style>
    <style>
        .main-content .form-Filter {
            background: #ffdc9a;
            padding: 15px;
            border-radius: 5px;
            overflow: auto;
        }

        .main-content .search_title {
            font-size: 18px;
            font-weight: bold;
        }

        .main-content .search_field {
            padding: 0;
        }

        .main-content .search_field_item {
            float: left;
            margin-left: 5px;
            margin-bottom: 0;
            min-width: 135px;
        }

            .main-content .search_field_item.search_field_item_submit {
                width: 84px;
            }

            .main-content .search_field_item:first-of-type {
                margin-left: 0;
            }

        .main-content .btn_search_box {
            background: #ffa80f;
            color: #fff;
            border: 1px solid #ffa80f;
            height: 34px;
            border-radius: 3px;
        }

        .main-content .form-control {
            box-shadow: none;
            font-size: 12px;
            display: block;
            width: 100%;
            height: 34px;
            padding: 6px 12px;
            font-size: 12px;
            line-height: 22px;
            color: #000;
            vertical-align: middle;
            background-color: #fff;
            background-image: none;
            border: 0;
            border-radius: 2px;
            -webkit-box-shadow: none;
            box-shadow: none;
            -webkit-transition: border-color ease-in-out 0.15s, box-shadow ease-in-out 0.15s;
            transition: border-color ease-in-out 0.15s, box-shadow ease-in-out 0.15s;
        }

        .main-content .search_field_item_label {
            display: block;
            font-size: 0.9rem;
            font-weight: bold;
            margin: 0 0 3px;
        }

        .searchform .select2-container--open .select2-dropdown {
            z-index: 999999;
        }

        .searchform .select2-container .select2-selection--single {
            height: auto;
            border: 0;
        }

            .searchform
            .select2-container
            .select2-selection--single
            .select2-selection__rendered {
                display: block;
                width: 100%;
                height: 34px;
                padding: 6px 12px;
                font-size: 12px;
                line-height: 22px;
                color: #000;
                vertical-align: middle;
                background-color: #fff;
                background-image: none;
                border: 0;
                border-radius: 2px;
                -webkit-box-shadow: none;
                box-shadow: none;
                -webkit-transition: border-color ease-in-out 0.15s, box-shadow ease-in-out 0.15s;
                transition: border-color ease-in-out 0.15s, box-shadow ease-in-out 0.15s;
                box-sizing: border-box;
            }

            .searchform
            .select2-container
            .select2-selection--single
            .select2-selection__arrow {
                height: 34px;
            }
    </style>
    <div style="width: 40%">
        <div class="container" style="height: 100%; overflow:auto ;background-color: white; flex-direction: column;">
            <div class="form-Filter">
                <div class="search_field">
                    <div class="" style="display: flex;">
                        <div class="search_field_item search_field_item_tinhthanh">
                            <label class="search_field_item_label">Tỉnh thành</label>
                            <%--<select id="search_city" runat="server" class="form-control" name="" tabindex="-1" aria-hidden="true">
                        </select>--%>
                            <asp:DropDownList ID="search_city" runat="server" CssClass="form-control" ClientIDMode="Static">
                                <asp:ListItem Text="---Thành phố---" Value=""></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="search_field_item search_field_item_quanhuyen">
                            <label class="search_field_item_label">Quận huyện</label>
                            <%--<select id="search_district" runat="server" class="form-control" name="" data-current="" tabindex="-1" aria-hidden="true">
                        </select>--%>
                            <asp:DropDownList ID="search_district" runat="server" CssClass="form-control" ClientIDMode="Static">
                                <asp:ListItem Text="---Quận huyện---" Value=""></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="search_field_item search_field_item_duongpho">
                            <label class="search_field_item_label">Đường phố</label>
                            <%--<select name="search_line" class="form-control" data-current="" tabindex="-1" aria-hidden="true">
                        </select>--%>
                            <asp:DropDownList ID="search_line" runat="server" CssClass="form-control" ClientIDMode="Static">
                                <asp:ListItem Text="---Đường phố---" Value=""></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="search_field_item search_field_item_mucgia">
                            <label class="search_field_item_label">Khoảng giá</label>
                            <asp:DropDownList ID="search_price" runat="server" CssClass="form-control" ClientIDMode="Static">
                                <asp:ListItem Text="Chọn mức giá" Value="0"></asp:ListItem>
                                <asp:ListItem Text="Dưới 1 triệu" Value="1"></asp:ListItem>
                                <asp:ListItem Text="1 triệu - 2 triệu" Value="2"></asp:ListItem>
                                <asp:ListItem Text="2 triệu - 3 triệu" Value="3"></asp:ListItem>
                                <asp:ListItem Text="3 triệu - 4 triệu" Value="4"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="search_field_item search_field_item_dientich">
                            <label class="search_field_item_label">Diện tích</label>
                            <asp:DropDownList ID="search_acr" runat="server" CssClass="form-control" ClientIDMode="Static">
                                <asp:ListItem Text="Chọn diện tích" Value="0"></asp:ListItem>
                                <asp:ListItem Text="Dưới 20 m2" Value="1"></asp:ListItem>
                                <asp:ListItem Text="20 m2 - 30 m2" Value="2"></asp:ListItem>
                                <asp:ListItem Text="30 m2 - 40 m2" Value="3"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="" style="margin-left: 5px">
                            <label class="search_field_item_label">&nbsp;</label>
                            <button id="btn-ClearFilter" type="button" class="btn btn-default btn_search_box" style="background: white; color: #000">
                                <i class="fa fa-eraser" aria-hidden="true"></i>
                            </button>
                        </div>
                    </div>
                    <div style="display: flex; flex-direction: inherit; margin-top: 10px;">
                        <input id="iptFilterText" runat="server" type="text" placeholder="Nhập tìm kiếm" class="form-control" style="margin-right: 5px" />
                        <div class="" style="">
                            <button id="btnFind" type="button" class="btn btn-default btn_search_box">
                                <i class="fa fa-search" aria-hidden="true"></i>
                                Lọc tin 
                            </button>
                        </div>
                    </div>
                    <asp:Button ID="submitFind" OnClick="submitFind_Click" ClientIDMode="Static" runat="server" CssClass="hidden" />
                </div>
            </div>
            <div style="display: flex; padding: 20px;">
                <div class="content" style="flex-grow: 1;">
                    <asp:ScriptManager ID="MainScriptManager" runat="server" />
                    <asp:UpdatePanel ID="pnlHelloWorld" runat="server">
                        <ContentTemplate>
                            <div style="max-height:600px;overflow:auto">
                                <asp:Repeater ID="rptResult" runat="server">
                                    <ItemTemplate>
                                        <div id="<%# Eval("Id") %>" data-CoordinatesX="<%# Eval("CoordinatesX") %>" data-CoordinatesY="<%# Eval("CoordinatesY") %>"  tabindex="-1" class="post" style="background-color: #fbf7ef; display: flex; height: 170px; overflow: hidden; padding: 10px; margin-bottom: 3px;">
                                            <a>
                                                <div class="post-thumb" data-background-image="<%# Eval("Thumbnail") %>"
                                                    style="position: relative; display: block; background-position: center center; background-image: url('<%# Eval("Thumbnail") %>'); background-size: cover; background-repeat: no-repeat; width: 150px; height: 150px;"
                                                    data-loaded="true">
                                                    <div class="image_number" style="position: absolute; bottom: 0px; right: 0px;"><%--<span>6 ảnh</span>--%></div>
                                                </div>
                                            </a>
                                            <div class="post-info" style="padding-left: 10px; overflow: hidden">
                                                <h3 class="title" style="margin-top: 0px;">
                                                    <a class="post-link" style="text-overflow: ellipsis; display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical; word-break: break-word; overflow: hidden;"
                                                        href="/Views/DetailPost.aspx?id=<%# Eval("Id") %>">
                                                        <%# Eval("Title") %>
                                                    </a>
                                                </h3>
                                                <div class="price"><strong><%# Eval("Price") %> triệu / tháng</strong></div>
                                                <div class="clearfix">
                                                    <div class="acreage"><span class="name">Diện tích:</span><span class="value"><%# Eval("Acreage") %> m²</span></div>
                                                    <div class="address">
                                                        <span class="name">Khu vực:</span>
                                                        <a class="value">
                                                            <%# Eval("HouseAddress") %>
                                                        </a>
                                                    </div>
                                                    <time class="timeago"><span class="name">Cập nhật:</span><span class="value"><%# Eval("PostedDate") %></span></time>
                                                </div>
                                                <p class="p_content" style="text-overflow: ellipsis; display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical; word-break: break-word; overflow: hidden;">
                                                    <%# Eval("Description") %>
                                                </p>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>

                            <div style="margin-top: 20px;">
                                <table style="width: 600px; margin-right: auto; margin-left: auto">
                                    <tr>
                                        <td>
                                            <asp:LinkButton ID="lbFirst" runat="server"
                                                OnClick="lbFirst_Click">Đầu</asp:LinkButton>
                                        </td>
                                        <td>
                                            <asp:LinkButton ID="lbPrevious" runat="server"
                                                OnClick="lbPrevious_Click">Trước</asp:LinkButton>
                                        </td>
                                        <td>
                                            <asp:DataList ID="rptPaging" runat="server"
                                                OnItemCommand="rptPaging_ItemCommand"
                                                OnItemDataBound="rptPaging_ItemDataBound"
                                                RepeatDirection="Horizontal">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lbPaging" runat="server"
                                                        CommandArgument='<%# Eval("PageIndex") %>'
                                                        CommandName="newPage"
                                                        Text='<%# Eval("PageText") %> ' Width="20px">
                                                    </asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:DataList>
                                        </td>
                                        <td>
                                            <asp:LinkButton ID="lbNext" runat="server"
                                                OnClick="lbNext_Click">Sau</asp:LinkButton>
                                        </td>
                                        <td>
                                            <asp:LinkButton ID="lbLast" runat="server"
                                                OnClick="lbLast_Click">Cuối cùng</asp:LinkButton>
                                        </td>
                                        <td>
                                            <asp:Label ID="lblpage" runat="server" Text=""></asp:Label>
                                        </td>
                                    </tr>
                                </table>

                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>
    </div>
    <div id="map" style="width: 60%; float: right; height: 870px">
    </div>
    <input id="data" runat="server" class="hidden"/>
    <style>
        .post:focus{
            background-color:#ffc550;
        }
    </style>
    <script>
        var search_city = document.getElementById("search_city");
        var search_district = document.getElementById("search_district");
        var search_line = document.getElementById("search_line");
        var search_price = document.getElementById("search_price");
        var search_acr = document.getElementById("search_acr");
        var btnFind = document.getElementById("btnFind");
        var submitFind = document.getElementById("submitFind");
        var btnClearFilter = document.getElementById("btn-ClearFilter");
        var coordinateData = document.getElementById("MainContent_data");
        search_city.addEventListener("change", function () {
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
            search_district.innerHTML = "";
            search_line.innerHTML = "";
            search_line.appendChild(new Option("---Đường phố---", ""));
            var dataJson = JSON.parse(data);
            dataJson = JSON.parse(dataJson.d);
            search_district.appendChild(new Option("---Quận huyện---", ""));
            for (var i = 0; i < dataJson.length; i++) {
                search_district.appendChild(new Option(dataJson[i].Name, dataJson[i].Id));
            }
        }
        search_district.addEventListener("change", function () {
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
            search_line.innerHTML = "";
            var dataJson = JSON.parse(data);
            dataJson = JSON.parse(dataJson.d);
            search_line.appendChild(new Option("---Đường phố---", ""));
            for (var i = 0; i < dataJson.length; i++) {
                search_line.appendChild(new Option(dataJson[i].Name, dataJson[i].Id));
            }
        }
        btnFind.addEventListener("click", function () {
            submitFind.click();
        });
        btnClearFilter.addEventListener("click", function () {
            search_city.value = "";
            search_district.innerHTML = "";
            search_district.appendChild(new Option("---Quận huyện---", ""));
            search_district.value = "";
            search_line.innerHTML = "";
            search_line.appendChild(new Option("---Đường phố---", ""));
            search_line.value = "";

            search_price.value = 0;
            search_acr.value = 0;
            var filterText = document.getElementById("MainContent_iptFilterText");
            filterText.value = "";
        });
        coordinateData.addEventListener('change', function () {
            alert("change");
        });
    </script>
    <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false"></script>
    <script>
        var map = document.getElementById("map");
        var postContainer = document.getElementById("MainContent_pnlHelloWorld");
        postContainer.addEventListener('DOMSubtreeModified', function () {
            GetAllCoor();
        });
        var listMarker = [];
        var mapOptions = {
            center: new google.maps.LatLng(21.0278, 105.8342),
            zoom: 15,
            mapTypeId: google.maps.MapTypeId.ROADMAP
        };
        var mapD = new google.maps.Map(map, mapOptions);
            //var markerDefault = new google.maps.Marker({
            //    position: new google.maps.LatLng(21.0278, 105.8342),
            //    map: mapD,
            //    title: "Drag me!"
            //});
        InitMap();
        function InitMap() {
            var listCoor = JSON.parse(coordinateData.value);
            console.log(listCoor);
            for (var i = 0; i < listCoor.length; i++) {
                var x = listCoor[i].CoordinatesX;
                var y = listCoor[i].CoordinatesY;
                var postId = listCoor[i].Id;
                console.log(postId);
                var marker = new google.maps.Marker({
                    position: new google.maps.LatLng(x, y),
                    map: mapD,
                    postId: postId
                });
                listMarker.push(marker);
                console.log(marker);
                console.log(listMarker);
                google.maps.event.addListener(marker, 'click', function () {
                    //console.log(marker.postId);
                    //var post = document.getElementById(marker.postId);
                    //post.focus();
                    focusPost(this);
                });
            }
        }
        function focusPost(marker) {
            for (var i = 0; i < listMarker.length; i++) {
                if (marker == listMarker[i]) {
                    var post = document.getElementById(marker.postId);
                    post.focus();
                }
            }
        }
        function GetAllCoor() {
            //listMarker.length = 0;
            clearOverlays();
            var postEl = document.getElementsByClassName("post");
            for (var i = 0; i < postEl.length; i++) {
                var id = postEl[i].getAttribute("id");
                var cX = postEl[i].getAttribute("data-CoordinatesX");
                var cY = postEl[i].getAttribute("data-CoordinatesY");
                if (cX != null && cX != undefined && cY != null && cY != undefined) {
                    var marker = new google.maps.Marker({
                        position: new google.maps.LatLng(cX, cY),
                        map: mapD,
                        postId: id
                    });
                    listMarker.push(marker);
                    google.maps.event.addListener(marker, 'click', function () {
                        focusPost(this);
                    });
                }
            }
        }
        function clearOverlays() {
            for (var i = 0; i < listMarker.length; i++) {
                listMarker[i].setMap(null);
            }
            listMarker.length = 0;
        }
    </script>
</asp:Content>
