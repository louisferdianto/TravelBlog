<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegisterAdmin.aspx.cs" Inherits="XMLWSAssg.WriteNewXml" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
         <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
</head>
<body  style="width:600px; height:100%; margin: 0 auto; background-color:transparent; background-image: url('../bg2.jpg');">
    <form id="form1" runat="server">
         <div  style="width:400px; height:auto; margin: 0 auto; margin-top:10%; padding:20px; background:rgba(255, 255, 255, 0.5); border-radius:5px;">
            <asp:XmlDataSource ID="XmlDataSource1" runat="server" DataFile="~/App_Data/Admin.xml"></asp:XmlDataSource>
        <p>
            <asp:Label ID="Label1" runat="server" Text="Register" class="font-weight-bold"></asp:Label><br /><br />
            <asp:TextBox ID="adminEmail" placeholder="Email" required="required" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="adminEmail" ErrorMessage="Email Required" ForeColor="Red">Email Required</asp:RequiredFieldValidator>
        </p>
        <p>
            <asp:TextBox ID="adminPassword" placeholder="Password" required="required" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="adminPassword" ErrorMessage="Password Required" ForeColor="Red">Password Required</asp:RequiredFieldValidator>
        </p>
        <p>
            <asp:TextBox ID="adminName" placeholder="Name" required="required" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="adminName" ErrorMessage="Name Required" ForeColor="Red">Name Required</asp:RequiredFieldValidator>
        </p>
        <p>
            <asp:Button ID="adminSaveBtn" runat="server" OnClick="adminSaveBtn_Click" CssClass="btn btn-primary" Text="Save" />
        </p>
        <p>
            <asp:Label ID="lblAuthError" runat="server"></asp:Label>
        </p>
             </div>
    </form>
</body>
</html>
