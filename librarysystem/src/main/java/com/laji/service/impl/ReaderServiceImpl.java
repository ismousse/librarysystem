package com.laji.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.laji.domain.Reader;
import com.laji.mapper.ReaderMapper;
import com.laji.service.ReaderService;
import com.laji.utils.DataGridView;
import com.laji.vo.ReaderVo;

@Service
public class ReaderServiceImpl implements ReaderService{

	@Autowired
	private ReaderMapper readerMapper;
	
	@Override
	public DataGridView queryAllReader(ReaderVo readerVo) {
		Page<Object> page = PageHelper.startPage(readerVo.getPage(), readerVo.getLimit());
		List<Reader> data = this.readerMapper.queryAllReader(readerVo);
		return new DataGridView(page.getTotal(), data);
	}

	@Override
	public void addReader(ReaderVo readerVo) {
		this.readerMapper.insertSelective(readerVo);
	}

	@Override
	public void updateReader(ReaderVo readerVo) {
		this.readerMapper.updateByPrimaryKeySelective(readerVo);
	}

	@Override
	public void deleteReader(Integer readerId) {
		this.readerMapper.deleteByPrimaryKey(readerId);
	}

	@Override
	public void deleteBatchReader(Integer[] ids) {
		for (Integer rid : ids) {
			this.deleteReader(rid);
		}
	}

	@Override
	public String findLastNumber(String barcode) {
		return this.readerMapper.findLastNumber(barcode);
	}

	@Override
	public Integer queryNumberByBarcode(String readerId) {
		return this.readerMapper.queryNumberByBarcode(readerId);
	}

}
