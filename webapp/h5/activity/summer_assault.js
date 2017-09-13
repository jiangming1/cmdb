
function doshare(webPath,shareurl){	
	wx.onMenuShareAppMessage({
		title : '要理财,来存吧!', // 分享标题
		desc : '来存吧票据理财,注册即送18888元理财金,新手宝7天年化收益率达20%!100万小伙伴的选择,让你的每笔财富增值!', // 分享描述
		link :shareurl, // 分享链接
		imgUrl : 'http://8.laicunba.com/h5/activity/img/summeractivitylogo.jpg', // 分享图标
		type : '', // 分享类型,music、video或link，不填默认为link
		dataUrl : '', // 如果type是music或video，则要提供数据链接，默认为空
		success : function() {
			//$("#shareForm").submit();
			// 用户确认分享后执行的回调函数
		},
		cancel : function() {
			// 用户取消分享后执行的回调函数
		}
	});

	wx.onMenuShareTimeline({
		title : '要理财,来存吧!来存吧票据理财,注册即送18888元理财金,新手宝7天年化收益率达20%!100万小伙伴的选择,让你的每笔财富增值!', // 分享标题
		link : shareurl, // 分享链接
		imgUrl : 'http://8.laicunba.com/h5/activity/img/summeractivitylogo.jpg', // 分享图标
		success : function() {
			$("#shareForm").submit();
			// 用户确认分享后执行的回调函数
			
		},
		cancel : function() {
			// 用户取消分享后执行的回调函数
			
		}
	});
	
	wx.onMenuShareQQ({
	    title: '要理财,来存吧!', // 分享标题
	    desc: '来存吧票据理财,注册即送18888元理财金,新手宝7天年化收益率达20%!100万小伙伴的选择,让你的每笔财富增值!', // 分享描述
	    link: shareurl, // 分享链接
	    imgUrl: 'http://8.laicunba.com/h5/activity/img/summeractivitylogo.jpg', // 分享图标
	    success : function() {
	    	//$("#shareForm").submit();
			// 用户确认分享后执行的回调函数
			
		},
		cancel : function() {
			// 用户取消分享后执行的回调函数
			
		}
	});
	
	wx.onMenuShareQZone({
	    title: '要理财,来存吧!', // 分享标题
	    desc: '来存吧票据理财,注册即送18888元理财金,新手宝7天年化收益率达20%!100万小伙伴的选择,让你的每笔财富增值!', // 分享描述
	    link: shareurl, // 分享链接
	    imgUrl: 'http://8.laicunba.com/h5/activity/img/summeractivitylogo.jpg', // 分享图标
	    success : function() {
	    	//$("#shareForm").submit();
			// 用户确认分享后执行的回调函数
			
		},
		cancel : function() {
			// 用户取消分享后执行的回调函数
			
		}
	});
	
	wx.onMenuShareWeibo({
	    title: '要理财,来存吧!', // 分享标题
	    desc: '来存吧票据理财,注册即送18888元理财金,新手宝7天年化收益率达20%!100万小伙伴的选择,让你的每笔财富增值!', // 分享描述
	    link: shareurl, // 分享链接
	    imgUrl: 'http://8.laicunba.com/h5/activity/img/summeractivitylogo.jpg', // 分享图标
	    success: function () { 
	       // 用户确认分享后执行的回调函数
	    },
	    cancel: function () { 
	        // 用户取消分享后执行的回调函数
	    }
	});

	}