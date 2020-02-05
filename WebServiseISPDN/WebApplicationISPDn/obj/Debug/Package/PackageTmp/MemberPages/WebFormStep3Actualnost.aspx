<%@ Page Title="" Language="C#" MasterPageFile="~/MemberPages/MasterPageAudit.Master" AutoEventWireup="true" CodeBehind="WebFormStep3Actualnost.aspx.cs" Inherits="WebApplicationISPDn.MemberPages.WebFormActualnost" %>
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
    <asp:DetailsView ID="DetailsViewISPDnActual" runat="server" 
        AutoGenerateRows="False" DataKeyNames="ISPDnOperatorID" 
        DataSourceID="SqlDataSourceISPDnActual" EmptyDataText="Нет ИСПДн" Height="50px" 
        Width="654px">
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
    </asp:DetailsView>
    <asp:SqlDataSource ID="SqlDataSourceISPDnActual" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
        SelectCommand="SELECT * FROM [ISPDnOperator]"></asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolderSubject" runat="server">
    <asp:GridView ID="GridViewActualnostUgroz" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" CellPadding="4" 
        DataSourceID="SqlDataSourceActualUgroza" 
        EmptyDataText="Пересчитать актуальность" ForeColor="#333333" GridLines="None" 
        Width="655px">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="NazvanieUgrozID" HeaderText="NazvanieUgrozID" 
                InsertVisible="False" ReadOnly="True" SortExpression="NazvanieUgrozID" />
            <asp:BoundField DataField="NazvanieUgrozName" HeaderText="NazvanieUgrozName" 
                SortExpression="NazvanieUgrozName" />
            <asp:BoundField DataField="VidUgrozID" HeaderText="VidUgrozID" 
                SortExpression="VidUgrozID" />
            <asp:BoundField DataField="ISPDnOperatorID" HeaderText="ISPDnOperatorID" 
                SortExpression="ISPDnOperatorID" />
            <asp:BoundField DataField="ActualnostID" HeaderText="ActualnostID" 
                SortExpression="ActualnostID" />
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
    <asp:SqlDataSource ID="SqlDataSourceActualUgroza" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
        SelectCommand="SELECT NazvanieUgroz.NazvanieUgrozID, NazvanieUgroz.NazvanieUgrozName, NazvanieUgroz.VidUgrozID, MnogieUgrozaActual.ISPDnOperatorID, MnogieUgrozaActual.ActualnostID FROM NazvanieUgroz INNER JOIN MnogieUgrozaActual ON NazvanieUgroz.NazvanieUgrozID = MnogieUgrozaActual.NazvanieUgrozID WHERE (MnogieUgrozaActual.ISPDnOperatorID = @ParamISPDnID) AND (MnogieUgrozaActual.ActualnostID = @ParamActual)">
        <SelectParameters>
            <asp:Parameter Name="ParamISPDnID" />
            <asp:Parameter Name="ParamActual" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <asp:Button ID="ButtonActualUgroz" runat="server" Height="29px" 
        onclick="ButtonActualUgroz_Click" Text="Расчитать актуальность" Width="234px" />
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolderPD" runat="server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
</asp:Content>
