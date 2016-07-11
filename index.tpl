{include file="~widgets/billboard.tpl"}       
  <div class="row">
    <div class="col-md-9">
      {include file="~widgets/visits.tpl"} 
    </div>
    <div class="col-md-3">
      <section class="widget">
          <div class="list-group">
              <a href="#" class="list-group-item">
                  <i class="fa fa-chevron-right pull-right"></i>
                  <span class="badge badge-success">
                   {$PAGE_VIEWS} 
                  </span>
                  <i class="fa fa-desktop"></i>
                  Page Views
              </a>
              <a href="#" class="list-group-item">
                  <i class="fa fa-chevron-right pull-right"></i>
                  <span class="badge badge-danger">
                    {$AVG_TIME}
                  </span>
                  <i class="fa fa-clock-o fa-spin"></i> 
                  Average Minutes
              </a>
              <a href="#" class="list-group-item">
                  <i class="fa fa-chevron-right pull-right"></i>
                  <span class="badge badge-default">
                    {$NUM_ONLINE}
                  </span>
                  <i class="fa fa-user"></i>
                  Online
              </a>
              <a href="#" class="list-group-item">
                  <i class="fa fa-chevron-right pull-right"></i>
                  <span class="badge badge-info">
                    {$UNIQUE_HITS} 
                  </span>
                  <i class="fa fa-smile-o"></i>
                  Unique Hits
              </a>
              <a href="#" class="list-group-item">
                  <i class="fa fa-chevron-right pull-right"></i>
                  <!-- <span class="badge badge-warning">7</span> -->
                  <i class="fa fa-plus"></i>&nbsp;
                  Another Stat.
              </a>
              <a href="#" class="list-group-item">
                  <i class="fa fa-chevron-right pull-right"></i>
                  <!-- <span class="badge badge-warning">7</span> -->
                  <i class="fa fa-plus"></i>&nbsp;
                  Customize this panel...
              </a>
          </div>
      </section>
    </div>
  </div>
  <div class="row">

      <!--  <div class="col-md-2 col-sm-4 col-xs-6">
          <div class="box">
              <div class="icon">
                  <i class="fa fa-shopping-cart"></i>
              </div>
              <div class="description">
                  <strong>410</strong> orders
              </div>
          </div>
      </div>
      <div class="col-md-2 col-sm-4 col-xs-6">
          <div class="box">
              <div class="big-text">
                  6.42%
              </div>
              <div class="description">
                  <i class="fa fa-arrow-right"></i>
                  Traffic Growth
              </div>
          </div>
      </div> -->
  </div>
  <div class="row">
    <div class="col-md-6">
    </div>
  </div>
    <div class="row">
        <div class="col-md-3 col-sm-6">
            <section class="widget large">
                <header>
                    <h4><i class="fa fa-home"></i> Top sources</h4>
                </header>
                <div class="body">
                    <div id="sources-chart-pie" class="chart pie-chart">
                        <svg></svg>
                    </div>
                </div>
                <footer id="data-chart-footer" class="pie-chart-footer">
                </footer>
            </section>
        </div>
        <div class="col-md-9 col-sm-6">
            <section class="widget large">
                <header>
                    <h4><i class="fa fa-bar-chart-o"></i> Bar Chart <small style="display: inline !important;" class="hidden-xs">Refresh page to see different data</small></h4>
                </header>
                <div id="sources-chart-bar" class="body chart">
                    <svg></svg>
                </div>
            </section>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6">
            <section class="widget large">
                <header>
                    <h4><i class="fa fa-bullhorn"></i> Stream Stacked Chart</h4>
                </header>
                <div id="sources-chart-stacked" class="body chart">
                    <svg></svg>
                </div>
            </section>
        </div>
        <div class="col-md-6">
            <section class="widget large">
                <header>
                    <h4><i class="fa fa-arrow-circle-o-right"></i> Line Chart</h4>
                </header>
                <div id="sources-chart-line" class="body chart">
                    <svg></svg>
                </div>
            </section>
        </div>
    </div>

        <div class="row">
            <div class="col-md-4">
                <section class="widget normal">
                    <header>
                        <h4>
                            <i class="fa fa-arrow-right"></i>
                            Progressbars
                        </h4>
                    </header>
                    <div class="body">
                        <h5 class="no-margin weight-normal">Simple one</h5>
                        <div class="progress">
                            <div class="progress-bar" style="width: 60%;"></div>
                        </div>
                        <h5 class="no-margin weight-normal">Styled ones</h5>
                        <div class="progress">
                            <div class="progress-bar progress-bar-inverse" style="width: 33%;"></div>
                        </div>
                        <div class="progress">
                            <div class="progress-bar progress-bar-warning" style="width: 52%;"></div>
                        </div>
                        <div class="progress">
                            <div class="progress-bar progress-bar-danger" style="width: 43%;"></div>
                        </div>
                    </div>
                </section>
            </div>
            <div class="col-md-4">
                <section class="widget normal">
                    <header>
                        <h4>
                            <i class="fa fa-caret-right"></i>
                            Small ones
                        </h4>
                    </header>
                    <div class="body">
                        <h5 class="no-margin weight-normal">Colors</h5>
                        <div class="progress progress-small">
                            <div class="progress-bar progress-bar-inverse" style="width: 23%;"></div>
                        </div>
                        <div class="progress progress-small">
                            <div class="progress-bar progress-bar-warning" style="width: 76%;"></div>
                        </div>
                        <div class="progress progress-small">
                            <div class="progress-bar progress-bar-success" style="width: 43%;"></div>
                        </div>
                        <div class="progress progress-small">
                            <div class="progress-bar progress-bar-danger" style="width: 53%;"></div>
                        </div>
                        <h5 class="no-margin weight-normal">Default progressbar</h5>
                        <div class="progress progress-small">
                            <div class="progress-bar" style="width: 60%;"></div>
                        </div>
                    </div>
                </section>
            </div>
            <div class="col-md-4">
                <section class="widget normal">
                    <header>
                        <h4>
                            <i class="fa fa-angle-right"></i>
                            Some extensions
                        </h4>
                    </header>
                    <div class="body">
                        <h5 class="no-margin weight-normal">With embedded percentage</h5>
                        <div class="progress">
                            <div class="progress-bar" style="width: 79%;">79%</div>
                        </div>
                        <h5 class="no-margin weight-normal">Active one</h5>
                        <div class="progress progress-striped active">
                            <div class="progress-bar progress-bar-warning" style="width: 51%;">51%</div>
                        </div>
                        <h5 class="no-margin weight-normal">Inversed progress-bar</h5>
                        <div class="progress progress-striped active">
                            <div class="progress-bar progress-bar-inverse" style="width: 64%;">64%</div>
                        </div>
                    </div>
                </section>
            </div>
        </div>
        <div class="row">
            <div class="col-md-3 col-md-offset-3">
                <section class="widget">
                    <header>
                        <h4>
                            <i class="fa fa-magnet"></i>
                            Server Overview
                        </h4>
                    </header>
                    <div class="body">
                        <ul class="server-stats">
                            <li>
                                <div class="key pull-right">CPU</div>
                                <div class="stat">
                                    <div class="info">60% / 37&deg;C / 3.3 Ghz</div>
                                    <div class="progress progress-small">
                                        <div class="progress-bar" style="width: 70%;"></div>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="key pull-right">Mem</div>
                                <div class="stat">
                                    <div class="info">29% / 4GB (16 GB)</div>
                                    <div class="progress progress-small">
                                        <div class="progress-bar progress-bar-warning" style="width: 29%;"></div>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="key pull-right">LAN</div>
                                <div class="stat">
                                    <div class="info">6 Mb/s <i class="fa fa-caret-down"></i> &nbsp; 3 Mb/s <i class="fa fa-caret-up"></i></div>
                                    <div class="progress progress-small">
                                        <div class="progress-bar progress-bar-danger" style="width: 48%;"></div>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="key pull-right">Access</div>
                                <div class="stat">
                                    <div class="info">17 Mb/s <i class="fa fa-caret-up"></i> &nbsp; (+18%)</div>
                                    <div class="progress progress-small">
                                        <div class="progress-bar progress-bar-success" style="width: 64%;"></div>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </section>
            </div>
            <div class="col-md-3">
                <section class="widget widget-overview">
                    <header>
                        <h4>
                            <i class="fa fa-lightbulb"></i>
                            Stats Overview
                        </h4>
                    </header>
                    <div class="body">
                        <ul class="overall-stats">
                            <li>
                                <div class="icon pull-left">
                                    <i class="fa fa-user"></i>
                                </div>
                                <span class="key">Total Users</span>
                                <div class="value pull-right">
                                    <span class="badge badge-danger">7 541</span>
                                </div>
                            </li>
                            <li>
                                <div class="icon pull-left">
                                    <i class="fa fa-shopping-cart"></i>
                                </div>
                                <span class="key">Total Orders</span>
                                <div class="value pull-right">
                                    <span class="badge badge-warning">2 876</span>
                                </div>
                            </li>
                            <li>
                                <div class="icon pull-left">
                                    <i class="fa fa-desktop"></i>
                                </div>
                                <span class="key">Desktop</span>
                                <div class="value pull-right">
                                    <span class="badge badge-info">68%</span>
                                </div>
                            </li>
                            <li>
                                <div class="icon pull-left">
                                    <i class="fa fa-phone"></i>
                                </div>
                                <span class="key">Mobile</span>
                                <div class="value pull-right">
                                    <span class="badge badge-default">32%</span>
                                </div>
                            </li>
                        </ul>
                    </div>
                </section>
            </div>
        </div>
    </div>
    {$js = "/x/html/layout/watchtower/js"}
    <!-- page libs -->
    <script src="{$js}/nvd3-custom-lb1.0/lib/d3.v2.min.js"></script>
    <script src="{$js}/nvd3-custom-lb1.0/nv.d3.custom.js"></script>

    <!-- nvd3 models -->
    <script src="{$js}/nvd3-custom-lb1.0/src/models/scatter.js"></script>
    <script src="{$js}/nvd3-custom-lb1.0/src/models/axis.js"></script>
    <script src="{$js}/nvd3-custom-lb1.0/src/models/legend.js"></script>
    <script src="{$js}/nvd3-custom-lb1.0/src/models/stackedArea.js"></script>
    <script src="{$js}/nvd3-custom-lb1.0/src/models/stackedAreaChart.js"></script>
    <script src="{$js}/nvd3-custom-lb1.0/src/models/line.js"></script>
    <script src="{$js}/nvd3-custom-lb1.0/src/models/pie.js"></script>
    <script src="{$js}/nvd3-custom-lb1.0/src/models/pieChartTotal.js"></script>
    <script src="{$js}/nvd3-custom-lb1.0/stream_layers.js"></script>
    <script src="{$js}/nvd3-custom-lb1.0/src/models/lineChart.js"></script>
    <script src="{$js}/nvd3-custom-lb1.0/src/models/multiBar.js"></script>
    <script src="{$js}/nvd3-custom-lb1.0/src/models/multiBarChart.js"></script>

    <script src="/x/html/layout/watchtower/js/index.js"></script>

    <!-- page specific -->
    <script src="/x/html/layout/watchtower/js/stats.js"></script>
    <script>
        nv.addGraph(function() {
            $.ajax({
                url : './analytics/index/90/.json',
                type: "POST", 
                dataType: 'json',
                success:function(data, textStatus, jqXHR){
                    //data: return data from server
                    DATA = data.data;
                    var chart = nv.models.lineChart() 
                        .margin({ top: 0, bottom: 25, left: 25, right: 0})
                        .showLegend(true)
                        .color([
                            $teal, $green
                            //'#618fb0', '#61b082'
                        ]);

                    chart.legend.margin({ top: 3 });

                    chart.yAxis
                        .showMaxMin(false)
                        .tickFormat(d3.format(',.f'));

                    chart.xAxis
                        .showMaxMin(false)
                        .tickFormat(function(d) { return d3.time.format('%b %d')(new Date(d)) });
                    //var data = testData(['Unique', 'Visits'], 30);


                    //data[0].area = true;
                    d3.select('#visits-chart svg')
                        .datum(data.data)
                        .transition().duration(500)
                        .call(chart);

                    PjaxApp.onResize(chart.update);
                }
            });   
        });
    
    </script>
