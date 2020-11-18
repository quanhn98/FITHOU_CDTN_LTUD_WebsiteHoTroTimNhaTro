<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DetailPost.aspx.cs" Inherits="WebForm.Views.Public.DetailPost" MasterPageFile="~/Site.Master" %>

<asp:Content ContentPlaceHolderID="Header" runat="server">
    <title id="DetailTitle" runat="server">Chi tiết</title>
</asp:Content>
<asp:Content ContentPlaceHolderID="MainContent" runat="server">
    <style>
        #btnDelete, #btnClose, #btnEdit, #btnOpen {
            float: right;
        }
    </style>
    <div style="height: 50px; padding: 10px 10px;">
        <a class="btn" style="" href="Index2.aspx">
            <i class="fa fa-home" aria-hidden="true"></i>
            Về trang chủ
        </a>
        <button type="button" class="btn" id="btnDeleteC" runat="server" style="float: right">Xóa bài</button>
        <asp:Button ID="btnDelete" CssClass="btn hidden" OnClick="btnDelete_Click" runat="server" Visible="true" Text="Xóa bài viết" BorderColor="DarkRed" ClientIDMode="Static" OnClientClick="btnDelete_Check" />
        <asp:Button ID="btnClose" CssClass="btn " OnClick="btnClose_Click" runat="server" Visible="false" Text="Đóng bài viết" ClientIDMode="Static" OnClientClick="btnClose_Check" />
        <asp:Button ID="btnEdit" CssClass="btn " OnClick="btnEdit_Click" runat="server" Visible="false"  Text="Sửa bài viết" ClientIDMode="Static" OnClientClick="btnEdit_Check" />
        <asp:Button ID="btnOpen" CssClass="btn " OnClick="btnOpen_Click" runat="server" Visible="false" Text="Mở bài viết" ClientIDMode="Static" OnClientClick="btnOpen_Check" />
    </div>
    <div style="display: flex;">
        <div style="flex-grow: 1; max-width: 75%;">
            <div class="swiper-container" id="media" style="height: 500px">
                <div class="swiper-wrapper">
                    <asp:Repeater ID="Repeater1" runat="server">
                        <ItemTemplate>
                            <div class="swiper-slide">
                                <img src="<%# Eval("Path") %>" style="height: 100%; width: 100%; object-fit: contain;" />
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                    <%--                    <div class="swiper-slide">Slide 1</div>
                    <div class="swiper-slide">Slide 2</div>
                    <div class="swiper-slide">Slide 3</div>
                    <div class="swiper-slide">Slide 4</div>
                    <div class="swiper-slide">Slide 5</div>--%>
                </div>
                <!-- Add Pagination -->
                <div class="swiper-pagination" style="color: #FFF;"></div>
                <!-- Add Arrows -->
                <div class="swiper-button-next" style="color: #FFF;"></div>
                <div class="swiper-button-prev" style="color: #FFF;"></div>
            </div>
            <div style="margin: 10px">
                <h3 id="postTitle" runat="server"></h3>
                <h5 id="time" runat="server" style="font-style: oblique;"></h5>
                <span id="countView" runat="server"></span>lượt xem
                <h4 id="price" runat="server"></h4>
                <div>
                    <i class="fa fa-map-marker" aria-hidden="true"></i>
                    <a id="address" runat="server"></a>
                </div>
                <h5 id="description" runat="server"></h5>
                <div>
                    <fieldset>
                        <legend>Thông tin: </legend>
                        <label for="fname">Diện tích:</label>
                        <span id="acreage" runat="server"></span>
                        <br>
                        <label for="lname">Tiền điện:</label>
                        <span id="ePrice" runat="server"></span>
                        <br>
                        <label for="email">Tiền nước:</label>
                        <span id="eWater" runat="server"></span>
                        <br>
                        <label for="birthday">Số thành viên tối đa:</label>
                        <span id="maxMem" runat="server"></span>
                        <br>
                        <label for="birthday">Chung chủ:</label>
                        <span id="withHost" runat="server"></span>
                        <br>
                        <label for="birthday">Khép kín:</label>
                        <span id="selfC" runat="server"></span>
                        <br>
                        <label for="birthday">Đã đóng bài viết:</label>
                        <span id="close" runat="server"></span>
                    </fieldset>
                </div>
                <div>
                    <asp:TextBox ID="coordinatesX" runat="server" CssClass="hidden" ClientIDMode="Static" />
                    <asp:TextBox ID="PostId" runat="server" CssClass="hidden" ClientIDMode="Static" />
                    <asp:TextBox ID="coordinatesY" runat="server" CssClass="hidden" ClientIDMode="Static" />
                    <div id="map" style="height: 300px; margin-top: 20px"></div>
                </div>
            </div>
        </div>
        <div id="userInfo" style="padding: 10px; max-width: 40%">
            <div class="" itemprop="seller" itemscope="" style="border-bottom: 1px solid #e5e5e5; margin-bottom: 10px; padding: 10px 0; border-top: 1px solid #e5e5e5;">
                <a id="viewProfile" runat="server" class="" style="display: flex; color: #333; padding: 0;">
                    <div class="" style="height: 50px; width: 50px; display: inline-block; border: 2px solid #e5e5e5; padding: 0; vertical-align: middle; background: url('/Content/Images/no-image.jpg') no-repeat; background-size: contain; background-color: #fff; border-radius: 50%;">
                        <img alt="" src="/Content/Images/no-image.jpg" class="" style="border-radius: 50%; height: 50px; width: 50px; border: 2px solid #e5e5e5; margin: -2px;">
                    </div>
                    <div class="" role="button" tabindex="0" style="flex: 1; padding-left: 8px;">
                        <div class="" style="display: flex;">
                            <div class="" style="margin: 5px 5px 3px 0; font-size: 13px; flex: 1; line-height: 18px; overflow: hidden; text-overflow: ellipsis; display: -webkit-box; -webkit-box-orient: vertical; -webkit-line-clamp: 2;">
                                <b style="margin-right: 5px;" id="createdUser" runat="server"></b>
                            </div>
                            <button class="" style="cursor: pointer; text-align: center; transition: background-color .2s ease-in-out; font-size: 10px; width: max-content; border-radius: 20px; padding: 7px 10px; height: fit-content; background-color: #fff; border: 1px solid;">Xem thông tin</button>
                        </div>
                        <div class="" style="font-size: 11px; color: #9b9b9b; display: flex; align-items: center;">
                            <div class="" style="font-size: 30px; color: #589f39; line-height: 21px; margin-right: 5px; color: #9b9b9b;">
                                •
                            </div>
                            <%--                            Tham gia 1 tháng trước--%>
                        </div>
                    </div>
                </a>
                <div class="" style="display: flex; justify-content: space-around; padding-top: 10px; text-align: center; align-items: center; font-size: 12px; color: #9b9b9b;">
                    <div class="inforItem___1f6kc">
                        <div class="inforText___1ELFe">
                            <p class="">Số tin đăng</p>
                            <span class="" id="totalPost" runat="server"></span>
                        </div>
                    </div>
                    <div class="seperateLine___2_kjr"></div>
                    <a href="" target="blank">
                        <%--<div class="inforItem___1f6kc">
                            <div class="inforText___1ELFe">
                                <p class="rateText___4d2Qr">Đánh giá</p>
                                <span class="inforValue___1Smdc">---</span>
                            </div>
                        </div>--%>
                    </a>
                    <div class="seperateLine___2_kjr"></div>
                    <div class="inforItem___1f6kc">
                        <%--<div class="inforText___1ELFe">
                            <p class="">Hoạt động</p>
                            <span class="inforValue___1Smdc">Thỉnh thoảng</span>
                        </div>--%>
                    </div>
                </div>
            </div>
            <div>
                <div style="display: block; margin-bottom: 0px; text-align: center; vertical-align: middle; touch-action: manipulation; cursor: pointer; background-image: none; border: 1px solid transparent; white-space: nowrap; padding: 8px 10px; line-height: 1.42857; border-radius: 4px; user-select: none; font-size: 13px; transition: background-color 200ms ease-in-out 0s; color: rgb(255, 255, 255); background-color: rgb(51, 168, 55);">
                    <div style="display: flex; -webkit-box-pack: justify; justify-content: space-between; -webkit-box-align: center; align-items: center;">
                        Liên hệ <span id="phoneNumber" runat="server"></span>
                    </div>
                </div>
            </div>
            <div class="ads" style="width: 100%; margin-top: 10px">
                <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQZnBuV7XEqbsymeA-VLE4EzvngXSz-luLaVg&usqp=CAU" style="width: 100%;">
            </div>
        </div>
    </div>
    <style>
        .swiper-container {
            width: 100%;
            height: 100%;
        }

        .swiper-slide {
            text-align: center;
            font-size: 18px;
            background: #fff;
            /* Center slide text vertically */
            display: -webkit-box;
            display: -ms-flexbox;
            display: -webkit-flex;
            display: flex;
            -webkit-box-pack: center;
            -ms-flex-pack: center;
            -webkit-justify-content: center;
            justify-content: center;
            -webkit-box-align: center;
            -ms-flex-align: center;
            -webkit-align-items: center;
            align-items: center;
        }
    </style>
    <%--<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/5.4.5/js/swiper.min.js" integrity="sha512-VHsNaV1C4XbgKSc2O0rZDmkUOhMKPg/rIi8abX9qTaVDzVJnrDGHFnLnCnuPmZ3cNi1nQJm+fzJtBbZU9yRCww==" crossorigin="anonymous"></script>--%>
    <%--<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/5.4.5/css/swiper.min.css" integrity="sha512-uCQmAoax6aJTxC03VlH0uCEtE0iLi83TW1Qh6VezEZ5Y17rTrIE+8irz4H4ehM7Fbfbm8rb30OkxVkuwhXxrRg==" crossorigin="anonymous" />--%>
    <script src="../Content/lib/swipe/swiper.min.js"></script>
    <link rel="stylesheet" href="../Content/lib/swipe/swiper.min.css" />
    <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false"></script>
    <script>
        var media = document.getElementById("media");
        var map = document.getElementById("map");
        var coordinatesX = document.getElementById("coordinatesX");
        var coordinatesY = document.getElementById("coordinatesY");
        var MainContent_btnDeleteC = document.getElementById("MainContent_btnDeleteC");
        var btnDelete = document.getElementById("btnDelete");
        MainContent_btnDeleteC.addEventListener("click", function () {
            var r = confirm("Chắc chắn xóa!");
            if (r == true) {
                btnDelete.click();
            }
        });
        var swiper = new Swiper('#media', {
            pagination: {
                el: '.swiper-pagination',
                type: 'fraction',
            },
            navigation: {
                nextEl: '.swiper-button-next',
                prevEl: '.swiper-button-prev',
            },
        });
        InitMap();
        function InitMap() {
            console.log();
            console.log(coordinatesY.value);
            var mapOptions = {
                center: new google.maps.LatLng(21.0278, 105.8342),
                zoom: 15,
                mapTypeId: google.maps.MapTypeId.ROADMAP
            };
            var mapD = new google.maps.Map(map, mapOptions);
            if (coordinatesX.value != null && coordinatesY.value != null) {
                console.log("abc");
                var markerDefault = new google.maps.Marker({
                    position: new google.maps.LatLng(coordinatesX.value, coordinatesY.value),
                    map: mapD,
                    title: "Drag me!"
                });
            }
        }
        function btnDelete_Check() {
            var ck = confirm("Chắc chắn xóa");
            if (ck == true) {

            } else {
                return false;
            }
        }
        function btnClose_Check() {
            var ck = confirm("Chắc chắn đóng");
            if (ck == true) {

            } else {
                return false;
            }
        }
    </script>
</asp:Content>
