<%@ Page Title="" Language="C#" MasterPageFile="~/MemberPages/MasterPageAudit.Master" AutoEventWireup="true" CodeBehind="WebFormStep3Opasnost.aspx.cs" Inherits="WebApplicationISPDn.MemberPages.WebFormOpasnost" %>
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
    <asp:DetailsView ID="DetailsViewISPDnOpasn" runat="server" AllowPaging="True" 
        AutoGenerateRows="False" BackColor="White" BorderColor="#999999" 
        BorderStyle="None" BorderWidth="1px" CellPadding="3" 
        DataKeyNames="ISPDnOperatorID" DataSourceID="SqlDataSourceISPDnOpasn" 
        GridLines="Vertical" Height="50px" Width="637px">
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
    <asp:SqlDataSource ID="SqlDataSourceISPDnOpasn" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
        SelectCommand="SELECT * FROM [ISPDnOperator]"></asp:SqlDataSource>
    <br />
    <asp:GridView ID="GridViewUgrozaOpasn" runat="server" AutoGenerateColumns="False" 
        CellPadding="4" DataKeyNames="NazvanieUgrozID" 
        DataSourceID="SqlDataSourceUgrozaOpas" ForeColor="#333333" GridLines="None" 
        Width="100%">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="NazvanieUgrozID" HeaderText="NazvanieUgrozID" 
                InsertVisible="False" ReadOnly="True" SortExpression="NazvanieUgrozID" />
            <asp:BoundField DataField="NazvanieUgrozName" HeaderText="NazvanieUgrozName" 
                SortExpression="NazvanieUgrozName" />
            <asp:BoundField DataField="VidUgrozID" HeaderText="VidUgrozID" 
                SortExpression="VidUgrozID" />
            <asp:TemplateField HeaderText="низкая" SortExpression="1">
                <ItemTemplate>
                    <asp:RadioButton ID="RadioButton1" runat="server" GroupName="GridOpasnost" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="средняя" SortExpression="2">
                <ItemTemplate>
                    <asp:RadioButton ID="RadioButton2" runat="server" GroupName="GridOpasnost" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="высокая" SortExpression="3">
                <ItemTemplate>
                    <asp:RadioButton ID="RadioButton3" runat="server" GroupName="GridOpasnost" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CheckBoxField DataField="4" HeaderText="4" SortExpression="4" 
                Visible="False" />
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
    <asp:SqlDataSource ID="SqlDataSourceUgrozaOpas" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
        SelectCommand="SELECT * FROM [NazvanieUgroz]"></asp:SqlDataSource>
    <br />
    <asp:Button ID="ButtonOpasnost" runat="server" onclick="ButtonOpasnost_Click" 
        Text="Опасность" Width="199px" />
    <br />
    <br />
    <br />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolderSubject" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolderPD" runat="server">
</asp:Content>
