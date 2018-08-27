<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TagList.aspx.cs" Inherits="XMLWSAssg.EndUser.TagList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>MyBlog</title>
        <script type="text/javascript">
     function DoNav(theUrl)
     {
        document.location.href = "PostDetail.aspx?P=" + theUrl;
     }
</script>
     <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
</head>
<body  style="width:600px; height:100%; margin: 0 auto;  background-color:transparent; background-image: url('../bg4.jpg'); background-attachment:fixed;" >
    <nav class="nav nav-pills nav-justified nav-fills">
  <a class="nav-link active" href="Home.aspx">MyBlog</a>
                    <a class="nav-link active" href="http://localhost:56455/Home/CurrentWeather">Current Weather</a>
        <a class="nav-link active" href="http://localhost:56455/Currency/GetCurrency">Currency</a>
                <a class="nav-link active" href="http://localhost:56455/News/GetNews">News</a>
</nav><br />
    <form id="form1" runat="server">
        <!-- Header -->
                                  <div class="jumbotron">
        <asp:Xml ID="xmlSearch" runat="server" DocumentSource="~/App_Data/AdminPost.xml" TransformSource="~/App_Data/TagSearch.xsl"></asp:Xml>
                            </div><br /><br />
</form>
</body>
</html>
