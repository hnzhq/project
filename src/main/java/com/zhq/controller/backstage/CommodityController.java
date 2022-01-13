package com.zhq.controller.backstage;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

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
import com.zhq.service.backstage.CommodityService;

@Controller
@RequestMapping("/backstage/")
public class CommodityController {
	@Autowired
	private CommodityService cs;

	// 产品列表
	/*@GetMapping(value = { "Products_List", "Products_List/" })
	public String toProductsList() {
		return "backstage/Products_List";
	}*/
	/**
	 * 展示产品
	 * 
	 * @param map
	 * @return
	 */
	@RequestMapping("Products_List")
	public String list(Map<String, Object> map, Commodity commodity) {

		List<Commodity> commoditys = cs.findAll(commodity);

		// System.out.println(commoditys.size());
		map.put("commoditys", commoditys);
		return "backstage/Products_List";
	}

	// 添加商品,添加广告
	@GetMapping(value = { "picture-add", "picture-add/" })
	public String toadd() {
		return "backstage/picture-add";
	}

	// MultipartFile file 用于上传文件
	// @RequestParam(name = "picture") 名字不一样可以用来指定
	@PostMapping(value = { "picture-add", "picture-add/" })
	public String add(Commodity commodity, Map<String, Object> map,
			@RequestParam(name = "picture-pic") MultipartFile file) {

		if (commodity.getProductID() == null || commodity.getProductID().trim().length() == 0) {
			map.put("error", "商品编号不允许为空");
			return "backstage/picture-add";
		}

		// 根据电脑随机生成一个数,保证不重复，36位随机数
		String uid = UUID.randomUUID().toString();
		// 原始文件名
		String originalName = file.getOriginalFilename();
		// 源文件扩展名
		int lidx = originalName.lastIndexOf(".");
		String ext = originalName.substring(lidx + 1);// 文件扩展名

		// 使用自定义路径
		String fullName = Global.PICTURE_UPLOAD + "/" + uid + "." + ext;
		System.out.println(fullName);
		File target = new File(fullName);
		try {
			file.transferTo(target);
			commodity.setPicture("/upload/" + uid + "." + ext);
			System.out.println(commodity.getPicture());
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		System.out.println(commodity.getPicture());
		boolean success = cs.save(commodity);
		if (success) {

			return "redirect:Products_List";

		} else {
			map.put("error", "保存数据失败");
			return "backstage/picture-add";
		}

	}

	// 删除商品
	@PostMapping(value = "/delete", produces = "application/json;charset=utf-8")
	@ResponseBody
	public Map<String, Object> delete(Integer[] ids) {
		// System.out.println(Arrays.toString(ids));
		Map<String, Object> resp = new HashMap<>();
		int rows = cs.deleteByIds(ids);
		if (rows > 0) {
			resp.put("success", true);
			resp.put("rows", rows);
		} else {
			resp.put("success", false);
			resp.put("error", "删除数据时异常");
		}
		return resp;
	}

	// 修改商品,添加广告
	@GetMapping(value = { "picture-edit", "picture-edit/" })
	public String toedit(Integer id, Map<String, Object> pramg) {
		System.out.println(id);
		if (id == null) {
			pramg.put("error", "未选中信息");
			return "backstage/picture-edit";
		}
		Commodity commodity = cs.findById(Integer.valueOf(id));

		if (commodity == null) {
			// pramg.put("commodity", commodity);
			pramg.put("error", "要修改的员工信息不存在");
			return "backstage/picture-edit";
		} else {
			/*System.out.println(commodity.getProductID());
			System.out.println(commodity.getComname());
			System.out.println(commodity.getPlace());
			System.out.println(commodity.getMarket());*/
			pramg.put("commodity", commodity);
			return "backstage/picture-edit";
		}

	}

	@PostMapping(value = { "picture-edit", "picture-edit/" })
	public ModelAndView submitEdit(HttpServletRequest req, Commodity commodity,
			@RequestParam(name = "picture-pic") MultipartFile file) {

		ModelAndView mav = new ModelAndView();
		if (commodity.getProductID() == null || commodity.getProductID().trim().length() == 0) {
			mav.addObject("error", "商品编号不允许为空");
			mav.addObject("commodity", commodity);
			mav.setViewName("backstage/picture-edit");
			return mav;
		}
		String uid = UUID.randomUUID().toString();// 保证不重复
		String originalName = file.getOriginalFilename();// 原始文件名
		int lidx = originalName.lastIndexOf(".");
		String ext = originalName.substring(lidx + 1);// 上传文件的扩展名
		// 用户可自定义位置
		String fullName = Global.PICTURE_UPLOAD + "/" + uid + "." + ext;// 文件全名

		File target = new File(fullName);
		try {
			file.transferTo(target);
			commodity.setPicture("/upload/" + uid + "." + ext);
		} catch (IllegalStateException e1) {
			e1.printStackTrace();
		} catch (IOException e1) {
			e1.printStackTrace();
		}

		Boolean success;
		try {
			System.out.println(commodity.getId());
			success = cs.update(commodity);
		} catch (Exception e) {
			mav.addObject("error", "操作异常");
			mav.addObject("commodity", commodity);
			mav.setViewName("backstage/picture-edit");
			return mav;
		}
		// 如果成功
		if (success) {
			mav.setViewName("redirect:Products_List");
			return mav;
		} else {
			mav.addObject("error", "员工修改信息失败");
			mav.addObject("commodity", commodity);
			mav.setViewName("backstage/picture-edit");
			return mav;
		}

	}

}
