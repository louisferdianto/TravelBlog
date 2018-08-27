<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddPost.aspx.cs" Inherits="XMLWSAssg.Admin.AddPost" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <style type="text/css">
        .auto-style1 {
            height: 29px;
        }
    </style>
</head>

<body style="width:600px; height:100%; margin: 0 auto;  background-color:transparent; background-image: url('../bg2.jpg');">
    <form id="form1" runat="server">
        <p>

        </p>
                <div class="btn-group-lg" style="text-align: center;">
            <asp:Button ID="postPageBtn" CssClass="btn btn-secondary" runat="server" OnClick="postPageBtn_Click" Text="Add Post Page" />
            <asp:Button ID="listPostPageBtn"  CssClass="btn btn-secondary"  runat="server" OnClick="listPostPageBtn_Click" Text="Manage Post" />
            <asp:Button ID="logOutBtn"  CssClass="btn btn-secondary"  runat="server" OnClick="logOutBtn_Click" Text="Log Out" />
            <br />
                    </div>
         <div  style="width:400px; height:auto; margin: 0 auto; margin-top:10%; padding:20px; background:rgba(255, 255, 255, 0.5); border-radius:5px;">
                <asp:label runat="server" text="Add Post" class="font-weight-bold"></asp:label>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style4">
                        <asp:Label ID="Label1" runat="server" Text="Title"></asp:Label>
                    </td>
                    <td class="auto-style5">:</td>
                    <td class="auto-style6">
                        <asp:TextBox ID="txtTitle" runat="server" CssClass="form-control" placeholder="Title"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label2" runat="server" Text="Location"></asp:Label>
                    </td>
                    <td class="auto-style3">:</td>
                    <td>
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="XmlDataSource2" DataTextField="Name" DataValueField="Name">
                        </asp:DropDownList>
                        <asp:TextBox ID="txtLocation" runat="server" CssClass="form-control" placeholder="Location"></asp:TextBox>
                        <asp:XmlDataSource ID="XmlDataSource2" runat="server" DataFile="~/App_Data/Location.xml" TransformFile="~/App_Data/AdminPostXSLT.xsl"></asp:XmlDataSource>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">
                        <asp:Label ID="Label3" runat="server" Text="Author"></asp:Label>
                    </td>
                    <td class="auto-style5">:</td>
                    <td class="auto-style6">
                        <asp:Label ID="lblSessionName" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">
                        <asp:Label ID="Label4" runat="server" Text="Date"></asp:Label>
                    </td>
                    <td class="auto-style5">:</td>
                    <td class="auto-style6">
                        <asp:Label ID="lblDate" runat="server"></asp:Label>
                        <asp:Button ID="dateBtn" runat="server" OnClick="dateBtn_Click" Text="Select Date" />
                        <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="180px" OnSelectionChanged="Calendar1_SelectionChanged" Visible="False" Width="200px">
                            <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                            <NextPrevStyle VerticalAlign="Bottom" />
                            <OtherMonthDayStyle ForeColor="#808080" />
                            <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                            <SelectorStyle BackColor="#CCCCCC" />
                            <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
                            <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                            <WeekendDayStyle BackColor="#FFFFCC" />
                        </asp:Calendar>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">
                        Description</td>
                    <td class="auto-style5">:</td>
                    <td class="auto-style6">
                        <textarea id="TextArea1" name="TextArea1" CssClass="form-control" placeholder="Description" cols="20" rows="1"></textarea></td>
                </tr>
                <tr>
                    <td class="auto-style4">
                        Tag</td>
                    <td class="auto-style5">:</td>
                    <td class="auto-style6">
                        <asp:TextBox ID="txtTag" runat="server" CssClass="form-control" placeholder="Tags"></asp:TextBox>
                    </td>
                </tr>
            </table>
                    <asp:Button ID="addPostBtn" runat="server" Text="Add" OnClick="addPostBtn_Click" CssClass="btn btn-primary" />

        </div>
        <asp:XmlDataSource ID="XmlDataSource1" runat="server" DataFile="~/App_Data/AdminPost.xml"></asp:XmlDataSource>
    </form>
</body>
</html>
