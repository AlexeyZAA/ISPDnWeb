<%@ Page Title="" Language="C#" MasterPageFile="~/MemberPages/MasterPageAudit.Master" AutoEventWireup="true" CodeBehind="WebFormStep4Doc.aspx.cs" Inherits="WebApplicationISPDn.MemberPages.WebFormStep4Doc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headAudit" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMenuAudit" runat="server">
    <asp:Menu ID="NavigationMenuStep3Opasnost" runat="server" CssClass="menu" 
        EnableViewState="false" IncludeStyleBlock="false" Orientation="Horizontal">
        <Items>
            <asp:MenuItem NavigateUrl="~/MemberPages/WebFormStep4Doc.aspx" 
                Text="Документы" />
            <asp:MenuItem NavigateUrl="~/MemberPages/WebFormStep4Doc.aspx" 
                Text="Дополнительная инфа для документов" />
        </Items>
    </asp:Menu>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderAudit" runat="server">
    &nbsp;<br/>
    <asp:DetailsView ID="DetailsViewOrganizDoc" runat="server" AllowPaging="True" 
        AutoGenerateRows="False" BackColor="White" BorderColor="#999999" 
        BorderStyle="None" BorderWidth="1px" CellPadding="3" 
        DataKeyNames="OrgOperatorID" DataSourceID="SqlDataSourceOrganizationDoc" 
        GridLines="Vertical" Height="50px" onload="DetailsViewOrganizDoc_Load" 
        Width="485px">
        <AlternatingRowStyle BackColor="#DCDCDC" />
        <EditRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
        <Fields>
            <asp:BoundField DataField="OrgOperatorID" HeaderText="OrgOperatorID" 
                InsertVisible="False" ReadOnly="True" SortExpression="OrgOperatorID" />
            <asp:BoundField DataField="OrgOperatorKratkName" 
                HeaderText="OrgOperatorKratkName" SortExpression="OrgOperatorKratkName" />
            <asp:BoundField DataField="OrgOperatorFullName" 
                HeaderText="OrgOperatorFullName" SortExpression="OrgOperatorFullName" />
            <asp:BoundField DataField="OrgOperatorINN" HeaderText="OrgOperatorINN" 
                SortExpression="OrgOperatorINN" />
            <asp:BoundField DataField="OrgOperatorRukovoditelName" 
                HeaderText="OrgOperatorRukovoditelName" 
                SortExpression="OrgOperatorRukovoditelName" />
            <asp:BoundField DataField="OrgOperatorRukovoditelDolgn" 
                HeaderText="OrgOperatorRukovoditelDolgn" 
                SortExpression="OrgOperatorRukovoditelDolgn" />
            <asp:BoundField DataField="OrgOperatorAdress" HeaderText="OrgOperatorAdress" 
                SortExpression="OrgOperatorAdress" />
            <asp:BoundField DataField="UserID" HeaderText="UserID" 
                SortExpression="UserID" />
        </Fields>
        <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
        <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
    </asp:DetailsView>
    <asp:SqlDataSource ID="SqlDataSourceOrganizationDoc" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
        SelectCommand="SELECT OrgOperatorID, OrgOperatorKratkName, OrgOperatorFullName, OrgOperatorINN, OrgOperatorRukovoditelName, OrgOperatorRukovoditelDolgn, OrgOperatorAdress, UserID FROM OrgOperator WHERE (UserID = @ParamUserID)">
        <SelectParameters>
            <asp:Parameter Name="ParamUserID" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <p>
        <asp:CheckBoxList ID="CheckBoxListDocZip" runat="server" Width="313px">
        </asp:CheckBoxList>
    </p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        <asp:HyperLink ID="HyperLinkDocLoad" runat="server" Visible="False" 
            Width="700px">[HyperLinkDocLoad]</asp:HyperLink>
    </p>
    <p>
        <br />
        <asp:Button ID="ButtonGetZip" runat="server" onclick="ButtonGetZip_Click" 
            Text="Ссылка на документы" Width="232px" Height="29px" />
    </p>
    <p>
        &nbsp;</p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolderSubject" runat="server">
    </asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolderPD" runat="server">
</asp:Content>
