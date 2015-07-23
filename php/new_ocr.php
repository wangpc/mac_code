#!/usr/bin/php
<?php
	// if(isset( $_FILES['image'] )){
		$ch = curl_init();
		$url = 'http://apis.baidu.com/apistore/idlocr/ocr';
		$header = array(
			'Content-Type:application/x-www-form-urlencoded',
			'apikey:26530e4fbcb99bfcdaf4aedb21d50805',
		);


		//测试本地文件
		// $data = file_get_contents('/Users/wangpc/mycode/php/2029.jpg',true);


		//测试远程文件
		$data_temp = file_get_contents("https://www.ezubo.com/Member/common/verify?t=1437459291704");


		$data_temp = base64_encode($data_temp);
		$data_temp = urlencode($data_temp);
		$data = "fromdevice=pc&clientip=10.10.10.0&detecttype=LocateRecognize&languagetype=CHN_ENG&imagetype=1&image=".$data_temp;


		echo "文件".$data;




		// 添加apikey到header
		curl_setopt($ch, CURLOPT_HTTPHEADER , $header);
		// 添加参数
		curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
		// 执行HTTP请求
		curl_setopt($ch , CURLOPT_URL , $url);
		$res = curl_exec($ch);


		$temp_var = json_decode($res,true);


		//echo "返回到的结果是：";var_dump($temp_var);
		//var_dump($data);


		if($temp_var["errNum"] == 0){
			$temp = $temp_var["retData"][0];
			echo "识别到的文字是:".$temp["word"];
			//echo "识别到的数组是:";var_dump($temp);
		}
		else{
			echo "识别出错:".$temp_var["errMsg"];
		}
	// }else{
		// echo "请输入要识别的图片";
	// }


?>


