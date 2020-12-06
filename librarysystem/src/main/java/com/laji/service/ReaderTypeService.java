package com.laji.service;

import java.util.List;

import com.laji.domain.ReaderType;
import com.laji.utils.DataGridView;
import com.laji.vo.ReaderTypeVo;

public interface ReaderTypeService {

	DataGridView queryAllReaderType(ReaderTypeVo readerTypeVo);

	void addReaderType(ReaderTypeVo readerTypeVo);

	void updateReaderType(ReaderTypeVo readerTypeVo);

	void deleteReaderType(Integer readertypeId);

	List<ReaderType> loadAllReaderTypeName();

}
