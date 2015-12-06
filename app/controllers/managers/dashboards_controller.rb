class Managers::DashboardsController < ManagerController

  expose(:owner_demographics){ owner_demographics  }
  expose(:monthly_applications){ monthly_applications  }
  expose(:monthly_expenses){ monthly_expenses }
  expose(:managers){ Manager.where(deleted_by_id: nil).order("id DESC") }

  def index
  end

  private
  def owner_demographics
    @chart = LazyHighCharts::HighChart.new('pie') do |f|
          #f.chart({:defaultSeriesType=>"pie" , :margin=> [50, 200, 60, 170]} )
          series = {
                  :type=> 'pie',
                  :name=> 'Community Names',
                  colorByPoint: true,
                  :data=> [
                      ['Owners', rand(1000)],
                      ['Tenants',rand(100)],
                      ['Vacant', rand(100)],
                  ]
          }
          f.series(series)
          f.options[:title][:text] = "Owner Demographics as 12/06/2015"
          #f.legend(:layout=> 'vertical',:style=> {:left=> 'auto', :bottom=> 'auto',:right=> '50px',:top=> '100px'})
          #f.legend(:align => 'right', :verticalAlign => 'top', :y => 75, :x => -50, :layout => 'vertical',)
          f.tooltip({pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'})
          f.plot_options(:pie=>{
            :allowPointSelect=>true,
            :cursor=>"pointer" ,
            :dataLabels=>{
              :enabled=>true,
              :color=>"black",
              :style=>{
                :font=>""
              },
              format: '<b>{point.name}</b>: {point.percentage:.1f} %',
            },
              showInLegend: true
          })
    end
  end

  def monthly_applications
    @chart = LazyHighCharts::HighChart.new('graph') do |f|
      f.title(:text => "Monthly Applications")
      f.xAxis(:categories => ['2014', '2015', 'Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'])
      f.series(:name => "Owners", :yAxis => 0,
               :data => [rand(100...1000),
                         rand(100.1000),
                         rand(100.1000),
                         rand(100.1000),
                         rand(100.1000),
                         rand(100.1000),
                         rand(100.1000),
                         rand(100.1000),
                         rand(100.1000),
                         rand(100.1000),
                         rand(100.1000),
                         rand(100.1000),
                         rand(100.1000),
                         rand(100.1000),
                         ])
      f.series(:name => 'Tenant', :yAxis => 0,
              :data => [rand(10.100),
                        rand(10.100),
                        rand(10.100),
                        rand(10.100),
                        rand(10.100),
                        rand(10.100),
                        rand(10.100),
                        rand(10.100),
                        rand(10.100),
                        rand(10.100),
                        rand(10.100),
                        rand(10.100),
                        rand(10.100),
                        rand(10.100),
                        ])
      f.yAxis [
        {:title => {:text => "Funded Deals", :margin => 70} },
      ]

      f.legend(:align => 'right', :verticalAlign => 'top', :y => 75, :x => -50, :layout => 'vertical',)
      f.chart({:defaultSeriesType=>"column"})
    end
  end

  def monthly_expenses
    @chart = LazyHighCharts::HighChart.new('graph') do |f|
      f.title(:text => "Monthly Expenses")
      f.xAxis(:categories => ['2014', '2015', 'Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'])
      f.series(:name => "Owners", :yAxis => 0,
               :data => [rand(100...1000),
                         rand(100.1000),
                         rand(100.1000),
                         rand(100.1000),
                         rand(100.1000),
                         rand(100.1000),
                         rand(100.1000),
                         rand(100.1000),
                         rand(100.1000),
                         rand(100.1000),
                         rand(100.1000),
                         rand(100.1000),
                         rand(100.1000),
                         rand(100.1000),
                         ])
      f.series(:name => 'Tenant', :yAxis => 0,
              :data => [rand(10.100),
                        rand(10.100),
                        rand(10.100),
                        rand(10.100),
                        rand(10.100),
                        rand(10.100),
                        rand(10.100),
                        rand(10.100),
                        rand(10.100),
                        rand(10.100),
                        rand(10.100),
                        rand(10.100),
                        rand(10.100),
                        rand(10.100),
                        ])
      f.yAxis [
        {:title => {:text => "Funded Deals", :margin => 70} },
      ]

      f.legend(:align => 'right', :verticalAlign => 'top', :y => 75, :x => -50, :layout => 'vertical',)
      f.chart({:defaultSeriesType=>"column"})
    end
  end
end

