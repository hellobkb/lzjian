
mui.init({
	pullRefresh: {
		container: '#content', //待刷新区域标识，querySelector能定位的css选择器均可，比如:id、.class等
		down :{
			callback: pulldownRefresh //必选，刷新函数
		}
	}
});

//下拉刷新
function pulldownRefresh(){
	setTimeout(function() {
		initData();
		mui("#content").pullRefresh().endPulldownToRefresh();
	}, 1500) 
}

var line_data_x = "{$line_data_x}";
var line_data_y = "{$line_data_y}";
var bar_data_x = "{$bar_data_x}";
var bar_data_y = "{$bar_data_y}";



//Dom 加载完成
mui.ready(function(){
	initData();
});

function initData(){



	var getOption = function(chartType) {
		var chartOption = chartType == 'line' ? {
			tooltip: {
				trigger: 'axis',
				formatter: '日期：{b}<br>数量：${c}'
			},
			legend: {
				data: ['']
			},
			grid: {
				x: 35,
				x2: 10,
				y: 30,
				y2: 25
			},
			toolbox: {

			},
			calculable: false,
			xAxis: [{
				axisLabel: {},
				type: 'category',
				data: line_data_x
			}],
			yAxis: [{
				type: 'value',
				splitArea: {
					show: true
				}
			}],
			series: [{
				name: '',
				type: chartType,
				data: line_data_y
			}]
		} : {
			tooltip: {
				trigger: 'axis',
				formatter: '{b}：${c}'
			},
			 
			legend: {
				show: false,
				data: '0'

			},
			grid: {
				x: 25,
				x2: 10,
				y: 20,
				y2: 25,
				borderWidth: 0
			},
			toolbox: {

			},
			calculable: false,
			xAxis: [{
				splitLine: {
					show: false //辅助线
				},
				type: 'category',
				data: bar_data_x,
				axisLabel: {
					interval: 0, //时间轴间隔
				},
				axisLine: {
					lineStyle: {
						color: '#cccccc'
					}
				}
			}],
			yAxis: [{
				show: false,
				type: 'value'
			}],
			series: [{
				type: chartType,
				clipOverflow: false,
				barWidth: '30',
				itemStyle: {
					normal: {
						label: {
							show: false, // 上方显示
							textStyle: {}
						}
					}
				},
				data: bar_data_y,
				itemStyle: {
					normal: {
						color: function(params) {
							 
						}
					}
				}

			}]
		};
		return chartOption;
	};


	var lineChart = echarts.init(document.getElementById('lineChart'));
	lineChart.setOption(getOption('line'));
	var barChart = echarts.init(document.getElementById('barChart'));
	barChart.setOption(getOption('bar'));


}

 