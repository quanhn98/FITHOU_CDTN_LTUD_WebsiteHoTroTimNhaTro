<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Test.aspx.cs" Inherits="WebForm.Views.Test" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Perfect Pagination With Repeater and ASP.Net C#</title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }

        .auto-style3 {
            width: 162px;
        }

        table {
            border-collapse: collapse;
        }

        table, td, th {
            border: 1px solid blue;
        }

        th {
            background-color: dodgerblue;
            color: white;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="MainScriptManager" runat="server" />
        <asp:UpdatePanel ID="pnlHelloWorld" runat="server">
            <ContentTemplate>
                <div>
                    <asp:Repeater ID="rptResult" runat="server">
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
                </div>

                <div style="margin-top: 20px;">
                    <table style="width: 600px;">
                        <tr>
                            <td>
                                <asp:LinkButton ID="lbFirst" runat="server" 

				OnClick="lbFirst_Click">First</asp:LinkButton>
                            </td>
                            <td>
                                <asp:LinkButton ID="lbPrevious" runat="server" 

				OnClick="lbPrevious_Click">Previous</asp:LinkButton>
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

				OnClick="lbNext_Click">Next</asp:LinkButton>
                            </td>
                            <td>
                                <asp:LinkButton ID="lbLast" runat="server" 

				OnClick="lbLast_Click">Last</asp:LinkButton>
                            </td>
                            <td>
                                <asp:Label ID="lblpage" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                    </table>

                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</body>
</html>