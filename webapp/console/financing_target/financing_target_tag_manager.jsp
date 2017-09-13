<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="zh-CN">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta charset="utf-8">
<link href="https://cdn.bootcss.com/bootstrap/2.3.2/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="../../static/bootstrap-switch/css/bootstrap3/bootstrap-switch.min.css">
<style type="text/css">
body {
	margin: 20px;
}

.bootstrap-switch .bootstrap-switch-handle-off, .bootstrap-switch .bootstrap-switch-handle-on,
	.bootstrap-switch .bootstrap-switch-label {
	line-height: 10px;
}

.tagIcon {
	height: 25px;
}
</style>
</head>
<body>
	<table class="table">
		<thead>
			<tr>

				<th>icon</th>
				<th>标记</th>
				<th>描述</th>
				<th>状态</th>
			</tr>
		</thead>

		<tbody>
			<tr>

				<td><img class="tagIcon" src="../../static/imgs/act_regist.png" /></td>
				<td>注册-体验金</td>
				<td>注册体验金活动会自动购买的标的</td>
				<td>
					<div class="switch switch-large">
						<input class="switchBox" type="checkbox" value="ACT_REGIST" />
					</div>
				</td>
			</tr> 
			<tr>
				<td><img class="tagIcon" src="../../static/imgs/act_first_buy.png" /></td>
				<td>下单-体验金</td>
				<td>下单体验金活动会自动购买的标的</td>
				<td>
					<div class="switch switch-large">
						<input class="switchBox" type="checkbox" value="ACT_FIRST_BUY" />
					</div>
				</td>
			</tr>
			<tr>
				<td><img class="tagIcon" src="../../static/imgs/act_invite.png" /></td>
				<td>推广-体验金</td>
				<td>推广活动会自动购买的标的</td>
				<td>
					<div class="switch switch-large">
						<input class="switchBox" type="checkbox" value="ACT_INVITE" />
					</div>
				</td>
			</tr>
			<tr>
				<td><img class="tagIcon" src="../../static/imgs/act_invite.png" /></td>
				<td>收益自动买</td>
				<td>体验金收益自动购买的产品</td>
				<td>
					<div class="switch switch-large">
						<input class="switchBox" type="checkbox" value="PROFIT_AUTOBUY" />
					</div>
				</td>
			</tr>
			<tr>
				<td><img class="tagIcon" src="../../static/imgs/act_invite.png" /></td>
				<td>定期转活期</td>
				<td>定期转活期,自动购买</td>
				<td>
					<div class="switch switch-large">
						<input class="switchBox" type="checkbox" value="FIX_BID_2_DEMAND" />
					</div>
				</td>
			</tr>
			<tr>
				<td><img class="tagIcon" src="../../static/imgs/act_invite.png" /></td>
				<td>绑卡</td>
				<td>用于绑卡时的1元下单用</td>
				<td>
					<div class="switch switch-large">
						<input class="switchBox" type="checkbox" value="BIND_CARD" />
					</div>
				</td>
			</tr>
			<tr>
				<td><img class="tagIcon" src="../../static/imgs/act_invite.png" /></td>
				<td>邀请注册-体验金</td>
				<td>邀请注册自动购买的标的</td>
				<td>
					<div class="switch switch-large">
						<input class="switchBox" type="checkbox" value="INVITE_REGIST" />
					</div>
				</td>
			</tr>
			<tr>
				<td><img class="tagIcon" src="../../static/imgs/act_invite.png" /></td>
				<td>邀请人福利标 > 1(任意金额)</td>
				<td>首次购买> 1邀请人福利标</td>
				<td>
					<div class="switch switch-large">
						<input class="switchBox" type="checkbox" value="INVITE_LESS_5000" />
					</div>
				</td>
			</tr>
			<tr>
				<td><img class="tagIcon" src="../../static/imgs/act_invite.png" /></td>
				<td>邀请人福利标 5000 ~ 1000</td>
				<td>首次购买> 5000 ~ 1000邀请人福利标</td>
				<td>
					<div class="switch switch-large">
						<input class="switchBox" type="checkbox" value="INVITE_MORE_5000" />
					</div>
				</td>
			</tr>
			<tr>
				<td><img class="tagIcon" src="../../static/imgs/act_invite.png" /></td>
				<td>邀请人福利标 > 10000</td>
				<td>首次购买> 10000邀请人福利标</td>
				<td>
					<div class="switch switch-large">
						<input class="switchBox" type="checkbox" value="INVITE_10000" />
					</div>
				</td>
			</tr>
			<tr>
				<td><img class="tagIcon" src="../../static/imgs/act_invite.png" /></td>
				<td>购买送现金券</td>
				<td>首次购买该标的送现金券</td>
				<td>
					<div class="switch switch-large">
						<input class="switchBox" type="checkbox" value="BUY_GIVE_COUPON" />
					</div>
				</td>
			</tr>
			<tr>
				<td><img class="tagIcon" src="../../static/imgs/act_invite.png" /></td>
				<td>活动加息标</td>
				<td>运营活动上显示的加息标的</td>
				<td>
					<div class="switch switch-large">
						<input class="switchBox" type="checkbox" value="ACTIVITY_INCRRATE" />
					</div>
				</td>
			</tr>
			<tr>
				<td><img class="tagIcon" src="../../static/imgs/act_invite.png" /></td>
				<td>活动-体验金</td>
				<td>运营活动自动送出的体验金</td>
				<td>
					<div class="switch switch-large">
						<input class="switchBox" type="checkbox" value="TAG_ACT_EXPR" />
					</div>
				</td>
			</tr>
			
