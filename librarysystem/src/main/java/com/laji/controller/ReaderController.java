package com.laji.controller;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.laji.domain.Admin;
import com.laji.domain.Reader;
import com.laji.domain.ReaderType;
import com.laji.service.ReaderService;
import com.laji.utils.DataGridView;
import com.laji.utils.ResultObj;
import com.laji.utils.WebUtils;
import com.laji.vo.ReaderVo;

@RestController
@RequestMapping("reader")
public class ReaderController {
	
	@Autowired
	private ReaderService readerService;

	/**
	 * 加载读者列表返回DataGridView
	 */
	@RequestMapping("loadAllReader")
	public DataGridView loadAllReader(ReaderVo readerVo) {
		return this.readerService.queryAllReader(readerVo);
	}

	/**
	 * 添加读者
	 */
	@RequestMapping("addReader")
	public ResultObj addReader(ReaderVo readerVo) {
		try {
			Date date = new Date();
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMdd");
			String barcode = simpleDateFormat.format(date);
			//得到今天上一个人的四位数 没有上一个人就从0001开始
			String lastBarcode = readerService.findLastNumber(barcode);
			if(lastBarcode == null || "".equals(lastBarcode)) {
				barcode = barcode + "0001";
			}else {
				DecimalFormat decimalFormat = new DecimalFormat("0000");
				barcode = barcode + decimalFormat.format((Integer.parseInt(lastBarcode.substring(8)) + 1));
			}
			readerVo.setBarcode(barcode);
			readerVo.setCreatetime(date);
			Admin admin = (Admin) WebUtils.getHttpSession().getAttribute("admin");
			readerVo.setOperator(admin.getUsername());
			this.readerService.addReader(readerVo);
			return ResultObj.ADD_SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return ResultObj.ADD_ERROR;
		}
	}
	
	/**
	 * 修改读者
	 */
	@RequestMapping("updateReader")
	public ResultObj updateReader(ReaderVo readerVo) {
		try {
			this.readerService.updateReader(readerVo);
			return ResultObj.UPDATE_SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return ResultObj.UPDATE_ERROR;
		}
	}
	
	/**
	 * 删除读者
	 */
	@RequestMapping("deleteReader")
	public ResultObj deleteReader(ReaderVo readerVo) {
		try {
			this.readerService.deleteReader(readerVo.getReaderId());
			return ResultObj.DELETE_SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return ResultObj.DELETE_ERROR;
		}
	}
	
	/**
	 * 批量删除读者
	 */
	@RequestMapping("deleteBatchReader")
	public ResultObj deleteBatchReader(ReaderVo readerVo) {
		try {
			this.readerService.deleteBatchReader(readerVo.getIds());
			return ResultObj.DELETE_SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return ResultObj.DELETE_ERROR;
		}
	}
}
