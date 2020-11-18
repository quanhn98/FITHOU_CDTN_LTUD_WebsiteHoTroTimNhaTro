<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="WebForm.Views.Public.Profile" %>

<asp:Content ID="Header" ContentPlaceHolderID="Header" runat="server">
    <title>Hồ sơ</title>
</asp:Content>
<asp:Content ContentPlaceHolderID="MainContent" runat="server">
    <div style="padding: 10px">
        <div class="PaperContainer contactInfo false">
            <div class="PaperInfoWrapper" style="color: rgba(0, 0, 0, 0.87); background-color: #ffffff; transition: all 450ms cubic-bezier(0.23, 1, 0.32, 1) 0ms; box-sizing: border-box; font-family: Verdana, Arial, sans-serif; -webkit-tap-highlight-color: rgba(0,0,0,0); box-shadow: 0 1px 2px rgba(0,0,0,.1); border-radius: 2px">
                <div class="row">
                    <div class="col-xs-12 col-md-6 BasicInfo">
                        <div class="AvatarWrapper">
                            <img style="color: #ffffff; background-color: rgb(188, 188, 188); user-select: none; display: inline-flex; align-items: center; justify-content: center; font-size: 40px; border-radius: 50%; height: 80px; width: 80px" size="80" src="/Content/Images/no-image.jpg">
                        </div>
                        <div class="InfoWrapper">
                            <span class="name" id="fullName" runat="server"></span> - 
                            <span id="userName" runat="server"></span>
                            <div class="FollowRow">
                                <div><a><b id="totalPost" runat="server">0</b> Tổng số tin</a></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-12 col-md-6 ExtraInfo">
                        <div class="itemRow">Ngày tham gia: &nbsp; <span id="regDate" runat="server">2020</span></div>
                        <div class="itemRow">Số điện thoại: &nbsp; <span id="phoneNumber" runat="server">Chưa có thông tin</span></div>
                        <div class="itemRow">
                            <div id="settingContainer" runat="server">
                                <a href="UpdateProfile.aspx" id="updateProfile" runat="server" style="margin-right:10px">
                                    <i class="fa fa-pencil-square-o" aria-hidden="true"></i>
                                    Cập nhật thông tin</a>
                                <a href="ChangePassword.aspx" id="changePass" runat="server">
                                    <i class="fa fa-key" aria-hidden="true"></i>
                                    Đổi mật khẩu</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div>
            <div style="background-color: #ecf0f1; color: #055699; border-bottom: none; font-weight: 600; border-left: 3px solid #055699; padding: 10px">
                Đang cho thuê 
            </div>
            <asp:Repeater ID="Repeater1" runat="server">
                <ItemTemplate>
                    <div id="" class="post" style="background-color: #fbf7ef; display: flex; height: 170px; overflow: hidden; padding: 10px; margin-bottom: 3px;">
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
        <div>
            <div style="background-color: #ecf0f1; color: #055699; border-bottom: none; font-weight: 600; border-left: 3px solid #055699; padding: 10px">
                Đã đóng bài viết hoặc cho thuê
            </div>
            <asp:Repeater ID="Repeater2" runat="server">
                <ItemTemplate>
                    <div id="" class="post" style="background-color: #fbf7ef; display: flex; height: 170px; overflow: hidden; padding: 10px; margin-bottom: 3px;">
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
    </div>
</asp:Content>
