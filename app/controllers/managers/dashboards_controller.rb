class Managers::DashboardsController < ManagerController

  expose(:owner_demographics){ owner_demographics  }
  expose(:accounts_and_residents){ accounts_and_residents  }
  expose(:monthly_expenses){ monthly_expenses }
  expose(:monthly_revenue){ monthly_revenue }
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
                      ['Applewood II', rand(100)],
                      ['Karanda VII',rand(100)],
                      ['Golden Tree', rand(100)],
                      ['Zaldes Corp', rand(100)],
                  ]
          }
          f.series(series)
          f.options[:title][:text] = "Communities by Size"
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

  def accounts_and_residents
    @chart = LazyHighCharts::HighChart.new('column') do |f|
      f.title(:text => "Owners, Tenants and Vacant Units")
      f.xAxis(
        :categories => ['Applewood II', 'Karanda VII', 'Golder Tree', 'Zalders Corp']
      )
      f.yAxis [
        {
          min: 0,
          stackLabels: {enabled: true},
        },
        {:title => {:text => "Residents", :margin => 70} },
      ]

      f.series(:name => "Owners", :yAxis => 0, :data => [rand(100)+20,rand(100)+20,rand(100)+20,rand(100)+20 ])
      f.series(:name => "Renters", :yAxis => 0, :data => [rand(50) + 10,rand(50)+10,rand(50)+10,rand(50)+10 ])
      f.series(:name => "Vacant", :yAxis => 0, :data => [rand(10) + 10 ,rand(10) + 10 ,rand(10) + 10,rand(10)+10 ])


      f.chart({:defaultSeriesType=>"column"})
      f.plot_options(:column=>{
        stacking: 'normal',
        dataLabels: {
          enabled: true,
          style: { textShadow: '0 0 3px black' },
          color: 'white',
        }
      })
    end
  end

  def monthly_expenses
    @chart = LazyHighCharts::HighChart.new('graph') do |f|
      f.title(:text => "Monthly Expenses")
      f.xAxis(:categories => ['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'])
      f.series(:name => "Staff", :yAxis => 0,
               :data => [rand(100...1000),
                         rand(100...1000),
                         rand(100...1000),
                         rand(100...1000),
                         rand(100...1000),
                         rand(100...1000),
                         rand(100...1000),
                         rand(100...1000),
                         rand(100...1000),
                         rand(100...1000),
                         rand(100...1000),
                         rand(100...1000),
                         rand(100...1000),
                         rand(100...1000),
                         ])
      f.series(:name => "Tech", :yAxis => 0,
               :data => [rand(100...1000),
                         rand(100...1000),
                         rand(100...1000),
                         rand(100...1000),
                         rand(100...1000),
                         rand(100...1000),
                         rand(100...1000),
                         rand(100...1000),
                         rand(100...1000),
                         rand(100...1000),
                         rand(100...1000),
                         rand(100...1000),
                         rand(100...1000),
                         rand(100...1000),
                         ])
      f.series(:name => "Supplies", :yAxis => 0,
               :data => [rand(100...1000),
                         rand(100...1000),
                         rand(100...1000),
                         rand(100...1000),
                         rand(100...1000),
                         rand(100...1000),
                         rand(100...1000),
                         rand(100...1000),
                         rand(100...1000),
                         rand(100...1000),
                         rand(100...1000),
                         rand(100...1000),
                         rand(100...1000),
                         rand(100...1000),
                         ])
      f.series(:name => "Misc", :yAxis => 0,
               :data => [rand(100...1000),
                         rand(100...1000),
                         rand(100...1000),
                         rand(100...1000),
                         rand(100...1000),
                         rand(100...1000),
                         rand(100...1000),
                         rand(100...1000),
                         rand(100...1000),
                         rand(100...1000),
                         rand(100...1000),
                         rand(100...1000),
                         rand(100...1000),
                         rand(100...1000),
                         ])
      f.yAxis [
        {:title => {:text => "Total", :margin => 70} },
      ]

      f.chart({:defaultSeriesType=>"column"})
    end
  end

  def monthly_revenue
    @chart = LazyHighCharts::HighChart.new('graph') do |f|
      f.title(:text => "Monthly Expenses")
      f.xAxis(:categories => ['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'])
      f.series(:name => "Applewood II", :yAxis => 0,
               :data => [rand(100...1000),
                         rand(100...1000),
                         rand(100...1000),
                         rand(100...1000),
                         rand(100...1000),
                         rand(100...1000),
                         rand(100...1000),
                         rand(100...1000),
                         rand(100...1000),
                         rand(100...1000),
                         rand(100...1000),
                         rand(100...1000),
                         rand(100...1000),
                         rand(100...1000),
                         ])
      f.series(:name => "Karanda VII", :yAxis => 0,
               :data => [rand(100...1000),
                         rand(100...1000),
                         rand(100...1000),
                         rand(100...1000),
                         rand(100...1000),
                         rand(100...1000),
                         rand(100...1000),
                         rand(100...1000),
                         rand(100...1000),
                         rand(100...1000),
                         rand(100...1000),
                         rand(100...1000),
                         rand(100...1000),
                         rand(100...1000),
                         ])
      f.series(:name => "Golder Tree", :yAxis => 0,
               :data => [rand(100...1000),
                         rand(100...1000),
                         rand(100...1000),
                         rand(100...1000),
                         rand(100...1000),
                         rand(100...1000),
                         rand(100...1000),
                         rand(100...1000),
                         rand(100...1000),
                         rand(100...1000),
                         rand(100...1000),
                         rand(100...1000),
                         rand(100...1000),
                         rand(100...1000),
                         ])
      f.series(:name => "Zalders Corp", :yAxis => 0,
               :data => [rand(100...1000),
                         rand(100...1000),
                         rand(100...1000),
                         rand(100...1000),
                         rand(100...1000),
                         rand(100...1000),
                         rand(100...1000),
                         rand(100...1000),
                         rand(100...1000),
                         rand(100...1000),
                         rand(100...1000),
                         rand(100...1000),
                         rand(100...1000),
                         rand(100...1000),
                         ])
      f.yAxis [
        {:title => {:text => "Total", :margin => 70} },
      ]

      f.chart({:defaultSeriesType=>"column"})
    end
  end
end

