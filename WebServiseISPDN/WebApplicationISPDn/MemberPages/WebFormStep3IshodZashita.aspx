<%@ Page Title="Аудит информационных систем персональных данных" Language="C#" MasterPageFile="~/MemberPages/MasterPageAudit.Master" AutoEventWireup="true"
    CodeBehind="WebFormStep3IshodZashita.aspx.cs" Inherits="WebApplicationISPDn._Default" %>

<asp:Content ID="headAudit" runat="server" ContentPlaceHolderID="headAudit">
</asp:Content>
 <asp:Content ID="ContentMenu" runat="server" contentplaceholderid="ContentPlaceHolderMenuAudit">
     <asp:Menu ID="NavigationMenuStep3" runat="server" CssClass="menu" EnableViewState="false" IncludeStyleBlock="false" Orientation="Horizontal">
                    <Items>
                        <asp:MenuItem NavigateUrl="~/MemberPages/WebFormStep3IshodZashita.aspx" Text="Исходная защищенность"/>
                        <asp:MenuItem NavigateUrl="~/MemberPages/WebFormStep3Veroyatnost.aspx" Text="Вероятность угроз"/>
                        <asp:MenuItem NavigateUrl="~/MemberPages/WebFormStep3Opasnost.aspx" Text="Опасность угроз" />
                        <asp:MenuItem NavigateUrl="~/MemberPages/WebFormStep3Actualnost.aspx" Text="Актуальные угрозы" />
                    </Items>
                </asp:Menu> 
 </asp:Content>

<asp:Content ID="ContentPlaceHolderAudit" runat="server" ContentPlaceHolderID="ContentPlaceHolderAudit">

    <asp:DetailsView ID="DetailsViewISPDnIshodZachita" runat="server" AllowPaging="True" 
    AutoGenerateRows="False" BackColor="White" BorderColor="#999999" 
    BorderStyle="None" BorderWidth="1px" CellPadding="3" 
    DataKeyNames="ISPDnOperatorID" DataSourceID="SqlDataSourceISPDnModel" 
    GridLines="Vertical" Height="50px" Width="647px">
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
<asp:SqlDataSource ID="SqlDataSourceISPDnModel" runat="server" 
    ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
    SelectCommand="SELECT * FROM [ISPDnOperator]"></asp:SqlDataSource>

</asp:Content>


<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolderSubject">
    <asp:Label ID="LabelHarakterISPDn" runat="server" Font-Bold="True" 
        Text="Технические и эксплуатационные характеристики ИСПДн" Width="524px"></asp:Label>
<br>
    <br />
    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Italic="True" 
        Text="По территориальному размещению"></asp:Label>
