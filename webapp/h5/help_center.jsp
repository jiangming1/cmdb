<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="zh-CN">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>帮助中心</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp">
<link rel="stylesheet" type="text/css" href="css/mycss.css">
<script src="js/jquery.min.js"></script>
</head>
<body style="background: #F2F2F4;">
<c:if test="${param.device==null||param.device=='' }">
<div class="backBar">
    <table>
        <tbody>
            <tr>
               <td style="width:50px;"><a href="my_account.htm?tab=account&t=<%=new Date()%>"><img src="img/icon_fanhui.png" style="height: 40px;"></a></td>
               <td>常见问题</td>
               <td style="width:50px;"></td>            
            </tr>
        </tbody>
    </table>
</div>
</c:if>
<div class="help_con">
     <div class="help-title">
	      <table class="tab-question">
	             <tr>
	                <td class="td-left">1、</td>
	                <td>注册收不到短信验证码怎么办？</td>
	                <td class="add-tips"></td>
	             </tr>
	      </table>
	      <table class="tab-answer">
           <tr>
              <td class="ver-top">答：</td>
              <td>在确认手机号码输入正确后，重新获取手机验证码，进行注册；若长时间收不到验证码，请致电客服电话<a href="tel:4006191520">400-6191-520</a>。</td>
           </tr>
    </table>
    </div>
    
    <div class="help-title">
	      <table class="tab-question">
	             <tr>
	                <td class="td-left">2、</td>
	                <td>登录时忘记密码怎么办？</td>
	                <td class="add-tips"></td>
	             </tr>
	      </table>
	      <table class="tab-answer">
           <tr>
               <td class="ver-top">答：</td>
               <td>请在【登录页面】点击【忘记密码】，重新获取手机验证码，进行修改。</td>
           </tr>         
    </table>
    </div>
    
    <div class="help-title">
	      <table class="tab-question">
	             <tr>
	                <td class="td-left"><div>3、</div></td>
	                <td>定期理财【银票宝】什么时候开始计息（起息）？</td>
	                <td class="add-tips"></td>
	             </tr>
	      </table>
	      <table class="tab-answer">
           <tr>
               <td class="ver-top">答：</td>
               <td>【银票宝】交易规则是T+0，即购买当日计息。</td>
           </tr>         
    </table>
    </div>
    
    <div class="help-title">
	      <table class="tab-question">
	             <tr>
	                <td class="td-left">4、</td>
	                <td>活期理财【随存宝】什么时候开始计息（起息）？</td>
	                <td class="add-tips"></td>
	             </tr>
	      </table>
	      <table class="tab-answer">
           <tr>
               <td class="ver-top">答：</td>
               <td>【随存宝】交易规则是T+1，即购买的第二天开始计息。</td>
           </tr>         
    </table>
    </div>
    
    <div class="help-title">
	      <table class="tab-question">
	             <tr>
	                <td class="td-left">5、</td>
	                <td>来存吧提现有手续费吗？</td>
	                <td class="add-tips"></td>
	             </tr>
	      </table>
	      <table class="tab-answer">
           <tr>
               <td class="ver-top">答：</td>
               <td>没有，来存吧交易不收取任何手续费。</td>
           </tr>         
    </table>
    </div>
    
    <div class="help-title">
	      <table class="tab-question">
	             <tr>
	                <td class="td-left">6、</td>
	                <td>【随存宝】提现申请提交后，几天可以到账？</td>
	                <td class="add-tips"></td>
	             </tr>
	      </table>
	      <table class="tab-answer">
           <tr>
               <td class="ver-top">答：</td>
               <td>周一0点至周四24点期间申请提现，还款时间为申请日的第二天；周五0点至周日24点期间申请提现，还款时间为下周一。
注：如遇节假日，还款时间将顺延至上班后的第一个工作日。</td>
           </tr>         
    </table>
    </div>
    
<!--    <h5>7、定期理财【银票宝】怎么提现？多久能到账？</h5> -->
<!--    <p>答：【银票宝】不需要提现，到期后本息自动返还至绑定银行卡，结息日的下个工作日到账。</p> -->
    <div class="help-title">
	      <table class="tab-question">
	             <tr>
	                <td class="td-left">7、</td>
	                <td>【银票宝】提现几天可以到账？</td>
	                <td class="add-tips"></td>
	             </tr>
	      </table>
	      <table class="tab-answer">
           <tr>
               <td class="ver-top">答：</td>
               <td>银票宝不需要提现，到期本息自动返还绑定银行卡。工作日到期，当日24:00前到账；非工作日到期，顺延至工作日24:00前到账。</td>
           </tr>         
    </table>
    </div>
    
    <div class="help-title">
	      <table class="tab-question">
	             <tr>
	                <td class="td-left">8、</td>
	                <td>来存吧可以绑定哪些银行卡？</td>
	                <td class="add-tips"></td>
	             </tr>
	      </table>
	      <table class="tab-answer">
           <tr>
               <td class="ver-top">答：</td>
               <td>来存吧支持15家主要银行的银行卡，包括中国工商银行、中国农业银行、中国银行、中国建设银行、中国邮政储蓄银行、平安银行、民生银行、光大银行、广发银行、中信银行、兴业银行、华夏银行、中国交通银行、招商银行、浦发银行。</td>
           </tr>         
    </table>
    </div>
    
    <div class="help-title">
	      <table class="tab-question">
	             <tr>
	                <td class="td-left">9、</td>
	                <td>注册手机号码与银行预留手机号码不一致可以购买理财产品吗？</td>
	                <td class="add-tips"></td>
	             </tr>
	      </table>
	      <table class="tab-answer">
           <tr>
               <td class="ver-top">答：</td>
               <td>不可以，为了用户资金安全，来存吧会对注册手机号码、银行预留手机号码、身份证、用户姓名进行四重验证，通过四重安全验证才能进行购买。</td>
           </tr>         
    </table>
    </div>
    
    <div class="help-title">
	      <table class="tab-question">
	             <tr>
	                <td class="td-left">10、</td>
	                <td>银行卡解绑/换卡需提供哪些资料？</td>
	                <td class="add-tips"></td>
	             </tr>
	      </table>
	      <table class="tab-answer">
           <tr>
               <td class="ver-top">答：</td>
               <td>  解绑/更换银行卡需提供的资料： 1.注册手机号；
2.提供身份证正反面、新银行卡照片；
3.提供本人与身份证、新银行卡的合照；
4.若是因原银行卡丢失换卡，需提供原银行卡的挂失证明和新卡的开户证明；
5.若是因不支持代扣或其他情况换卡，需提供原银行卡、原银行卡的交易流水。  
 注：解绑无需提供新的银行卡。
                发送至<a href="mailto: service@laicunba.com">service@laicunba.com</a>，来存吧将在一个工作日内完成解绑</td>
           </tr>         
          </table>
    </div>
    
</div>
<script src="js/jquery.min.js"></script>
<script>
$(function(){
	$(".add-tips").append("<img src='img/btn-triangle-a.png' style='width: 16px;'>")
	$(".help-title").click(function(){
		$(this).find(".tab-answer").toggle(); 
		var tipsA=$(this).find(".add-tips").find("img").attr("src");
		if(tipsA=="img/btn-triangle-a.png"){
			$(this).find(".add-tips").find("img").attr("src","img/btn-triangle-h.png");
		}else{
			$(this).find(".add-tips").find("img").attr("src","img/btn-triangle-a.png");
		}		
	});
})
</script>
</body>
</html>