/**
 * 
 */
function showTime()
{
	var now = new Date();
	var year = now.getFullYear();
	var month = now.getMonth();
	var date = now.getDate();
	var day = now.getDay();
	var hour = now.getHours();
	var minutes = now.getMinutes();
	var second = now.getSeconds();
	month<10?month='0'+month:month;
	month=month+1;
	hour<10?hour='0'+hour:hour;
	minutes<10?minutes='0'+minutes:minutes;
	second<10?second='0'+second:second;
	var now_time ='当前时间:' + year + '年' + month + '月' + date + '日'+ hour +':'+minutes+':'+''+ second;
	document.getElementById('showtime').innerHTML=now_time;
	setTimeout("showTime();",1000);//每隔1秒刷新一次
 } 