<br>
    <asp:RadioButtonList ID="RadioButtonListTerritory" runat="server" BorderWidth="1px" 
        Width="686px">
        <asp:ListItem>распределенная ИСПДн, которая охватывает несколько областей, краев, округов или государство в целом</asp:ListItem>
        <asp:ListItem>городская ИСПДн, охватывающая не более одного населенного пункта (города, поселка)</asp:ListItem>
        <asp:ListItem>корпоративная распределенная ИСПДн, охватывающая многие подразделения одной организации</asp:ListItem>
        <asp:ListItem>локальная (кампусная) ИСПДн, развернутая в пределах нескольких близко расположенных зданий</asp:ListItem>
        <asp:ListItem>локальная ИСПДн, развернутая в пределах одного здания</asp:ListItem>
    </asp:RadioButtonList>
    <br />
    <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Italic="True" 
        Text="По наличию соединения с сетями общего пользования"></asp:Label>
    <asp:RadioButtonList ID="RadioButtonListObschieSety" runat="server" BorderWidth="1px" 
        Width="580px">
        <asp:ListItem>ИСПДн, имеющая многоточечный выход в сеть общего пользования</asp:ListItem>
        <asp:ListItem>ИСПДн, имеющая одноточечный выход в сеть общего пользования</asp:ListItem>
        <asp:ListItem>ИСПДн, физически отделенная от сети общего пользования</asp:ListItem>
    </asp:RadioButtonList>
    <br />
    <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Italic="True" 
        Text="По встроенным (легальным) операциям с записями баз персональных данных"></asp:Label>
    <asp:RadioButtonList ID="RadioButtonListLegalOperation" runat="server" BorderWidth="1px" 
        Width="575px">
        <asp:ListItem>чтение, поиск</asp:ListItem>
        <asp:ListItem>запись, удаление, сортировка</asp:ListItem>
        <asp:ListItem>модификация, передача</asp:ListItem>
    </asp:RadioButtonList>
    <br />
    <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Italic="True" 
        Text="По разграничению доступа к персональным данным"></asp:Label>
    <asp:RadioButtonList ID="RadioButtonListRazgrDostup" runat="server" 
        BorderWidth="1px">
        <asp:ListItem>ИСПДн, к которой имеют доступ определенные переченем сотрудники организации, являющейся владельцем ИСПДн, либо субъект ПДн</asp:ListItem>
        <asp:ListItem>ИСПДн, к которой имеют доступ все сотрудники организации, являющейся владельцем ИСПДн</asp:ListItem>
        <asp:ListItem>ИСПДн с открытым доступом</asp:ListItem>
    </asp:RadioButtonList>
    <br />
    <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Italic="True" 
        Text="По наличию соединений с другими базами ПДн иных ИСПДн"></asp:Label>
    <asp:RadioButtonList ID="RadioButtonListSoedinInBD" runat="server" 
        BorderWidth="1px">
        <asp:ListItem>интегрированная ИСПДн (организация использует несколько баз ПДн ИСПДн, при этом организация не является владельцем всех используемых баз ПДн)</asp:ListItem>
        <asp:ListItem>ИСПДн, в которой используется </asp:ListItem>
    </asp:RadioButtonList>
    <br />
    <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Italic="True" 
        Text="По уровню обобщения (обезличивания) ПДн"></asp:Label>
    <asp:RadioButtonList ID="RadioButtonListBezlich" runat="server" BorderWidth="1px" 
        Height="22px" Width="820px">
        <asp:ListItem>ИСПДн, в которой предоставляемые пользователю данные являются обезличенными (на уровне организации, отрасли, области, региона и т.д.)</asp:ListItem>
        <asp:ListItem>ИСПДн, в которой данные обезличиваются только при передаче в другие организации и не обезличены при предоставлении пользователю в организации</asp:ListItem>
        <asp:ListItem>ИСПДн, в которой предоставляемые пользователю данные не являются обезличенными (т.е. присутствует информация, позволяющая идентифицировать субъекта ПДн)</asp:ListItem>
    </asp:RadioButtonList>
    <br />
    <asp:Label ID="Label7" runat="server" Font-Bold="True" Font-Italic="True" 
        Text="По объему  ПДн, которые предоставляются  сторонним пользователям ИСПДн без предварительной обработки"></asp:Label>
    <asp:RadioButtonList ID="RadioButtonListObiem" runat="server" BorderWidth="1px" 
        Width="687px">
        <asp:ListItem>ИСПДн, предоставляющая всю базу данных </asp:ListItem>
        <asp:ListItem>ИСПДн, предоставляющая часть ПДн</asp:ListItem>
        <asp:ListItem>ИСПДн, не предоставляющая никакой информации</asp:ListItem>
    </asp:RadioButtonList>
    <br />
    <asp:Label ID="LabelErrorIshodHarakteristik" runat="server" Font-Bold="True" 
        Font-Italic="False" ForeColor="Red"></asp:Label>
    <br />
    <br />
    <asp:Button ID="ButtonIshodZaschita" runat="server" Height="50px" 
        onclick="ButtonIshodZaschita_Click" Text="Исходная защищенность" 
        Width="220px" />
    <br />
    <br />
    <br />
</asp:Content>



