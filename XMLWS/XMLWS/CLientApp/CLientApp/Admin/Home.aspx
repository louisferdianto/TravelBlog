<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="XMLWSAssg.Admin.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
         <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
</head>
<body  style="width:600px; height:100%; margin: 0 auto;  background-color:transparent; background-image: url('../bg2.jpg');">
    <form id="form1" runat="server">
        <div style="text-align: center">
            <asp:Label ID="Label1" runat="server" Text="Welcome: "></asp:Label>
            <asp:Label ID="lblAccountName" runat="server"></asp:Label>
        </div>
        <div class="btn-group-lg" style="text-align: center">
            <asp:Button ID="postPageBtn" CssClass="btn btn-secondary" runat="server" OnClick="postPageBtn_Click" Text="Add Post Page" />
            <asp:Button ID="listPostPageBtn"  CssClass="btn btn-secondary"  runat="server" OnClick="listPostPageBtn_Click" Text="Manage Post" />
            <asp:Button ID="logOutBtn"  CssClass="btn btn-secondary"  runat="server" OnClick="logOutBtn_Click" Text="Log Out" />
            <br />
                    </div>
        <p>

        </p>
        <p style="text-align: center">
            <asp:Label ID="Label2" runat="server" Text="NUMBER OF POSTING BY THE ADMIN"></asp:Label>
            <asp:Chart ID="Chart1" runat="server" ImageStorageMode="UseImageLocation" Height="324px" Width="425px">
                <series>
                    <asp:Series Name="Series1" YValuesPerPoint="2">
                    </asp:Series>
                </series>
                <chartareas>
                    <asp:ChartArea Name="ChartArea1">
                    </asp:ChartArea>
                </chartareas>
            </asp:Chart>
        </p>
    </form>
</body>
</html>