<!-- 
			<tr>
				<td><img class="tagIcon" src="../../static/imgs/test.png" /></td>
				<td>红包标</td>
				<td>自动购买红包标</td>
				<td>
					<div class="switch switch-large">
						<input class="switchBox" type="checkbox" value="hong_bao" />
					</div>
				</td>
			</tr>
			<tr>
				<td><img class="tagIcon" src="../../static/imgs/test.png" /></td>
				<td>新手标</td>
				<td>开启后会在前台显示新手标标识</td>
				<td>
					<div class="switch switch-large">
						<input class="switchBox" type="checkbox" value="new_register" />
					</div>
				</td>
			</tr>
			<tr>
				<td><img class="tagIcon" src="../../static/imgs/test.png" /></td>
				<td>Hot(热门)</td>
				<td>开启后会在前台显示Hot标识</td>
				<td>
					<div class="switch switch-large">
						<input class="switchBox" type="checkbox" value="hot" />
					</div>
				</td>
			</tr>
 -->
		</tbody>
	</table>




	<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
	<script src="../../static/bootstrap2/js/bootstrap.min.js"></script>
	<script src="../../static/bootstrap-switch/docs/js/highlight.js"></script>
	<script src="../../static/bootstrap-switch/js/bootstrap-switch.min.js"></script>
	<script type="text/javascript">
		$(function() {

			$("input[type=\"checkbox\"]").bootstrapSwitch();

			$.post("find_tag.htm", {
				t : new Date(),
				financingTargetId : "${param.id}"
			}, function(tagList) {
				var tags = {};
				for ( var i in tagList) {
					tags[tagList[i].tag] = true;
				}
				var switchs = $("input[type=\"checkbox\"]");
				for (var i = 0; i < switchs.length; i++) {
					if (tags[$(switchs[i]).val()]) {
						$(switchs[i]).bootstrapSwitch("state", true);
					} else {
						$(switchs[i]).bootstrapSwitch("state", false);
					}
				}

				$("input[type=\"checkbox\"]").on('switchChange.bootstrapSwitch', function(event, state) {
					if (state) {
						$.post("enable_tag.htm", {
							t : new Date(),
							tag : $(this).val(),
							financingTargetId : "${param.id}"
						}, function(rs) {
							if (!rs.success) {
								alert("出错了");
							}
						}, "json");
					} else {
						$.post("disable_tag.htm", {
							t : new Date(),
							tag : $(this).val(),
							financingTargetId : "${param.id}"
						}, function(rs) {
							if (!rs.success) {
								alert("出错了");
							}
						}, "json");
					}
				});

			}, "json");

		});
	</script>
</body>
</html>


