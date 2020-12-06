package com.laji.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.laji.domain.ReaderType;
import com.laji.service.ReaderTypeService;
import com.laji.utils.DataGridView;
import com.laji.utils.ResultObj;
import com.laji.vo.ReaderTypeVo;

@RestController
@RequestMapping("readertype")
public class ReaderTypeController {
	@Autowired
	private ReaderTypeService readerTypeService;

	/**
	 * 加载读者分类列表返回DataGridView
	 */
	@RequestMapping("loadAllReaderType")
	public DataGridView loadAllReader(ReaderTypeVo readerTypeVo) {
		return this.readerTypeService.queryAllReaderType(readerTypeVo);
	}

	/**
	 * 加载所有分类名称
	 */
	@RequestMapping("loadAllReaderTypeName")
	public List<ReaderType> loadAllReaderTypeName() {
		return this.readerTypeService.loadAllReaderTypeName();
	}
	
	/**
	 * 添加读者分类
	 */
	@RequestMapping("addReaderType")
	public ResultObj addReaderType(ReaderTypeVo readerTypeVo) {
		try {
			this.readerTypeService.addReaderType(readerTypeVo);
			return ResultObj.ADD_SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return ResultObj.ADD_ERROR;
		}
	}
	
	/**
	 * 修改读者分类
	 */
	@RequestMapping("updateReaderType")
	public ResultObj updateReaderType(ReaderTypeVo readerTypeVo) {
		try {
			this.readerTypeService.updateReaderType(readerTypeVo);
			return ResultObj.UPDATE_SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return ResultObj.UPDATE_ERROR;
		}
	}
	
	/**
	 * 删除读者分类
	 */
	@RequestMapping("deleteReaderType")
	public ResultObj deleteReaderType(ReaderTypeVo readerTypeVo) {
		try {
			this.readerTypeService.deleteReaderType(readerTypeVo.getReadertypeId());
			return ResultObj.DELETE_SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return ResultObj.DELETE_ERROR;
		}
	}
}
