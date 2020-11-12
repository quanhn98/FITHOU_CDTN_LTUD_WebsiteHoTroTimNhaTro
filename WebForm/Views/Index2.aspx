<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Index2.aspx.cs" Inherits="WebForm.Views.Index2" %>

<asp:Content ID="Header" ContentPlaceHolderID="Header" runat="server">
    <title>Trang chủ</title>
</asp:Content>
<asp:Content ContentPlaceHolderID="MainContent" runat="server">
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
            width: 160px;
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
    <div class="container" style="min-height: 1000px; background-color: white;">
        <div class="form-Filter">
            <div class="search_field">
                <div class="clearfix">
                    <div class="search_field_item search_field_item_tinhthanh">
                        <label class="search_field_item_label">Tỉnh thành</label>
                        <%--<select id="search_city" runat="server" class="form-control" name="" tabindex="-1" aria-hidden="true">
                        </select>--%>
                        <asp:DropDownList ID="search_city" runat="server" CssClass="form-control" ClientIDMode="Static"></asp:DropDownList>
                    </div>
                    <div class="search_field_item search_field_item_quanhuyen">
                        <label class="search_field_item_label">Quận huyện</label>
                        <%--<select id="search_district" runat="server" class="form-control" name="" data-current="" tabindex="-1" aria-hidden="true">
                        </select>--%>
                        <asp:DropDownList ID="search_district" runat="server" CssClass="form-control" ClientIDMode="Static"></asp:DropDownList>
                    </div>
                    <div class="search_field_item search_field_item_duongpho">
                        <label class="search_field_item_label">Đường phố</label>
                        <%--<select name="search_line" class="form-control" data-current="" tabindex="-1" aria-hidden="true">
                        </select>--%>
                        <asp:DropDownList ID="search_line" runat="server" CssClass="form-control" ClientIDMode="Static"></asp:DropDownList>
                    </div>
                    <div class="search_field_item search_field_item_mucgia">
                        <label class="search_field_item_label">Khoảng giá</label>
                        <select class="form-control price js_select2_price select2-hidden-accessible" name="gia" tabindex="-1" aria-hidden="true">
                            <option value="0" selected="">Chọn mức giá</option>
                            <option value="1">Dưới 1 triệu</option>
                            <option value="2">1 triệu - 2 triệu</option>
                            <option value="3">2 triệu - 3 triệu</option>
                            <option value="4">3 triệu - 4 triệu</option>
                        </select>
                    </div>
                    <div class="search_field_item search_field_item_dientich">
                        <label class="search_field_item_label">Diện tích</label>
                        <select id="search_dientich" name="dt" class="form-control js_select2_acreage select2-hidden-accessible" tabindex="-1" aria-hidden="true">
                            <option value="0" selected="">Chọn diện tích</option>
                            <option value="1">Dưới 20 m2</option>
                            <option value="2">20 m2 - 30 m2</option>
                            <option value="3">30 m2 - 40 m2</option>
                        </select>
                    </div>
                    <div class="search_field_item search_field_item_submit">
                        <label class="search_field_item_label">&nbsp;</label>
                        <button type="submit" class="btn btn-default btn_search_box">Lọc tin </button>
                    </div>
                </div>
            </div>
        </div>
        <div style="display: flex; padding: 20px;">
            <div class="content" style="flex-grow: 1;">
                <asp:Repeater ID="Repeater1" runat="server">
                    <ItemTemplate>
                        <div id="" class="post" style="background-color: #fbf7ef; display: flex; height: 170px; overflow: hidden; padding: 10px; margin-bottom: 3px;">
                            <a>
                                <div class="post-thumb" data-background-image="<%# Eval("Thumbnail") %>"
                                    style="position: relative; display: block; background-position: center center; background-image: url('<%# Eval("Thumbnail") %>'); background-size: cover; background-repeat: no-repeat; width: 150px; height: 150px;"
                                    data-loaded="true">
                                    <div class="image_number" style="position: absolute; bottom: 0px; right: 0px;"><span>6 ảnh</span></div>
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

                <div style="overflow: hidden;">
                    <asp:Repeater ID="rptPages" runat="server"
                        OnItemCommand="rptPages_ItemCommand">
                        <ItemTemplate>
                            <asp:LinkButton ID="btnPage"
                                Style="padding: 1px 3px; margin: 1px; background: #ccc; border: solid 1px #666; font: 8pt tahoma;"
                                CommandName="Page" CommandArgument="<%# Container.DataItem %>"
                                runat="server"><%# Container.DataItem %>
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
            <%--<div class="ads" style="width: 200px;">
                <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQZnBuV7XEqbsymeA-VLE4EzvngXSz-luLaVg&usqp=CAU" style="width: 100%;">
            </div>--%>
        </div>
    </div>
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="True" />
    <script src="https://code.jquery.com/jquery-1.12.4.js" integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU=" crossorigin="anonymous"></script>
    <script>
        var search_city = document.getElementById("search_city");
        var search_district = document.getElementById("search_district");
        var search_line = document.getElementById("search_line");
        search_city.addEventListener("change", function () {
            $.ajax({
                type: 'POST',
                url: '/Views/GetAddress.aspx',
                data: {},
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (r) { },
                error: function (e) { }
            });
            //var xhttp = new XMLHttpRequest();
            //xhttp.onreadystatechange = function () {
            //    if (this.readyState == 4 && this.status == 200) {
            //        var m = this.responseText;
            //        console.log(m);
            //        //BindDistrictSelect(this.responseText);
            //    }
            //};
            ////xhttp.open("GET", "/Views/GetAddress?cityId=" + this.value + "", true);
            ////xhttp.open("GET", "/Views/TestAjax?cityId=" + this.value + "", true);
            //xhttp.open("GET", "/Views/TestAjax");
            //xhttp.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
            //xhttp.send();
        });
        function BindDistrictSelect(data) {
            search_district.innerHTML = "";
            search_line.innerHTML = "";
            var dataJson = JSON.parse(data);
            console.log(dataJson);
            for (var i = 0; i < dataJson.length; i++) {
                search_district.appendChild(new Option(dataJson[i].Name, dataJson[i].Id));
            }
        }
    </script>
</asp:Content>
