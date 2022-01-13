package com.zhq.controller.shop;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.zhq.common.Global;
import com.zhq.model.backstage.Commodity;
import com.zhq.model.shop.Address;
import com.zhq.model.shop.Classify;
import com.zhq.model.shop.Order;
import com.zhq.model.shop.OrderDetails;
import com.zhq.model.shop.ShopCart;
import com.zhq.model.shop.User;
import com.zhq.service.shop.ClassifyService;
import com.zhq.service.shop.CommodityDisplayService;
import com.zhq.service.shop.OrderService;
import com.zhq.service.shop.UserLoginService;

@Controller
@RequestMapping("/shop/")
public class IndexConeroller {
	@Autowired
	private ClassifyService cs;
	@Autowired
	private CommodityDisplayService cds;
	@Autowired
	private UserLoginService uls;
	@Autowired
	private OrderService OS;

	// 展示商品
	@RequestMapping(value = { "index", "index/" })
	public String list(Map<String, Object> map, Commodity commodity, HttpServletRequest request) {
		System.out.println("进来了");
		List<Classify> test1 = cs.findOne();
		List<Classify> test2 = cs.findTwo();
		List<Classify> test3 = cs.findThree();
		map.put("test1", test1);
		map.put("test2", test2);
		map.put("test3", test3);

		// 读取会话域中的登录用户信息
		HttpSession session = request.getSession();
		User users = (User) session.getAttribute("##current_login_userinformation##");
		System.out.println("登录后读取用户名：" + users.getUsername());
		map.put("users", users);

		// 找到数据库里的商品
		List<Commodity> commoditys = cds.findCom(commodity);
		map.put("commoditys", commoditys);
		return "shop/index";
	}

	// 多级列表
	@GetMapping(value = { "list", "list/" })
	public String list() {
		return "shop/list";
	}

	// 个人中心
	@GetMapping(value = { "information", "information/" })
	public String information(Map<String, Object> map, String loginusername, User user, HttpServletRequest request) {
		// System.out.println(loginusername);

		// 读取会话域中的登录用户信息
		HttpSession session = request.getSession();
		User users = (User) session.getAttribute("##current_login_userinformation##");
		System.out.println("登录后读取用户名：" + users.getUsername());
		map.put("users", users);
		/*user.setUsername(loginusername);
		// System.out.println(user.getUsername());
		// 找到用户信息
		User users = uls.findAll(user);
		// System.out.println("6666 " + users.getRealname());
		// 将用户信息传递
		map.put("users", users);
		map.put("loginname", loginusername);*/

		return "shop/information";
	}

