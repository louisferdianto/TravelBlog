<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="XMLWSAssg.EndUser.Home" %>

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
</nav>
    <br />
    <form id="form1" runat="server">
            <!-- Header -->
			
        <div>
            <asp:DropDownList ID="DropDownList1"  runat="server" DataSourceID="XmlDataSource3" 
                DataTextField="Name" DataValueField="Name" 
                OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
            </asp:DropDownList>
          <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" CssClass="btn btn-primary" Text="Go" /><br /><br />
          
            <asp:MultiView  ID="MultiView1" runat="server">
                <asp:View ID="View1" runat="server">
                       
                    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="XmlDataSource1">

                        <ItemTemplate>
                           <div class="jumbotron">
                            <a href="#" class="display-4" onclick="DoNav('<%#XPath("@id")%>')">
                                <h2><b><u><%#XPath("Title")%></u></b></h2>
                            </a>
                        <p class="badge badge-primary">Posted On: <%#XPath("Date")%> by <%#XPath("Author")%></p>
                        <p class="badge badge-primary">Location: <%#XPath("Location")%></p>
                        <p>
                            Tags:
                            <asp:Repeater ID="Repeater2"
                           DataSource='<%#XPathSelect("Hashtag/Tag")%>'
                           runat="server">
                           <ItemTemplate>
                               <%#Container.ItemIndex>0?", ":"" %>
                               <a href="TagList.aspx?s=<%#XPath(".") %>"><%#XPath(".") %></a>
                                                                                    
                           </ItemTemplate>
                       </asp:Repeater>
                        </p>
                                </div><br /><br />
                    </ItemTemplate>
                    </asp:Repeater>
            </asp:View>
                <asp:View ID="View2" runat="server">
                                    <h2><b>
                                    <asp:Label ID="lblTitle" runat="server" 
                                        Text="Title"></asp:Label></b></h2>
                                    <asp:Label ID="lblDatePost" runat="server" 
                                        Text="DatePost"></asp:Label><br />
                                    <asp:Label ID="lblDesc" runat="server" 
                                        Text="Description"></asp:Label><br />

                                    <asp:Label ID="lblFeedback" runat="server" 
                                        Text="Visitor Feedbacks"></asp:Label><br />
                                    <%
                                        System.Xml.XmlDocument doc = XmlDataSource2.GetXmlDocument();
                                        System.Xml.XmlNodeList nodelist = doc.SelectNodes
                                            ("//Response[@PostId='" + Request.QueryString["P"] + "']");
                                        for (int i = 0; i < nodelist.Count; i++)  
                                        {
                                        %>
                                        <b><% Response.Write(nodelist[i].ChildNodes[0].InnerText);  %></b>
                                        <br />
                                        <% Response.Write(nodelist[i].ChildNodes[1].InnerText);%>
                                        <br />
                                        <br />
                                        <%
                                        } %>

                                    <asp:Label ID="lblPostFeedback" runat="server" 
                                        Text="Post a Feedback"></asp:Label>
                                    <table>
                                        <tr style="border: none;">
                                            <td style="border-style: none; border-color: inherit;" 
                                                class="auto-style15">
                                                <asp:Label ID="Label6" runat="server" 
                                                    Text="Name : "></asp:Label>
                                            </td>
                                            <td class="auto-style14">
                                                <asp:TextBox ID="txtNameFeedback" CssClass="form-control" runat="server"></asp:TextBox>
                                            </td>
                                        </tr>
                                    </table>
                                    <table>
                                        <tr>
                                            <td class="auto-style12">
                                                <asp:TextBox ID="txtMessageFeedback" CssClass="form-control" runat="server" 
                                                    Rows="5" TextMode="MultiLine" Width="600"></asp:TextBox>
                                            </td>
                                        </tr>
                                    </table>
                                    <br />
                                    <asp:Button ID="CommentBtn" runat="server" Text="Add Comment"
                                        OnClick="CommentBtn_Click" Height="33px" Width="117px" />
                </asp:View>
            </asp:MultiView>
              </div>
        
          <asp:XmlDataSource ID="XmlDataSource1" runat="server" 
              DataFile="~/App_Data/AdminPost.xml"></asp:XmlDataSource>
          <asp:XmlDataSource ID="XmlDataSource2" runat="server" 
              DataFile="~/App_Data/Feedback.xml"></asp:XmlDataSource>    
          <asp:XmlDataSource ID="XmlDataSource3" runat="server" DataFile="~/App_Data/Location.xml" 
              TransformFile="~/App_Data/AdminPostXSLT.xsl"></asp:XmlDataSource>
    </form>
</body>
</html>
