<%@ Page Language="C#"  MasterPageFile="~/Site_E.Master" AutoEventWireup="true" CodeBehind="Canvas.aspx.cs" Inherits="GPM.Canvas" %>

<asp:Content ID="content11" ContentPlaceHolderID="HeadContent" runat="server">
    <title>Canvas</title>
    <script src="../Script/jquery.min.js"></script>
    <script src="Script/jquery.min.js"></script>
    <script src="~/Script/jquery.min.js"></script>
    <script src="../Script/DePAS_Util_E.js"></script>
    <script src="Script/DePAS_Util_E.js"></script>
    <script src="~/Script/DePAS_Util_E.js"></script>
    <script src="Script/Chart.js"></script>
       <style type="text/css">
        
        .auto-style16 {
            width: 100%;
            height: 55px;
        }

        .col-lg-4 {
            height: 23px;
            width: 1498px;
        }
        .auto-style24 {
            width: 57%;
        }
           .auto-style28 {
               background-color: #0000FF;
               color: white;
               padding: 1px 0;
               text-align: center;
               text-decoration: none;
               font-size: 12px;
               margin: 4px 0;
               width: 20%;
               height: 5px;
           }
        .auto-style21 {
            width: 29%;
            height: 5px;
        }
           .auto-style29 {
               background-color: #0000FF;
               color: white;
               padding: 1px 0;
               text-align: center;
               text-decoration: none;
               font-size: 12px;
               margin: 4px 0;
               width: 10%;
               height: 5px;
           }
        .auto-style23 {
            width: 64%;
            height: 5px;
        }
        .auto-style26 {
            width: 29%;
        }
        
        .auto-style5 {
               width: 64%;
           }

        .auto-style17 {
            color: white;
            text-align: center;
            text-decoration: none;
            font-size: 12px;
            width: 20%;
            height: 26px;
            margin: 4px 0;
            padding: 1px 0;
            background-color: #0000FF;
        }
        .auto-style27 {
            height: 26px;
            width: 29%;
        }
        .auto-style18 {
            height: 26px;
               width: 64%;
           }
           .auto-style30 {
               width: 951px;
           }
           .auto-style31 {
               background-color: #0000FF;
               color: white;
               padding: 1px 0;
               text-align: center;
               text-decoration: none;
               font-size: 12px;
               margin: 4px 0;
               width: 10%;
               height: 26px;
           }
           </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
                    <table class="auto-style16">
            <tr>
                <td  style="background-color: blue" class="td_t"  >
                <asp:Label ID="hdrCanvas" runat="server" Text="Canvas" Font-Bold="True" ForeColor="White" Font-Size="X-Large" Width="95%"></asp:Label>
        </td>
        </table>
        <table class="auto-style16">
            <tr>
                <td class="auto-style24">
                    <asp:Label ID="lbltitle1" runat="server" Text="Enter search condition." Font-Bold="True" ForeColor="Red" Font-Size="Large" BorderColor="Black" BorderWidth="4px" BorderStyle="Solid" Width="90%" style="margin-left: 75px"></asp:Label>
                </td>
                <td style="width: 5%">
                    <input id="btnreturn" type="button" value="Return" onclick="returnHome(01);" class="button" runat="server" /></td>
        </table>
                    <br />
