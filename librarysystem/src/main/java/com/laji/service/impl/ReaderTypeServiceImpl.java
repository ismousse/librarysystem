package com.laji.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.laji.domain.ReaderType;
import com.laji.mapper.ReaderTypeMapper;
import com.laji.service.ReaderTypeService;
import com.laji.utils.DataGridView;
import com.laji.vo.ReaderTypeVo;

@Service
public class ReaderTypeServiceImpl implements ReaderTypeService {
	
	@Autowired
	private ReaderTypeMapper readerTypeMapper;

	@Override
	public DataGridView queryAllReaderType(ReaderTypeVo readerTypeVo) {
		Page<Object> page = PageHelper.startPage(readerTypeVo.getPage(), readerTypeVo.getLimit());
		List<ReaderType> data = this.readerTypeMapper.queryAllReaderType(readerTypeVo);
		return new DataGridView(page.getTotal(), data);
	}

	@Override
	public void addReaderType(ReaderTypeVo readerTypeVo) {
		this.readerTypeMapper.addReaderType(readerTypeVo);
	}

	@Override
	public void updateReaderType(ReaderTypeVo readerTypeVo) {
		this.readerTypeMapper.updateReaderType(readerTypeVo);
	}

	@Override
	public void deleteReaderType(Integer readertypeId) {
		this.readerTypeMapper.deleteReaderType(readertypeId);
	}

	@Override
	public List<ReaderType> loadAllReaderTypeName() {
		List<ReaderType> data = this.readerTypeMapper.loadAllReaderTypeName();
		return data;
	}

}
