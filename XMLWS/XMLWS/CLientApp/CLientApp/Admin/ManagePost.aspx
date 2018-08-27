<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManagePost.aspx.cs" Inherits="XMLWSAssg.Admin.ManagePost" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

</head>
<body style="width:600px; height:100%; margin: 0 auto;  background-color:transparent; background-image: url('../bg2.jpg');">
    <form id="form1" runat="server">
        <p>

        </p>
        <div class="btn-group-lg" style="text-align: center">
            <asp:Button ID="postPageBtn" CssClass="btn btn-secondary" runat="server" OnClick="postPageBtn_Click" Text="Add Post Page" />
            <asp:Button ID="listPostPageBtn"  CssClass="btn btn-secondary"  runat="server" OnClick="listPostPageBtn_Click" Text="Manage Post" />
            <asp:Button ID="logOutBtn"  CssClass="btn btn-secondary"  runat="server" OnClick="logOutBtn_Click" Text="Log Out" />
            <br /><br />
            </div>
        <div>
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" style="margin:0 auto;" AutoGenerateColumns="False" CellPadding="4" DataSourceID="XmlDataSource1" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" DataKeyNames="id" OnRowCommand="GridView1_RowCommand" Width="600px">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:CommandField ButtonType="Button" ShowSelectButton="True" />
                    <asp:BoundField DataField="id" HeaderText="id" SortExpression="id" />
                    <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                    <asp:BoundField DataField="Author" HeaderText="Author" SortExpression="Author" />
                    <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
                    <asp:ButtonField ButtonType="Button" CommandName="delete" Text="Delete" />
                </Columns>
                <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                <SortedAscendingCellStyle BackColor="#FDF5AC" />
                <SortedAscendingHeaderStyle BackColor="#4D0000" />
                <SortedDescendingCellStyle BackColor="#FCF6C0" />
                <SortedDescendingHeaderStyle BackColor="#820000" />
            </asp:GridView>
            <asp:XmlDataSource ID="XmlDataSource1" runat="server" DataFile="~/App_Data/AdminPost.xml" TransformFile="~/App_Data/AdminPostXSLT.xsl"></asp:XmlDataSource>
            <asp:XmlDataSource ID="XmlDataSource2" runat="server" DataFile="~/App_Data/AdminPost.xml"></asp:XmlDataSource>
        <br />

        <asp:Panel ID="Panel1" runat="server" CssClass="jumbotron" style="width:593px; height:330px; margin:0 auto;">
            <asp:Label ID="Label5" runat="server" Text="Update" class="font-weight-bold"></asp:Label>
            <table class="auto-style1">
                <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text="Title"></asp:Label>
                    </td>
                    <td class="auto-style3">:</td>
                    <td>
                        <asp:TextBox ID="txtEditTitle" runat="server" CssClass="form-control"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label2" runat="server" Text="Location"></asp:Label>
                    </td>
                    <td class="auto-style4">:</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="txtEditLoc" runat="server" CssClass="form-control"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label3" runat="server" Text="Description"></asp:Label>
                    </td>
                    <td class="auto-style4">:</td>
                    <td class="auto-style2">
                        <textarea id="txtDescription" runat="server" class="form-control"></textarea></td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label4" runat="server" Text="Hashtag" ></asp:Label>
                    </td>
                    <td class="auto-style4">:</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="txtEditTag" runat="server" Width="396px" CssClass="form-control"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2" colspan="3">
                        <asp:Button ID="UpdateBtn" runat="server" OnClick="UpdateBtn_Click" Text="Update" CssClass="btn btn-primary"/>
                    </td>
                </tr>
            </table>
        </asp:Panel>
                    </div>
    </form>
</body>
</html>