&nbsp;
        <table runat="server" id="tbsearch" class="auto-style30" border="0" CssClass="text-center">
            <tr>
                <td class="auto-style28">
                    <asp:Label ID="hdrStockoutdate" runat="server" Text="Stock out date" Width="100%"></asp:Label>
                </td>
                <td style="text-align: left" class="auto-style21">
                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                    <asp:TextBox ID="txtdateF" runat="server" Width="85%"></asp:TextBox>
                </td>
                <td class="auto-style29">
                    <asp:Label ID="hdrTo" runat="server" Text="To :"></asp:Label>
                </td>
                <td class="auto-style23">
                    <asp:TextBox ID="txtdateT" runat="server" Width="95%"> </asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style17">
                    MachineCode(*)</td>
                <td style="text-align: left" class="auto-style27">
                    <asp:TextBox ID="txtPartsNumber" runat="server" Width="85%"></asp:TextBox>
                </td>
                <td class="auto-style31">
                    SectionCode(*)</td>
                <td class="auto-style18">
                    <asp:TextBox ID="txtPartsModel" runat="server" Width="95%"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="criteria-label" style="width: 20%;">
                    MachineName(*)</td>
                <td style="text-align: left" class="auto-style26">
                    <asp:TextBox ID="txtItemNumber" runat="server" Width="85%"></asp:TextBox>
                </td>
                <td class="criteria-label" style="width: 20%">
                    SectionName(*)</td>
                <td class="auto-style5">
                    <asp:TextBox ID="txtPartsName" runat="server" Width="95%"> </asp:TextBox>
                </td>
            </tr>
        </table>
                    <asp:Button ID="Button9" CssClass="button" runat="server" Text="Search"  />
                    <asp:Button ID="Button10" CssClass="button" runat="server" Text="Clear" />
                    <br />
  <%--<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.1.3/Chart.bundle.js"></script>
  <style>
    canvas {
      -moz-user-select: none;
      -webkit-user-select: none;
      -ms-user-select: none;
    }
  </style>
  <div style="width: 100%">
    <canvas id="canvas"></canvas>
  </div>
  <script>
      var barChartData = {
          labels: ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"],
          datasets: [{
              label: 'Section',
              backgroundColor: "#ef0000",
              yAxisID: "bar-y-axis",
              data: [
                   <%=lineData%>
                  ]
              }]
      };

      window.onload = function () {
          var ctx = document.getElementById("canvas").getContext("2d");
          var myChart = new Chart(ctx,  {
              type: 'bar',
              data: barChartData,
              options: {
                  title: {
                      display: true,
                      text: "1234"
                  },
                  tooltips: {
                      mode: 'label'
                  },
                  onclick: {
                    //  alert("");
                  },
                  responsive: true,
                  scales: {
                      xAxes: [{
                          stacked: true,
                      }],
                      yAxes: [{
                          stacked: false,
                          ticks: {
                              beginAtZero: true,
                              min: 0,
                              max: 100
                          }
                      }, {
                          id: "bar-y-axis",
                          stacked: true,
                          display: false, //optional
                          ticks: {
                             beginAtZero: false,
                              min: 0,
                              max: 100
                          },
                          type: 'linear'
                      }]
                  }
              }
          });
          onClick: function (click) {
              var activePoints = canvas.getElementsAtEvent(e);
              var selectedIndex = activePoints[0]._index;
              console.log(this.data.datasets[0].data[selectedIndex]);
      };
  </script>--%>
    <div class="chartCard">
      <div class="chartBox">
        <canvas id="myChart"></canvas>
      </div>
    </div>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/chartjs-plugin-datalabels/2.0.0/chartjs-plugin-datalabels.min.js"
        integrity="sha512-R/QOHLpV1Ggq22vfDAWYOaMd5RopHrJNMxi8/lJu8Oihwi4Ho4BRFeiMiCefn9rasajKjnx9/fTQ/xkWnkDACg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script>
        // setup 
        const data = {
            labels: ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"],
            datasets: [{
                    label: 'test',
                backgroundColor: "#ef0000",
                data: [
                ]
            }, {
                label: '000',
                    backgroundColor: "#03586A",
                data: [
                    ]
                }
                , {
                    label: '111',
                    backgroundColor: "#03586A",
                    data: [
                    ]
                }
                , {
                    label: '123',
                    backgroundColor: "#EE7600",
                    data: [
                    ]
                }, {
                    label: '130',
                    backgroundColor: "#FF3030",
                    data: [
                    ]
                }, {
                    label: '140',
                    backgroundColor: "#FF8247",
                    data: [
                    ]
                }, {
                    label: '150',
                    backgroundColor: "#8B3A3A",
                    data: [
                    ]
                }, {
                    label: '160',
                    backgroundColor: "#8B6969",
                    data: [
                    ]
                }, {
                    label: '170',
                    backgroundColor: "#CD6839",
                    data: [
                    ]
                }, {
                    label: '171',
                    backgroundColor: "#FFD39B",
                    data: [
                    ]
                }, {
                    label: '182',
                    backgroundColor: "#FFD39B",
                    data: [
                    ]
                }, {
                    label: '200',
                    backgroundColor: "#8B4726",
                    data: [
                    ]
                }, {
                    label: '201',
                    backgroundColor: "#FFC1C1",
                    data: [
                    ]
                }, {
                    label: '202',
                    backgroundColor: "#CD9B1D",
                    data: [
                    ]
                }, {
                    label: '000',
                    backgroundColor: "#CDBE70",
                    data: [ 12,3,4,9,8,26,18
                    ]
                }, {
                    label: '111',
                    backgroundColor: "#008B00",
                    data: [ 1,2,3,4,5,6,7,9,8
                    ]
                }, {
                    label: 'DP17',
                    backgroundColor: "#00C5CD",
                    data: [
                            <%=lineData%>
                            ]
                }]
        };

        // config 
        const config = {
            type: 'bar',
            data,
            options: {
                borderWidth: 1,
                title: {
                    display: true,
                    text: 'Section',
                },
                responsive: true,
                scales: {
                    x: {
                        stacked: true
                    },
                    y: {
                        beginAtZero: true,
                        stacked: true,
                    }
                },
                plugins: {
                    tooltip: {
                        enaled: false
                    },
                    datalabels: {
                        formatter: (value, context) => {
                            const sumValue = context.chart.config.data.datasets.map((datapoint) => {
                                return datapoint.data[context.datalabels];
                            })
                            function totalSum(total, datapoint) {
                                return total + datapoint;
                            }
                            let sum = sumValue.reduce(totalSum, 0);
                            return `${value} of ${sum}`;
                        }
                    }
                }
            },
            plugins: [ChartDataLabels]
        };

        // render init block
        const ctx = document.getElementById('myChart');
        const myChart = new Chart(
            ctx,
            config
        );

        function clickhandler(click) {
            const points = myChart.getElementsAtEventForMode(click, 'nearest', { intersect: true }, true)
            if (points.length) {
                const firstPoint = points[0];
                console.log(points)
                console.log(firstPoint)
                const value = myChart.data.datasets[firstPoint.datasetIndex].data[firstPoint.index];

                console.log(value.products.link);
                window.open(value.products.link);
            }
        }
        ctx.onclick = clickhandler;
    </script>
    <table>
    <tr>
        <td>
            <div>
                <asp:GridView ID="gvLineChart" runat="server" AutoGenerateColumns="false" AlternatingRowStyle-BackColor="#b3ffff"
                        BorderWidth="1px" 
                        HeaderStyle-ForeColor="#ffffff" HeaderStyle-BackColor="#57C9E1" AllowPaging="true" HeaderStyle-BorderWidth="1"
                        Width="100%" ShowHeaderWhenEmpty="True" HeaderStyle-Height="1px">
                    <Columns>
                            <asp:TemplateField HeaderText="Select" ItemStyle-Width="7%" HeaderStyle-Width="7%" HeaderStyle-BorderWidth="1" HeaderStyle-BorderColor="Black" ItemStyle-BorderColor="Black" ItemStyle-BorderWidth="1px">
                                <ItemTemplate>
                                   <asp:Label ID="lblSectionCode" runat="server" Text='<%# Eval("PartsNumber") %>' Width="80px"></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Width="4px"></HeaderStyle>

                                <ItemStyle BorderColor="Black" BorderWidth="1px" Width="7%"></ItemStyle>
                            </asp:TemplateField>
                        </Columns>
            </asp:GridView>
            </div>
        </td>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" AlternatingRowStyle-BackColor="#b3ffff"
                        BorderWidth="1px" 
                        HeaderStyle-ForeColor="#ffffff" HeaderStyle-BackColor="#57C9E1" AllowPaging="true" HeaderStyle-BorderWidth="1"
                        Width="100%" ShowHeaderWhenEmpty="True" HeaderStyle-Height="1px">
                    <Columns>
                            <asp:TemplateField HeaderText="Select" ItemStyle-Width="7%" HeaderStyle-Width="7%" HeaderStyle-BorderWidth="1" HeaderStyle-BorderColor="Black" ItemStyle-BorderColor="Black" ItemStyle-BorderWidth="1px">
                                <ItemTemplate>
                                   <asp:Label ID="lblSection" runat="server" Text='<%# Eval("SectionCode") %>' Width="80px"></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Width="4px"></HeaderStyle>

                                <ItemStyle BorderColor="Black" BorderWidth="1px" Width="7%"></ItemStyle>
                            </asp:TemplateField>
                        </Columns>
            </asp:GridView>
    </tr>
</table> 
    </asp:Content>