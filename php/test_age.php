<?php
function getAgeByIdcard($idcard){
	if($idcard==''){
		return 0;
	}
	if(15==strlen($idcard)){
		$birdaydate = '19'.substr($idcard,6,6);
	}else{
		$birdaydate = substr($idcard,6,8);
	}
	$date=strtotime($birdaydate);//获得出生年月日的时间戳
	$today=strtotime('today');//获得今日的时间戳
	$diff=floor(($today-$date)/86400/365);//得到两个日期相差的大体年数
	//strtotime加上这个年数后得到那日的时间戳后与今日的时间戳相比
	$age=strtotime(substr($idcard,6,8).' +'.$diff.'years')>$today?($diff+1):$diff;
	return $age;
}

echo "age is " . getAgeByIdcard('370883201609180719') . "\n";
?>