	// 修改个人信息
	@PostMapping(value = { "information", "information/" })
	public ModelAndView submitEdit(HttpServletRequest req, User user,
			@RequestParam(name = "head-pic") MultipartFile file) {
		System.out.println("进来了");
		// System.out.println(user.getUsername());
		// System.out.println(user.getPhone());
		ModelAndView mav = new ModelAndView();

		String uid = UUID.randomUUID().toString();// 保证不重复
		String originalName = file.getOriginalFilename();// 原始文件名
		int lidx = originalName.lastIndexOf(".");
		String ext = originalName.substring(lidx + 1);// 上传文件的扩展名
		// 用户可自定义位置
		String fullName = Global.PICTURE_UPLOAD + "/" + uid + "." + ext;// 文件全名

		File target = new File(fullName);
		try {
			file.transferTo(target);

			user.setHead("/upload/" + uid + "." + ext);
		} catch (IllegalStateException e1) {
			e1.printStackTrace();
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		Boolean success;
		try {
			System.out.println(user.getId());
			success = uls.edituser(user);
		} catch (Exception e) {
			mav.addObject("error", "操作异常");
			mav.addObject("users", user);
			mav.setViewName("shop/information");
			return mav;
		}
		// 如果成功
		if (success) {
			mav.addObject("error", "修改成功");

			mav.addObject("users", user);
			mav.setViewName("shop/information");
			return mav;
		} else {
			mav.addObject("error", "员工修改信息失败");
			mav.addObject("users", user);
			mav.setViewName("shop/information");
			return mav;
		}

	}

	// 跳到购物车
	@GetMapping(value = { "shopcart", "shopcart/" })
	public String toshopcart(Map<String, Object> map, ShopCart shopcart, String loginusername,
			HttpServletRequest request) {

		// System.out.println(loginusername);
		// 读取会话域中的登录用户信息
		HttpSession session = request.getSession();
		User users = (User) session.getAttribute("##current_login_userinformation##");
		System.out.println("登录后读取用户名：" + users.getUsername());
		map.put("users", users);
		shopcart.setUsername(users.getUsername());
		System.out.println(shopcart.getUsername());
		// 找到数据库里的商品
		List<ShopCart> shopcarts = cds.readcart(shopcart);
		map.put("shopcarts", shopcarts);
		map.put("loginname", loginusername);
		return "shop/shopcart";
	}

	// 添加购物车
	// @PostMapping(value = "shopcart", produces = "application/json;charset=utf-8")
	@PostMapping(value = { "shopcart", "shopcart/" }, produces = "application/json;charset=utf-8")
	@ResponseBody
	public String shopcart(ShopCart shopcart, Map<String, Object> map) {
		System.out.println("进来了");

		System.out.println(shopcart.getProId());

		boolean success = cds.savecart(shopcart);
		if (success) {
			map.put("error", "添加成功");
			System.out.println("添加成功");
			return "shop/introduction";

		} else {

			map.put("error", "保存购物车失败");
			return "shop/introduction";
		}

	}

	// 删除购物车
	@PostMapping(value = { "cartdelete", "cartdelete/" }, produces = "application/json;charset=utf-8")
	@ResponseBody
	public Map<String, Object> cartdelete(Integer id) {
		// System.out.println(Arrays.toString(ids));
		System.out.println(id);
		Map<String, Object> resp = new HashMap<>();
		int rows = cds.deleteById(id);
		if (rows > 0) {
			resp.put("success", true);
			resp.put("rows", rows);
		} else {
			resp.put("success", false);
			resp.put("error", "删除数据时异常");
		}
		return resp;
	}

	// 产品介绍
	@GetMapping(value = { "introduction", "introduction/" })
	public String introduction(Integer id, Map<String, Object> map, HttpServletRequest request) {
		System.out.println(id);
		Commodity commodity = cds.findById(Integer.valueOf(id));
		if (commodity == null) {
			// pramg.put("commodity", commodity);
			map.put("error", "商品信息不存在");
			return "shop/index";
		} else {
			/*System.out.println(commodity.getProductID());
			System.out.println(commodity.getComname());
			System.out.println(commodity.getPlace());
			System.out.println(commodity.getMarket());*/
			// 读取会话域中的登录用户信息
			HttpSession session = request.getSession();
			User users = (User) session.getAttribute("##current_login_userinformation##");
			System.out.println("登录后读取用户名：" + users.getUsername());
			map.put("users", users);

			map.put("commo", commodity);
			return "shop/introduction";
		}

	}

	/*public Float tsum;
	public List<OrderDetails> tordds;
	public Address taddress;
	*/
	// 支付请求
	@RequestMapping(value = { "pay", "pay/" })
	public String pay(Integer[] shopId, Integer[] num, Float sum, Map<String, Object> map, ShopCart shopcart,
			Address address) {
		System.out.println("进来支付了");

		// 生成一个订单编号
		final String oid = String.valueOf(System.currentTimeMillis());
		System.out.println("总价" + sum);
		System.out.println("订单编号" + oid);
		// 获取当前时间
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		System.out.println("当前时间" + df.format(new Date()));// new Date()为获取当前系统时间

		System.out.println(shopId.length);
		//
		for (int i = 0; i < shopId.length; i++) {
			// 写入商品详情
			OrderDetails ordd = new OrderDetails();
			System.out.println("商品ID" + shopId[i]);
			System.out.println("此类商品数量" + num[i]);
			// 获取购物车里商品的信息
			shopcart.setProId(shopId[i]);
			ShopCart shopcarts = OS.findByproId(shopcart);
			System.out.println(shopcarts.getShopname());

			// 将商品信息写入详情表
			ordd.setProId(shopcarts.getProId());
			ordd.setOrderId(oid);
			ordd.setPrice(shopcarts.getMarket());
			ordd.setNum(num[i]);
			ordd.setPicture(shopcarts.getPicture());
			ordd.setShopname(shopcarts.getShopname());
			ordd.setZongjia(num[i] * (shopcarts.getMarket()));

			// 保存
			OS.saveOrderDetails(ordd);

		}
		// 一个订单
		Order order = new Order();
		order.setOrderId(oid);
		order.setPrice(sum);
		order.setTime(df.format(new Date()));
		// 收件人和电话和地址还未选择
		OS.saveOrder(order);

		// 读取订单详细信息
		OrderDetails ods = new OrderDetails();
		ods.setOrderId(oid);
		List<OrderDetails> ordds = OS.findOrderDetails(ods);

		map.put("ordds", ordds);
		map.put("orders", order);
		map.put("sum", sum);// 总价
		// 获取地址
		List<Address> addresses = cds.readaddress(address);
		map.put("addresses", addresses);

		return "shop/paymany";
	}

	// 跳到地址页
	@GetMapping(value = { "address", "address/" })
	public String address(Map<String, Object> map, Address address) {

		List<Address> addresses = cds.readaddress(address);
		map.put("addresses", addresses);

		return "shop/address";
	}

	// 增加地址请求
	@PostMapping(value = { "address", "address/" }, produces = "application/json;charset=utf-8")
	@ResponseBody
	public String addressadd(Address address, Map<String, Object> map) {
		System.out.println("增加地址");
		System.out.println(address.getUsername());
		System.out.println(address.getCity());
		System.out.println(address.getPhone());
		boolean success = cds.saveaddress(address);
		if (success) {
			map.put("success", true);
			System.out.println("添加成功");
			return "redirect:address";

		} else {

			map.put("success", false);
			return "shop/address";
		}

	}
}
