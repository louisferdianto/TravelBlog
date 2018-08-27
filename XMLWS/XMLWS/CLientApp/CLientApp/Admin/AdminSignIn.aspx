<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminSignIn.aspx.cs" Inherits="XMLWSAssg.AdminSignIn" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
</head>
<body  style="width:600px; height:100%; margin: 0 auto; background-color:transparent; background-image: url('../bg2.jpg'); ">
    <form id="form1"  runat="server">
         <div  style="width:400px; height:auto; margin: 0 auto; margin-top:10%;padding:20px; background:rgba(255, 255, 255, 0.5); border-radius:5px; background-image: url('../bg.jpg');">
             <asp:Label ID="Label1" runat="server" Text="Log In"  class="font-weight-bold"></asp:Label><br /><br />
            <asp:TextBox ID="LoginEmail" required="required" placeholder="Email Address" runat="server" CssClass="form-control"></asp:TextBox>
          <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="LoginEmail" ErrorMessage="Email Required" ForeColor="Red">*</asp:RequiredFieldValidator>
         <br /><br />
            <asp:TextBox ID="LoginPassword" required="required" placeholder="Password" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="LoginPassword" ErrorMessage="Password Required" ForeColor="Red">*</asp:RequiredFieldValidator>
            <br />
  
            <asp:Button ID="LoginBtn" runat="server" Text="Login" OnClick="LoginBtn_Click" CssClass="btn btn-primary" /><br />

         <br />  Don't have account ? <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Admin/RegisterAdmin.aspx">Sign Up</asp:HyperLink><br />
      
            <asp:Label ID="lblAuthError" runat="server" ForeColor="Red"></asp:Label>
           </div>

    </form>
</body>
</html>
