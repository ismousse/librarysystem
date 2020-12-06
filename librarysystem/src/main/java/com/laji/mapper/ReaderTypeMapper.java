package com.laji.mapper;

import java.util.List;

import com.laji.domain.ReaderType;
import com.laji.vo.ReaderTypeVo;

public interface ReaderTypeMapper {

	List<ReaderType> queryAllReaderType(ReaderTypeVo readerTypeVo);

	void addReaderType(ReaderTypeVo readerTypeVo);

	void updateReaderType(ReaderTypeVo readerTypeVo);

	void deleteReaderType(Integer readertypeId);

	List<ReaderType> loadAllReaderTypeName();

}
