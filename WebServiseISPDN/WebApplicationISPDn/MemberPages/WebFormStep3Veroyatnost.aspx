<%@ Page Title="" Language="C#" MasterPageFile="~/MemberPages/MasterPageAudit.Master" AutoEventWireup="true" CodeBehind="WebFormStep3Veroyatnost.aspx.cs" Inherits="WebApplicationISPDn.MemberPages.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headAudit" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMenuAudit" runat="server">
<asp:Menu ID="NavigationMenuStep3Opasnost" runat="server" CssClass="menu" EnableViewState="false" IncludeStyleBlock="false" Orientation="Horizontal">
                    <Items>
                        <asp:MenuItem NavigateUrl="~/MemberPages/WebFormStep3IshodZashita.aspx" Text="Исходная защищенность"/>
                        <asp:MenuItem NavigateUrl="~/MemberPages/WebFormStep3Veroyatnost.aspx" Text="Вероятность угроз"/>
                        <asp:MenuItem NavigateUrl="~/MemberPages/WebFormStep3Opasnost.aspx" Text="Опасность угроз" />
                        <asp:MenuItem NavigateUrl="~/MemberPages/WebFormStep3Actualnost.aspx" Text="Актуальные угрозы" />
                    </Items>
                </asp:Menu>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderAudit" runat="server">
    <asp:DetailsView ID="DetailsViewISPDn" runat="server" AllowPaging="True" 
        BorderStyle="None" BorderWidth="1px" CellPadding="3" 
        DataSourceID="SqlDataSourceISPDnOpasnost" GridLines="Vertical" Height="50px" 
        Width="580px" AutoGenerateRows="False" DataKeyNames="ISPDnOperatorID">
        <AlternatingRowStyle BackColor="#DCDCDC" />
        <EditRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
        <Fields>
            <asp:BoundField DataField="ISPDnOperatorID" HeaderText="ISPDnOperatorID" 
                InsertVisible="False" ReadOnly="True" SortExpression="ISPDnOperatorID" />
            <asp:BoundField DataField="ISPDnOperatorName" HeaderText="ISPDnOperatorName" 
                SortExpression="ISPDnOperatorName" />
            <asp:BoundField DataField="OrgOperatorID" HeaderText="OrgOperatorID" 
                SortExpression="OrgOperatorID" />
            <asp:BoundField DataField="ISPDnKategoryID" HeaderText="ISPDnKategoryID" 
                SortExpression="ISPDnKategoryID" />
            <asp:BoundField DataField="ISPDnObemID" HeaderText="ISPDnObemID" 
                SortExpression="ISPDnObemID" />
            <asp:BoundField DataField="ISPDnKlassID" HeaderText="ISPDnKlassID" 
                SortExpression="ISPDnKlassID" />
            <asp:BoundField DataField="ISPDnIshodZashitaID" 
                HeaderText="ISPDnIshodZashitaID" SortExpression="ISPDnIshodZashitaID" />
            <asp:BoundField DataField="ISPDnTipSpecialID" HeaderText="ISPDnTipSpecialID" 
                SortExpression="ISPDnTipSpecialID" />
            <asp:BoundField DataField="ISPDnTipModeli" HeaderText="ISPDnTipModeli" 
                SortExpression="ISPDnTipModeli" />
        </Fields>
        <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
        <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
    </asp:DetailsView>
    <asp:SqlDataSource ID="SqlDataSourceISPDnOpasnost" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
        SelectCommand="SELECT * FROM [ISPDnOperator]">
    </asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content4" runat="server" 
    contentplaceholderid="ContentPlaceHolderSubject">
    <asp:GridView ID="GridViewVeroyatnost" runat="server" 
        AutoGenerateColumns="False" BorderWidth="1px" CellPadding="4" 
        DataKeyNames="NazvanieUgrozID" DataSourceID="SqlDataSourceVidUgrozVeroyatn" 
        EmptyDataText="Нет угроз" ForeColor="#333333" GridLines="None" Width="100%">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="NazvanieUgrozID" HeaderText="ID угрозы" 
                InsertVisible="False" ReadOnly="True" SortExpression="NazvanieUgrozID" />
            <asp:BoundField DataField="NazvanieUgrozName" HeaderText="Название угрозы" 
                SortExpression="NazvanieUgrozName" ItemStyle-Width="500" ControlStyle-Width="500">
            <ItemStyle Width="500px" />
            </asp:BoundField>
            <asp:BoundField DataField="VidUgrozID" HeaderText="VidUgrozID" 
                SortExpression="VidUgrozID" Visible="False" />
            <asp:TemplateField HeaderText="маловероятно" SortExpression="1" FooterStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                <ItemTemplate>
                <asp:RadioButton ID="RadioButton1" runat="server" GroupName="GridVeroyatnost" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="низкая вероятность" SortExpression="2">
                <ItemTemplate>
                    <asp:RadioButton ID="RadioButton2" runat="server" GroupName="GridVeroyatnost" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="средняя вероятность" SortExpression="3">
                <ItemTemplate>
                    <asp:RadioButton ID="RadioButton3" runat="server" GroupName="GridVeroyatnost" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="высокая вероятность" SortExpression="4">
                <ItemTemplate>
                    <asp:RadioButton ID="RadioButton4" runat="server" GroupName="GridVeroyatnost" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSourceVidUgrozVeroyatn" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
        onload="SqlDataSourceVidUgrozOpasn_Load" 
        SelectCommand="SELECT * FROM [NazvanieUgroz]"></asp:SqlDataSource>
    
    <br />
    <asp:Button ID="ButtonVeroyatnost" runat="server" Height="40px" 
        Text="Расчитать вероятность" Width="261px" 
        onclick="ButtonVeroyatnost_Click" />
    <br />
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
    <br />
</asp:Content>

